package com.sulake.habbo.widget.messages
{
   public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage
   {
      
      public static const const_632:String = "RWRTSM_ROOM_TAG_SEARCH";
       
      
      private var var_2235:String = "";
      
      public function RoomWidgetRoomTagSearchMessage(param1:String)
      {
         super(const_632);
         this.var_2235 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2235;
      }
   }
}
