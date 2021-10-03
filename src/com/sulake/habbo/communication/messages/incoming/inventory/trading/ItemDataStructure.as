package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2248:int;
      
      private var var_1277:String;
      
      private var var_2710:int;
      
      private var var_2708:int;
      
      private var _category:int;
      
      private var var_1974:String;
      
      private var var_1374:int;
      
      private var var_2707:int;
      
      private var var_2711:int;
      
      private var var_2706:int;
      
      private var var_2705:int;
      
      private var var_2709:Boolean;
      
      private var var_2817:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_2248 = param1;
         this.var_1277 = param2;
         this.var_2710 = param3;
         this.var_2708 = param4;
         this._category = param5;
         this.var_1974 = param6;
         this.var_1374 = param7;
         this.var_2707 = param8;
         this.var_2711 = param9;
         this.var_2706 = param10;
         this.var_2705 = param11;
         this.var_2709 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_2248;
      }
      
      public function get itemType() : String
      {
         return this.var_1277;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2710;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2708;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_1974;
      }
      
      public function get extra() : int
      {
         return this.var_1374;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2707;
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
      
      public function get groupable() : Boolean
      {
         return this.var_2709;
      }
      
      public function get songID() : int
      {
         return this.var_1374;
      }
   }
}
