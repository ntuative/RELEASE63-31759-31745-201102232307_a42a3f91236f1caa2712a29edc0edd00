package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetCommandsMessageParser implements IMessageParser
   {
       
      
      private var var_1700:int;
      
      private var var_1366:Array;
      
      private var var_1071:Array;
      
      public function PetCommandsMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1700;
      }
      
      public function get allCommands() : Array
      {
         return this.var_1366;
      }
      
      public function get enabledCommands() : Array
      {
         return this.var_1071;
      }
      
      public function flush() : Boolean
      {
         this.var_1700 = -1;
         this.var_1366 = null;
         this.var_1071 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1700 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this.var_1366 = new Array();
         while(_loc2_-- > 0)
         {
            this.var_1366.push(param1.readInteger());
         }
         var _loc3_:int = param1.readInteger();
         this.var_1071 = new Array();
         while(_loc3_-- > 0)
         {
            this.var_1071.push(param1.readInteger());
         }
         return true;
      }
   }
}
