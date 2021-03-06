#include "activity.h"
#include <UserButton.h>

module BurstC {
    uses interface SingleActivityResource as CPUResource;
    uses interface Boot;
    uses interface Notify<button_state_t> as UserButtonNotify;
    uses interface QuantoLog;
    uses interface Leds;
}
implementation {
  act_t a,b;
  event void Boot.booted()
  {
    call UserButtonNotify.enable();
    a = mk_act_local(1);
    b = mk_act_local(2);
  }

  void start() {
    call QuantoLog.record();
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
        call CPUResource.set(a);
        call CPUResource.set(b);
    call QuantoLog.flush();
    call Leds.led1Off();
  }

  event void UserButtonNotify.notify(button_state_t buttonState) {
    if (buttonState == BUTTON_PRESSED) {
        call Leds.led1On();
        start();
    }
  }

  event void QuantoLog.full() {}
  event void QuantoLog.flushDone() {}
    
}
