package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_81:String = "i";
      
      public static const const_89:String = "s";
      
      public static const const_211:String = "e";
       
      
      private var var_1884:String;
      
      private var var_2687:int;
      
      private var var_1448:String;
      
      private var var_1447:int;
      
      private var var_1883:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1884 = param1.readString();
         this.var_2687 = param1.readInteger();
         this.var_1448 = param1.readString();
         this.var_1447 = param1.readInteger();
         this.var_1883 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1884;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2687;
      }
      
      public function get extraParam() : String
      {
         return this.var_1448;
      }
      
      public function get productCount() : int
      {
         return this.var_1447;
      }
      
      public function get expiration() : int
      {
         return this.var_1883;
      }
   }
}
