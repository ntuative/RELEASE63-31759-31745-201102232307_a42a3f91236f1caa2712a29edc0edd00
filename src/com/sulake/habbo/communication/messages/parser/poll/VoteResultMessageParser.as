package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1120:String;
      
      private var var_1266:Array;
      
      private var var_1080:Array;
      
      private var var_1858:int;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get question() : String
      {
         return this.var_1120;
      }
      
      public function get choices() : Array
      {
         return this.var_1266.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1080.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_1858;
      }
      
      public function flush() : Boolean
      {
         this.var_1120 = "";
         this.var_1266 = [];
         this.var_1080 = [];
         this.var_1858 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1120 = param1.readString();
         this.var_1266 = [];
         this.var_1080 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            this.var_1266.push(param1.readString());
            this.var_1080.push(param1.readInteger());
            _loc3_++;
         }
         this.var_1858 = param1.readInteger();
         return true;
      }
   }
}
