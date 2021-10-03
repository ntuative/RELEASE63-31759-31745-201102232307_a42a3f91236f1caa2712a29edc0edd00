package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_595:String;
      
      private var var_814:String;
      
      private var var_2471:String;
      
      private var var_1871:String;
      
      private var var_2472:int;
      
      private var var_2469:String;
      
      private var var_2474:int;
      
      private var var_2470:int;
      
      private var var_2473:int;
      
      private var _respectLeft:int;
      
      private var var_672:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_595 = param1.readString();
         this.var_814 = param1.readString();
         this.var_2471 = param1.readString();
         this.var_1871 = param1.readString();
         this.var_2472 = param1.readInteger();
         this.var_2469 = param1.readString();
         this.var_2474 = param1.readInteger();
         this.var_2470 = param1.readInteger();
         this.var_2473 = param1.readInteger();
         this._respectLeft = param1.readInteger();
         this.var_672 = param1.readInteger();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this.var_595;
      }
      
      public function get sex() : String
      {
         return this.var_814;
      }
      
      public function get customData() : String
      {
         return this.var_2471;
      }
      
      public function get realName() : String
      {
         return this.var_1871;
      }
      
      public function get tickets() : int
      {
         return this.var_2472;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2469;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2474;
      }
      
      public function get directMail() : int
      {
         return this.var_2470;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2473;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_672;
      }
   }
}
