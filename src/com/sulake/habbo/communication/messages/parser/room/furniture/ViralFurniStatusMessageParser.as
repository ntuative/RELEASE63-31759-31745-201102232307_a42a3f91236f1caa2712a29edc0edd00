package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ViralFurniStatusMessageParser implements IMessageParser
   {
       
      
      private var var_180:String;
      
      private var var_339:int;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_1443:int = 0;
      
      private var var_379:int;
      
      private var _shareId:String;
      
      private var var_2034:String;
      
      public function ViralFurniStatusMessageParser()
      {
         super();
      }
      
      public function get campaignID() : String
      {
         return this.var_180;
      }
      
      public function get objectId() : int
      {
         return this.var_339;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get itemCategory() : int
      {
         return this.var_1443;
      }
      
      public function get shareId() : String
      {
         return this._shareId;
      }
      
      public function get status() : int
      {
         return this.var_379;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2034;
      }
      
      public function flush() : Boolean
      {
         this._roomId = 0;
         this._roomCategory = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_180 = param1.readString();
         this.var_339 = param1.readInteger();
         this.var_379 = param1.readInteger();
         this._shareId = param1.readString();
         this.var_2034 = param1.readString();
         this.var_1443 = param1.readInteger();
         return true;
      }
   }
}
