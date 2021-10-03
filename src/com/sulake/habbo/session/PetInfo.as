package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1700:int;
      
      private var var_1348:int;
      
      private var var_2002:int;
      
      private var var_2003:int;
      
      private var var_1999:int;
      
      private var _energy:int;
      
      private var var_1998:int;
      
      private var _nutrition:int;
      
      private var var_1997:int;
      
      private var var_2004:int;
      
      private var _ownerName:String;
      
      private var var_2437:int;
      
      private var var_456:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1700;
      }
      
      public function get level() : int
      {
         return this.var_1348;
      }
      
      public function get levelMax() : int
      {
         return this.var_2002;
      }
      
      public function get experience() : int
      {
         return this.var_2003;
      }
      
      public function get experienceMax() : int
      {
         return this.var_1999;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get energyMax() : int
      {
         return this.var_1998;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_1997;
      }
      
      public function get ownerId() : int
      {
         return this.var_2004;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get respect() : int
      {
         return this.var_2437;
      }
      
      public function get age() : int
      {
         return this.var_456;
      }
      
      public function set petId(param1:int) : void
      {
         this.var_1700 = param1;
      }
      
      public function set level(param1:int) : void
      {
         this.var_1348 = param1;
      }
      
      public function set levelMax(param1:int) : void
      {
         this.var_2002 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         this.var_2003 = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         this.var_1999 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         this._energy = param1;
      }
      
      public function set energyMax(param1:int) : void
      {
         this.var_1998 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         this._nutrition = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         this.var_1997 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         this.var_2004 = param1;
      }
      
      public function set ownerName(param1:String) : void
      {
         this._ownerName = param1;
      }
      
      public function set respect(param1:int) : void
      {
         this.var_2437 = param1;
      }
      
      public function set age(param1:int) : void
      {
         this.var_456 = param1;
      }
   }
}
