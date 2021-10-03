package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_1576:int;
      
      private var var_2421:String;
      
      private var var_378:Boolean;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         this.var_1576 = param1.readInteger();
         this.var_2421 = param1.readString();
         this.var_378 = param1.readBoolean();
      }
      
      public function get nodeId() : int
      {
         return this.var_1576;
      }
      
      public function get nodeName() : String
      {
         return this.var_2421;
      }
      
      public function get visible() : Boolean
      {
         return this.var_378;
      }
   }
}
