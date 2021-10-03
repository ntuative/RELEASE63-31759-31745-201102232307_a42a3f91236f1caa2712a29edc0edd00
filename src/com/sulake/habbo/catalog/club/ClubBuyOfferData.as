package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var _offerId:int;
      
      private var var_1490:String;
      
      private var var_1761:int;
      
      private var var_2245:Boolean;
      
      private var var_2241:Boolean;
      
      private var var_2243:int;
      
      private var var_2244:int;
      
      private var var_380:ICatalogPage;
      
      private var var_2246:int;
      
      private var var_2242:int;
      
      private var var_2247:int;
      
      private var var_2605:Boolean = false;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         this._offerId = param1;
         this.var_1490 = param2;
         this.var_1761 = param3;
         this.var_2245 = param4;
         this.var_2241 = param5;
         this.var_2243 = param6;
         this.var_2244 = param7;
         this.var_2246 = param8;
         this.var_2242 = param9;
         this.var_2247 = param10;
      }
      
      public function dispose() : void
      {
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get productCode() : String
      {
         return this.var_1490;
      }
      
      public function get price() : int
      {
         return this.var_1761;
      }
      
      public function get upgrade() : Boolean
      {
         return this.var_2245;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2241;
      }
      
      public function get periods() : int
      {
         return this.var_2243;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2244;
      }
      
      public function get year() : int
      {
         return this.var_2246;
      }
      
      public function get month() : int
      {
         return this.var_2242;
      }
      
      public function get day() : int
      {
         return this.var_2247;
      }
      
      public function get priceInActivityPoints() : int
      {
         return 0;
      }
      
      public function get activityPointType() : int
      {
         return Purse.const_173;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1761;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_380;
      }
      
      public function get priceType() : String
      {
         return Offer.const_756;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get localizationId() : String
      {
         return this.var_1490;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         this.var_380 = param1;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return this.var_2605;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         this.var_2605 = param1;
      }
   }
}
