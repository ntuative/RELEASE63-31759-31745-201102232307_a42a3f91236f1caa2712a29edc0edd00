package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_1755:Boolean;
      
      private var _roomId:int;
      
      private var var_834:String;
      
      private var var_2677:int;
      
      private var var_2676:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1755 = param1.readBoolean();
         this._roomId = param1.readInteger();
         this.var_834 = param1.readString();
         this.var_2677 = param1.readInteger();
         this.var_2676 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return this.var_1755;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomName() : String
      {
         return this.var_834;
      }
      
      public function get enterHour() : int
      {
         return this.var_2677;
      }
      
      public function get enterMinute() : int
      {
         return this.var_2676;
      }
   }
}
