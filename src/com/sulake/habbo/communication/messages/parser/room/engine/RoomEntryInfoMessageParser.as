package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1525:Boolean;
      
      private var var_2064:int;
      
      private var var_386:Boolean;
      
      private var var_1013:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function get guestRoom() : Boolean
      {
         return this.var_1525;
      }
      
      public function get guestRoomId() : int
      {
         return this.var_2064;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return this.var_1013;
      }
      
      public function get owner() : Boolean
      {
         return this.var_386;
      }
      
      public function flush() : Boolean
      {
         if(this.var_1013 != null)
         {
            this.var_1013.dispose();
            this.var_1013 = null;
         }
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1525 = param1.readBoolean();
         if(this.var_1525)
         {
            this.var_2064 = param1.readInteger();
            this.var_386 = param1.readBoolean();
         }
         else
         {
            this.var_1013 = new PublicRoomShortData(param1);
         }
         return true;
      }
   }
}
