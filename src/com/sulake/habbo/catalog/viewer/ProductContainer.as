package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import flash.display.BitmapData;
   
   public class ProductContainer extends ProductGridItem implements IGetImageListener, IProductContainer, IGridItem
   {
       
      
      protected var var_89:Offer;
      
      private var var_1032:Array;
      
      private var var_801:int;
      
      public function ProductContainer(param1:Offer, param2:Array)
      {
         super();
         this.var_89 = param1;
         this.var_1032 = param2;
      }
      
      public function get iconCallbackId() : int
      {
         return this.var_801;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         this.var_801 = param1;
      }
      
      public function get products() : Array
      {
         return this.var_1032;
      }
      
      public function get firstProduct() : IProduct
      {
         return this.var_1032[0] as IProduct;
      }
      
      public function get offer() : Offer
      {
         return this.var_89;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         super.dispose();
         for each(_loc1_ in this.var_1032)
         {
            _loc1_.dispose();
         }
         this.var_1032 = null;
         this.var_801 = 0;
      }
      
      public function initProductIcon(param1:IRoomEngine) : void
      {
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         setIconImage(param2);
      }
   }
}
