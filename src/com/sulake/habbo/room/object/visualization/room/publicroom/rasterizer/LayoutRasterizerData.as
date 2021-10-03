package com.sulake.habbo.room.object.visualization.room.publicroom.rasterizer
{
   public class LayoutRasterizerData
   {
       
      
      private var var_1537:XMLList;
      
      public function LayoutRasterizerData(param1:XML)
      {
         super();
         this.var_1537 = param1.elements.element;
      }
      
      public function get elementList() : XMLList
      {
         return this.var_1537;
      }
      
      public function dispose() : void
      {
         this.var_1537 = null;
      }
   }
}
