package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_595:String;
      
      private var var_2297:String;
      
      private var var_906:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         this.var_595 = param1;
         this.var_906 = param2;
         this.var_2297 = param3;
      }
      
      public function get figure() : String
      {
         return this.var_595;
      }
      
      public function get race() : String
      {
         return this.var_2297;
      }
      
      public function get gender() : String
      {
         return this.var_906;
      }
   }
}
