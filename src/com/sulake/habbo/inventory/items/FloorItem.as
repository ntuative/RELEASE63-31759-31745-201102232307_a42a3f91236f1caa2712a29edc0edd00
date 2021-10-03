package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var _category:int;
      
      protected var _type:int;
      
      protected var var_1974:String;
      
      protected var var_1374:Number;
      
      protected var var_2735:Boolean;
      
      protected var var_2734:Boolean;
      
      protected var var_2709:Boolean;
      
      protected var var_2177:Boolean;
      
      protected var var_2740:int;
      
      protected var var_2711:int;
      
      protected var var_2706:int;
      
      protected var var_2705:int;
      
      protected var var_1731:String;
      
      protected var var_2028:int;
      
      protected var var_924:Boolean;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         this._id = param1;
         this._type = param2;
         this._ref = param3;
         this._category = param4;
         this.var_2709 = param5;
         this.var_2734 = param6;
         this.var_2735 = param7;
         this.var_2177 = param8;
         this.var_1974 = param9;
         this.var_1374 = param10;
         this.var_2740 = param11;
         this.var_2711 = param12;
         this.var_2706 = param13;
         this.var_2705 = param14;
         this.var_1731 = param15;
         this.var_2028 = param16;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get ref() : int
      {
         return this._ref;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get stuffData() : String
      {
         return this.var_1974;
      }
      
      public function get extra() : Number
      {
         return this.var_1374;
      }
      
      public function get recyclable() : Boolean
      {
         return this.var_2735;
      }
      
      public function get tradeable() : Boolean
      {
         return this.var_2734;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2709;
      }
      
      public function get sellable() : Boolean
      {
         return this.var_2177;
      }
      
      public function get expires() : int
      {
         return this.var_2740;
      }
      
      public function get creationDay() : int
      {
         return this.var_2711;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2706;
      }
      
      public function get creationYear() : int
      {
         return this.var_2705;
      }
      
      public function get slotId() : String
      {
         return this.var_1731;
      }
      
      public function get songId() : int
      {
         return this.var_2028;
      }
      
      public function set locked(param1:Boolean) : void
      {
         this.var_924 = param1;
      }
      
      public function get locked() : Boolean
      {
         return this.var_924;
      }
   }
}
