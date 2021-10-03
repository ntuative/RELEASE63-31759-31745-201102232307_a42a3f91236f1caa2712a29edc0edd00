package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_2560:int;
      
      private var var_2563:int;
      
      private var var_2562:int;
      
      private var var_2561:String;
      
      private var var_1605:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2560 = param1.readInteger();
         this.var_2563 = param1.readInteger();
         this.var_2562 = param1.readInteger();
         this.var_2561 = param1.readString();
         this.var_1605 = param1.readString();
      }
      
      public function get hour() : int
      {
         return this.var_2560;
      }
      
      public function get minute() : int
      {
         return this.var_2563;
      }
      
      public function get chatterId() : int
      {
         return this.var_2562;
      }
      
      public function get chatterName() : String
      {
         return this.var_2561;
      }
      
      public function get msg() : String
      {
         return this.var_1605;
      }
   }
}
