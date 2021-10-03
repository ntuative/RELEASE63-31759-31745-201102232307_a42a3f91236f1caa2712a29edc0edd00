package com.sulake.habbo.room.object.visualization.data
{
   public class LayerData
   {
      
      public static const const_770:String = "";
      
      public static const const_431:int = 0;
      
      public static const const_531:int = 255;
      
      public static const const_792:Boolean = false;
      
      public static const const_565:int = 0;
      
      public static const const_517:int = 0;
      
      public static const const_472:int = 0;
      
      public static const const_991:int = 1;
      
      public static const const_1123:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2235:String = "";
      
      private var var_1876:int = 0;
      
      private var var_2281:int = 255;
      
      private var var_2280:Boolean = false;
      
      private var var_2282:int = 0;
      
      private var var_2278:int = 0;
      
      private var var_2279:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2235 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2235;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_1876 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_1876;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2281 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2281;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2280 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2280;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2282 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2282;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2278 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2278;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2279 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2279;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
