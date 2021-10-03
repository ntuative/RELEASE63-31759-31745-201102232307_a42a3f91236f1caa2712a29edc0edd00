package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_759:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1013:String = "inventory_effects";
      
      public static const const_1098:String = "inventory_badges";
      
      public static const const_1367:String = "inventory_clothes";
      
      public static const const_1491:String = "inventory_furniture";
       
      
      private var var_2723:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_759);
         this.var_2723 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2723;
      }
   }
}
