package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1377:Boolean;
      
      private var var_2206:int;
      
      private var var_1637:int;
      
      private var var_1638:int;
      
      private var var_2204:int;
      
      private var var_2208:int;
      
      private var var_2207:int;
      
      private var var_2205:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1377;
      }
      
      public function get commission() : int
      {
         return this.var_2206;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1637;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1638;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2208;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2204;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2207;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2205;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1377 = param1.readBoolean();
         this.var_2206 = param1.readInteger();
         this.var_1637 = param1.readInteger();
         this.var_1638 = param1.readInteger();
         this.var_2208 = param1.readInteger();
         this.var_2204 = param1.readInteger();
         this.var_2207 = param1.readInteger();
         this.var_2205 = param1.readInteger();
         return true;
      }
   }
}
