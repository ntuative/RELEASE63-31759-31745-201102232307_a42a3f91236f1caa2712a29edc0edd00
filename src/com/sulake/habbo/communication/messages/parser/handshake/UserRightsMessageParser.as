package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserRightsMessageParser implements IMessageParser
   {
       
      
      private var var_1034:Boolean;
      
      private var var_830:Array = null;
      
      private var var_2131:int;
      
      private var var_1571:int;
      
      public function UserRightsMessageParser()
      {
         super();
         this.var_830 = [];
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:Boolean = param1.readBoolean();
         if(_loc2_)
         {
            this.var_830 = [];
            _loc3_ = param1.readInteger();
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               this.var_830.push(param1.readString());
               _loc4_++;
            }
            this.var_1034 = false;
         }
         else
         {
            this.var_2131 = param1.readInteger();
            this.var_1571 = param1.readInteger();
            this.var_1034 = true;
         }
         return true;
      }
      
      public function get simpleSecurity() : Boolean
      {
         return this.var_1034;
      }
      
      public function get rights() : Array
      {
         return this.var_830.slice();
      }
      
      public function get clubLevel() : int
      {
         return this.var_2131;
      }
      
      public function get securityLevel() : int
      {
         return this.var_1571;
      }
   }
}
