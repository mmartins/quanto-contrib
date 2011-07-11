//$Id: VirtualizeTimerP.nc,v 1.3 2011/07/10 20:28:37 mmartins Exp $

/* Copyright (c) 2000-2003 The Regents of the University of California.  
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * - Redistributions of source code must retain the above copyright
 *   notice, this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions and the following disclaimer in the
 *   documentation and/or other materials provided with the
 *   distribution.
 * - Neither the name of the copyright holder nor the names of
 *   its contributors may be used to endorse or promote products derived
 *   from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL
 * THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/**
 * VirtualizeTimerC uses a single Timer to create up to 255 virtual timers.
 *
 * <p>See TEP102 for more details.
 *
 * @param precision_tag A type indicating the precision of the Timer being 
 *   virtualized.
 * @param max_timers Number of virtual timers to create.
 *
 * @author Cory Sharp <cssharp@eecs.berkeley.edu>
 */

#include "activity.h"
#include "QuantoTimer.h"

generic module VirtualizeTimerP(typedef precision_tag, int max_timers) @safe()
{
  provides interface Timer<precision_tag> as Timer[uint8_t num];
  uses interface Timer<precision_tag> as TimerFrom;
  uses interface SingleActivityResource as CPUResource;
}
implementation
{
  enum
    {
      NUM_TIMERS = max_timers,
      END_OF_LIST = 255,
    };

  typedef struct
  {
    uint32_t t0;
    uint32_t dt;
    bool isoneshot : 1;
    bool isrunning : 1;
    bool _reserved : 6;
    act_t act;
  } Timer_t;

  Timer_t m_timers[NUM_TIMERS];
  bool m_timers_changed;

  task void updateFromTimer();

  void fireTimers(uint32_t now)
  {
    uint16_t num;
    act_t c = call CPUResource.get();

    for (num=0; num<NUM_TIMERS; num++)
      {
        Timer_t* timer = &m_timers[num];

        if (timer->isrunning)
          {
            uint32_t elapsed = now - timer->t0;

            if (elapsed >= timer->dt)
              {
                if (timer->isoneshot)
                  timer->isrunning = FALSE;
                else // Update timer for next event
                  timer->t0 += timer->dt;

                call CPUResource.set(timer->act); //push
                signal Timer.fired[num]();
                call CPUResource.set(c);          //pop
                break;
              }
          }
      }
    post updateFromTimer();
  }
  
  task void updateFromTimer()
  {
    /* This code supports a maximum dt of MAXINT. If min_remaining and
       remaining were switched to uint32_t, and the logic changed a
       little, dt's up to 2^32-1 should work (but at a slightly higher
       runtime cost). */
    uint32_t now = call TimerFrom.getNow();
    int32_t min_remaining = (1UL << 31) - 1; /* max int32_t */
    bool min_remaining_isset = FALSE;
    uint16_t num;

    call TimerFrom.stop();

    for (num=0; num<NUM_TIMERS; num++)
      {
	Timer_t* timer = &m_timers[num];

	if (timer->isrunning)
	  {
	    uint32_t elapsed = now - timer->t0;
	    int32_t remaining = timer->dt - elapsed;

	    if (remaining < min_remaining)
	      {
		min_remaining = remaining;
		min_remaining_isset = TRUE;
	      }
	  }
      }

    if (min_remaining_isset)
      {
	if (min_remaining <= 0)
	  fireTimers(now);
	else
	  call TimerFrom.startOneShotAt(now, min_remaining);
      }
  }
  
  event void TimerFrom.fired()
  {
    call CPUResource.bind(mk_act_local(QUANTO_ACTIVITY(TIMER)));
    fireTimers(call TimerFrom.getNow());
  }

  void startTimer(uint8_t num, uint32_t t0, uint32_t dt, bool isoneshot)
  {
    Timer_t* timer = &m_timers[num];
    timer->t0 = t0;
    timer->dt = dt;
    timer->isoneshot = isoneshot;
    timer->isrunning = TRUE;
    timer->act = call CPUResource.get();
    call CPUResource.set(mk_act_local(QUANTO_ACTIVITY(TIMER)));
    post updateFromTimer();
    call CPUResource.set(timer->act);
    //if timer->act isValid
    //TimerFrom.Activity.add(timer->act)
    // This is the place to add the timer->act to the 
    // underlying shared resource. This resource is visible
    // here as TimerFrom. There should be a MultiActivityResource
    // exported to this module so we can add the activities to it.
  }

  command void Timer.startPeriodic[uint8_t num](uint32_t dt)
  {
    startTimer(num, call TimerFrom.getNow(), dt, FALSE);
  }

  command void Timer.startOneShot[uint8_t num](uint32_t dt)
  {
    startTimer(num, call TimerFrom.getNow(), dt, TRUE);
  }

  command void Timer.stop[uint8_t num]()
  {
    m_timers[num].isrunning = FALSE;
    //if m_timers[num].act isValid
    //TimerFrom.Activity.remove(m_timers[num].act)
  }

  command bool Timer.isRunning[uint8_t num]()
  {
    return m_timers[num].isrunning;
  }

  command bool Timer.isOneShot[uint8_t num]()
  {
    return m_timers[num].isoneshot;
  }

  command void Timer.startPeriodicAt[uint8_t num](uint32_t t0, uint32_t dt)
  {
    startTimer(num, t0, dt, FALSE);
  }

  command void Timer.startOneShotAt[uint8_t num](uint32_t t0, uint32_t dt)
  {
    startTimer(num, t0, dt, TRUE);
  }

  command uint32_t Timer.getNow[uint8_t num]()
  {
    return call TimerFrom.getNow();
  }

  command uint32_t Timer.gett0[uint8_t num]()
  {
    return m_timers[num].t0;
  }

  command uint32_t Timer.getdt[uint8_t num]()
  {
    return m_timers[num].dt;
  }

  default event void Timer.fired[uint8_t num]()
  {
  }
}

