#include "RawUartMsg.h"
#include "msp430quantoconsts.h"

/* Define COUNT_LOG to log the sequential number of the event
 * to the log instead of the icount value */

/* STATUS: keeps logging exit_interrupt from the UART interrupt */

module QuantoLogMyUartWriterP {
    uses {
        //interface SingleActivityResourceTrack[uint8_t global_res_id];
        interface MultiActivityResourceTrack[uint8_t global_res_id];
        interface PowerStateTrack[uint8_t global_res_id];

        interface Counter<T32khz,uint32_t> as Counter;
        interface EnergyMeter;

        interface PortWriter;
        interface Boot;

        interface TaskQuanto as PrepareWriteTask;

        interface Init as WriterInit;
        interface SplitControl as WriterControl;
    }
}
implementation {
    enum {
        BUFFERSIZE = 128,
    };

    enum {S_STOPPED, S_STARTED};
#ifdef COUNT_LOG
    uint32_t count;
#endif
    static act_t m_act_idle;
    static act_t act_quanto_log;
    
    nx_entry_t xe;
    entry_t* m_w_entry;

    entry_t buf[BUFFERSIZE];
    uint16_t m_head; //remove from head
    uint16_t m_tail; //insert at tail
    uint16_t m_size;    

    uint8_t m_state = S_STOPPED;

    uint8_t s_masking_int = 0;
     
    inline uint8_t ignoreInterrupt(act_t act) {
        act_t a = act & ACT_TYPE_MASK;
        return (a == QUANTO_ACTIVITY(PXY_UART1TX));
    } 

    event void Boot.booted() {
        atomic {
            m_size = 0;
            m_head = 0;
            m_tail = 0;
            m_act_idle = mk_act_local(QUANTO_ACTIVITY(IDLE));
            act_quanto_log = mk_act_local(QUANTO_ACTIVITY(QUANTO_WRITER));
#ifdef COUNT_LOG
            count = 0;
#endif
        }
        call WriterInit.init();
        call WriterControl.start();
    } 
    
    event void WriterControl.startDone(error_t result) {
        if (result != SUCCESS) {
            call WriterControl.start();
            return;
        }
        atomic m_state = S_STARTED;   
    }

    event void WriterControl.stopDone(error_t result) {
        atomic m_state = S_STOPPED;
    }
    
    inline void 
    recordChange(uint8_t id, uint16_t value, uint8_t type) {
        entry_t *e = NULL;
        uint8_t to_write = FALSE;
        if (m_state != S_STARTED) {
            return;
        }
        atomic {
#ifdef COUNT_LOG
            count++;
#endif
            if (m_size < BUFFERSIZE) {
                e = &buf[m_tail];
                m_tail = (m_tail + 1) % BUFFERSIZE;
                m_size++;
                if ((to_write = (m_size == 1))) {
                    m_w_entry = e;
                }
            }
        }
        if (e != NULL) {

            e->time  = call Counter.get();
#ifndef COUNT_LOG
            e->ic    = call EnergyMeter.read();
#else
            e->ic = count;
#endif
            e->type = type;
            e->res_id = id;
            e->act  = value; //also works for powerstate

        } 
        if (to_write) 
            call PrepareWriteTask.postTask(act_quanto_log);
            //call PortWriter.write((uint8_t*)e, sizeof(*e));
    }

    event void PrepareWriteTask.runTask() {
       entry_t* e;
       atomic e = m_w_entry;

       xe.type   = e->type;
       xe.res_id = e->res_id;
       xe.time   = e->time;
       xe.ic     = e->ic;
       xe.arg    = e->act;
        
       call PortWriter.write((uint8_t*)&xe, sizeof(xe));
 
    }

    event void PortWriter.writeDone(uint8_t* buffer, error_t result) {
       uint8_t to_write = FALSE;

       if (buffer == (uint8_t*)&xe) {
       //if (buffer == (uint8_t*)&buf[m_head]) {
            atomic {
                m_head = (m_head + 1) % BUFFERSIZE;
                m_size--;
                if ((to_write = (m_size > 0))) {
                   m_w_entry = &buf[m_head];
                }
            } 
            if (to_write)
                call PrepareWriteTask.postTask(act_quanto_log);
                //call PortWriter.write((uint8_t*)e, sizeof(*e));
       }
    }

    //async event void 
    //SingleActivityResourceTrack.changed[uint8_t id](act_t old_activity, act_t new_activity) 
    //{
    //    recordChange(id, new_activity, TYPE_SINGLE_CHG_NORMAL);
    //}

    //async event void 
    //SingleActivityResourceTrack.bound[uint8_t id](act_t old_activity, act_t new_activity) 
    //{
    //    recordChange(id, new_activity, TYPE_SINGLE_CHG_BIND);
    //}

    //async event void 
    //SingleActivityResourceTrack.enteredInterrupt[uint8_t id](act_t old_activity, act_t new_activity) 
    //{
    //    if (ignoreInterrupt(new_activity)) {
    //        atomic s_masking_int = 1;
    //    } else {
    //        recordChange(id, new_activity, TYPE_SINGLE_CHG_ENTER_INT);
    //    }
    //}

    //async event void 
    //SingleActivityResourceTrack.exitedInterrupt[uint8_t id](act_t old_activity, act_t new_activity) 
    //{
    //    atomic {
    //        if (s_masking_int) {
    //            s_masking_int = 0;
    //            return;
    //        }
    //    }
    //    recordChange(id, new_activity, TYPE_SINGLE_CHG_EXIT_INT);
    //}
   
    async event void
    MultiActivityResourceTrack.added[uint8_t id](act_t activity)
    {
        recordChange(id, activity, TYPE_MULTI_CHG_ADD);
    }

    async event void
    MultiActivityResourceTrack.removed[uint8_t id](act_t activity)
    {
        recordChange(id, activity, TYPE_MULTI_CHG_REM);
    }

    async event void
    MultiActivityResourceTrack.idle[uint8_t id]()
    {
        recordChange(id, m_act_idle, TYPE_MULTI_CHG_IDL);
    }

    async event void
    PowerStateTrack.changed[uint8_t id](powerstate_t state)
    {
        recordChange(id, state, TYPE_POWER_CHG);
    }   

    async event void Counter.overflow() {}
}

