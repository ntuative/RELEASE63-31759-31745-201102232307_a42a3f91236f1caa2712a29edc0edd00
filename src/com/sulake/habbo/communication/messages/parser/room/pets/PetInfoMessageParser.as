package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1700:int;
      
      private var _name:String;
      
      private var var_1348:int;
      
      private var var_2433:int;
      
      private var var_2003:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var var_595:String;
      
      private var var_2434:int;
      
      private var var_2436:int;
      
      private var var_2435:int;
      
      private var var_2437:int;
      
      private var var_2004:int;
      
      private var _ownerName:String;
      
      private var var_456:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1700;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1348;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2433;
      }
      
      public function get experience() : int
      {
         return this.var_2003;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this.var_595;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2434;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2436;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2435;
      }
      
      public function get respect() : int
      {
         return this.var_2437;
      }
      
      public function get ownerId() : int
      {
         return this.var_2004;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_456;
      }
      
      public function flush() : Boolean
      {
         this.var_1700 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1700 = param1.readInteger();
         this._name = param1.readString();
         this.var_1348 = param1.readInteger();
         this.var_2433 = param1.readInteger();
         this.var_2003 = param1.readInteger();
         this.var_2434 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2436 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2435 = param1.readInteger();
         this.var_595 = param1.readString();
         this.var_2437 = param1.readInteger();
         this.var_2004 = param1.readInteger();
         this.var_456 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
