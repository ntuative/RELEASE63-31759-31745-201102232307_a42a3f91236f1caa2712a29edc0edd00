package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FlatCatMessageParser implements IMessageParser
   {
       
      
      private var var_323:int;
      
      private var var_1576:int;
      
      public function FlatCatMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_323 = param1.readInteger();
         this.var_1576 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_323 = 0;
         this.var_1576 = 0;
         return true;
      }
      
      public function get flatId() : int
      {
         return this.var_323;
      }
      
      public function get nodeId() : int
      {
         return this.var_1576;
      }
   }
}
