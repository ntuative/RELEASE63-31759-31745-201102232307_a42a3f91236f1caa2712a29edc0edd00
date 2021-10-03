package com.sulake.habbo.widget.events
{
   public class RoomWidgetClothingChangeUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_399:String = "RWCCUE_SHOW_GENDER_SELECTION";
      
      public static const const_1069:String = "RWCCUE_SHOW_CLOTHING_EDITOR";
      
      public static const const_351:String = "RWCCUE_HIDE_CLOTHING_EDITOR";
       
      
      private var var_339:int = -1;
      
      private var var_2147:int = -1;
      
      private var _roomId:int = -1;
      
      private var _roomCategory:int = -1;
      
      public function RoomWidgetClothingChangeUpdateEvent(param1:String, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_339 = param2;
         this.var_2147 = param3;
         this._roomId = param4;
         this._roomCategory = param5;
      }
      
      public function get objectId() : int
      {
         return this.var_339;
      }
      
      public function get objectCategory() : int
      {
         return this.var_2147;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
   }
}
