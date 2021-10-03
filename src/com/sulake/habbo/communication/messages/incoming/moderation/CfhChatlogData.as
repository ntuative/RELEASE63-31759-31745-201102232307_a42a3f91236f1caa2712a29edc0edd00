package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1772:int;
      
      private var var_2444:int;
      
      private var var_1271:int;
      
      private var var_2443:int;
      
      private var var_104:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1772 = param1.readInteger();
         this.var_2444 = param1.readInteger();
         this.var_1271 = param1.readInteger();
         this.var_2443 = param1.readInteger();
         this.var_104 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1772);
      }
      
      public function get callId() : int
      {
         return this.var_1772;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2444;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1271;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2443;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_104;
      }
   }
}
