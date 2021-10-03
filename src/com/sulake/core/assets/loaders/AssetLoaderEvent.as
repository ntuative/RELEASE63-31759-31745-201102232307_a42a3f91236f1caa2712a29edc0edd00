package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   
   public class AssetLoaderEvent extends Event
   {
      
      public static const const_28:String = "AssetLoaderEventComplete";
      
      public static const const_1080:String = "AssetLoaderEventProgress";
      
      public static const const_1215:String = "AssetLoaderEventUnload";
      
      public static const const_1175:String = "AssetLoaderEventStatus";
      
      public static const const_45:String = "AssetLoaderEventError";
      
      public static const const_1216:String = "AssetLoaderEventOpen";
       
      
      private var var_379:int;
      
      public function AssetLoaderEvent(param1:String, param2:int)
      {
         this.var_379 = param2;
         super(param1,false,false);
      }
      
      public function get status() : int
      {
         return this.var_379;
      }
      
      override public function clone() : Event
      {
         return new AssetLoaderEvent(type,this.var_379);
      }
   }
}
