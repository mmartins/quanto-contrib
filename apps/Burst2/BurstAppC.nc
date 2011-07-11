configuration BurstAppC {
}
implementation {
    components
            MainC,
            BurstC,
            LedsC,
            UserButtonC,
            QuantoLogRawUARTC as CLog,
            QuantoResourcesC;

    BurstC.Boot -> MainC.Boot;
    BurstC.Leds -> LedsC;
    BurstC.CPUResource -> QuantoResourcesC.CPUResource;
    BurstC.UserButtonNotify -> UserButtonC;
    BurstC.QuantoLog -> CLog;
    
  components new TimerMilliC() as Timer0;
  components HplMsp430GeneralIOC;
  BurstC.A0 -> HplMsp430GeneralIOC.Port23;
  BurstC.A1 -> HplMsp430GeneralIOC.Port26;
  BurstC.Timer0 -> Timer0;
}
