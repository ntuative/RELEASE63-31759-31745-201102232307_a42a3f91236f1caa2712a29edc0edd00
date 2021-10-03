package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_2052:int;
      
      private var var_2364:int;
      
      private var var_2366:int;
      
      private var _dayOffsets:Array;
      
      private var var_1910:Array;
      
      private var var_1909:Array;
      
      private var var_2365:int;
      
      private var var_2363:int;
      
      public function MarketplaceItemStatsParser()
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
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2052 = param1.readInteger();
         this.var_2364 = param1.readInteger();
         this.var_2366 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this._dayOffsets = [];
         this.var_1910 = [];
         this.var_1909 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this._dayOffsets.push(param1.readInteger());
            this.var_1910.push(param1.readInteger());
            this.var_1909.push(param1.readInteger());
            _loc3_++;
         }
         this.var_2363 = param1.readInteger();
         this.var_2365 = param1.readInteger();
         return true;
      }
   }
}
