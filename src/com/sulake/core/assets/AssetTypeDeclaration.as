package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2621:String;
      
      private var var_2620:Class;
      
      private var var_2622:Class;
      
      private var var_1887:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_2621 = param1;
         this.var_2620 = param2;
         this.var_2622 = param3;
         if(rest == null)
         {
            this.var_1887 = new Array();
         }
         else
         {
            this.var_1887 = rest;
         }
      }
      
      public function get mimeType() : String
      {
         return this.var_2621;
      }
      
      public function get assetClass() : Class
      {
         return this.var_2620;
      }
      
      public function get loaderClass() : Class
      {
         return this.var_2622;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_1887;
      }
   }
}
