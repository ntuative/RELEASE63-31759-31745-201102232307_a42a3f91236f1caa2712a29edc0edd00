package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var _type:String = "";
      
      private var var_1890:String = "";
      
      private var var_1809:String = "";
      
      private var var_2333:String = "";
      
      private var var_2335:Number = 0;
      
      private var var_2334:Number = 0;
      
      private var var_2273:Number = 0;
      
      private var var_2270:Number = 0;
      
      private var var_2210:Boolean = false;
      
      private var var_2211:Boolean = false;
      
      private var var_2209:Boolean = false;
      
      private var var_2212:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_1890 = param2;
         this.var_1809 = param3;
         this.var_2333 = param4;
         this.var_2335 = param5;
         this.var_2334 = param6;
         this.var_2273 = param7;
         this.var_2270 = param8;
         this.var_2210 = param9;
         this.var_2211 = param10;
         this.var_2209 = param11;
         this.var_2212 = param12;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get eventId() : String
      {
         return this.var_1890;
      }
      
      public function get canvasId() : String
      {
         return this.var_1809;
      }
      
      public function get spriteTag() : String
      {
         return this.var_2333;
      }
      
      public function get screenX() : Number
      {
         return this.var_2335;
      }
      
      public function get screenY() : Number
      {
         return this.var_2334;
      }
      
      public function get localX() : Number
      {
         return this.var_2273;
      }
      
      public function get localY() : Number
      {
         return this.var_2270;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2210;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2211;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2209;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2212;
      }
   }
}
