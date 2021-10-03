package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_268:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2489:int = 0;
      
      private var var_2492:int = 0;
      
      private var var_2491:int = 0;
      
      private var var_2490:Boolean = false;
      
      private var var_2131:int;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_268,param6,param7);
         this.var_2489 = param1;
         this.var_2492 = param2;
         this.var_2491 = param3;
         this.var_2490 = param4;
         this.var_2131 = param5;
      }
      
      public function get daysLeft() : int
      {
         return this.var_2489;
      }
      
      public function get periodsLeft() : int
      {
         return this.var_2492;
      }
      
      public function get pastPeriods() : int
      {
         return this.var_2491;
      }
      
      public function get allowClubDances() : Boolean
      {
         return this.var_2490;
      }
      
      public function get clubLevel() : int
      {
         return this.var_2131;
      }
   }
}
