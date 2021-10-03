package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionUserFigureUpdateEvent extends RoomSessionEvent
   {
      
      public static const const_164:String = "RSUBE_FIGURE";
       
      
      private var _userId:int = 0;
      
      private var var_595:String = "";
      
      private var var_906:String = "";
      
      private var var_1520:String = "";
      
      private var var_2056:int;
      
      public function RoomSessionUserFigureUpdateEvent(param1:IRoomSession, param2:int, param3:String, param4:String, param5:String, param6:int, param7:Boolean = false, param8:Boolean = false)
      {
         super(const_164,param1,param7,param8);
         this._userId = param2;
         this.var_595 = param3;
         this.var_906 = param4;
         this.var_1520 = param5;
         this.var_2056 = param6;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get figure() : String
      {
         return this.var_595;
      }
      
      public function get gender() : String
      {
         return this.var_906;
      }
      
      public function get customInfo() : String
      {
         return this.var_1520;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2056;
      }
   }
}
