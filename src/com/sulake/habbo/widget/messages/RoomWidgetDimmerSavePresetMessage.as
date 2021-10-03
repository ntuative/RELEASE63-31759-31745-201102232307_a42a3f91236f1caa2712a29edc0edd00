package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_753:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2349:int;
      
      private var var_2352:int;
      
      private var _color:uint;
      
      private var var_1192:int;
      
      private var var_2650:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_753);
         this.var_2349 = param1;
         this.var_2352 = param2;
         this._color = param3;
         this.var_1192 = param4;
         this.var_2650 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2349;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2352;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1192;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2650;
      }
   }
}
