package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_1700:int;
      
      private var var_2378:String;
      
      private var var_1348:int;
      
      private var var_1203:int;
      
      private var var_1614:int;
      
      private var _color:String;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1700 = param1.readInteger();
         this.var_2378 = param1.readString();
         this.var_1348 = param1.readInteger();
         this.var_1203 = param1.readInteger();
         this.var_1614 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_1700;
      }
      
      public function get petName() : String
      {
         return this.var_2378;
      }
      
      public function get level() : int
      {
         return this.var_1348;
      }
      
      public function get petType() : int
      {
         return this.var_1203;
      }
      
      public function get breed() : int
      {
         return this.var_1614;
      }
      
      public function get color() : String
      {
         return this._color;
      }
   }
}
