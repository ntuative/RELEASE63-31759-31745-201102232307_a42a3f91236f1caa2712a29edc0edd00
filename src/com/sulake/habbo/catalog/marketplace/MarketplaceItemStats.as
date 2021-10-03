package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_2052:int;
      
      private var var_2364:int;
      
      private var var_2366:int;
      
      private var _dayOffsets:Array;
      
      private var var_1910:Array;
      
      private var var_1909:Array;
      
      private var var_2365:int;
      
      private var var_2363:int;
      
      public function MarketplaceItemStats()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_2052;
      }
      
      public function get offerCount() : int
      {
         return this.var_2364;
      }
      
      public function get historyLength() : int
      {
         return this.var_2366;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_1910;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_1909;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_2365;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_2363;
      }
      
      public function set averagePrice(param1:int) : void
      {
         this.var_2052 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_2364 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         this.var_2366 = param1;
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         this._dayOffsets = param1.slice();
      }
      
      public function set averagePrices(param1:Array) : void
      {
         this.var_1910 = param1.slice();
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         this.var_1909 = param1.slice();
      }
      
      public function set furniTypeId(param1:int) : void
      {
         this.var_2365 = param1;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         this.var_2363 = param1;
      }
   }
}
