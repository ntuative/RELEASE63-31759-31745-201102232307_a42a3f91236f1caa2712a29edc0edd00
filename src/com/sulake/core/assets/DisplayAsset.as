package com.sulake.core.assets
{
   import flash.display.DisplayObject;
   
   public class DisplayAsset implements IAsset
   {
       
      
      protected var var_990:String;
      
      protected var var_172:DisplayObject;
      
      protected var _disposed:Boolean = false;
      
      protected var var_800:AssetTypeDeclaration;
      
      public function DisplayAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         this.var_800 = param1;
         this.var_990 = param2;
      }
      
      public function get url() : String
      {
         return this.var_990;
      }
      
      public function get content() : Object
      {
         return this.var_172;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return this.var_800;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            if(this.var_172.loaderInfo != null)
            {
               if(this.var_172.loaderInfo.loader != null)
               {
                  this.var_172.loaderInfo.loader.unload();
               }
            }
            this.var_172 = null;
            this.var_800 = null;
            this._disposed = true;
            this.var_990 = null;
         }
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         if(param1 is DisplayObject)
         {
            this.var_172 = param1 as DisplayObject;
            if(this.var_172 != null)
            {
               return;
            }
            throw new Error("Failed to convert DisplayObject to DisplayAsset!");
         }
         if(param1 is DisplayAsset)
         {
            this.var_172 = DisplayAsset(param1).var_172;
            this.var_800 = DisplayAsset(param1).var_800;
            if(this.var_172 == null)
            {
               throw new Error("Failed to read content from DisplayAsset!");
            }
         }
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is DisplayAsset)
         {
            this.var_172 = DisplayAsset(param1).var_172;
            this.var_800 = DisplayAsset(param1).var_800;
            return;
         }
         throw new Error("Provided asset should be of type DisplayAsset!");
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
   }
}
