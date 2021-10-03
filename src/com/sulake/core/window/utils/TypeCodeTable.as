package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_631;
         param1["bitmap"] = const_768;
         param1["border"] = const_622;
         param1["border_notify"] = const_1548;
         param1["button"] = const_541;
         param1["button_thick"] = const_873;
         param1["button_icon"] = const_1602;
         param1["button_group_left"] = const_895;
         param1["button_group_center"] = const_818;
         param1["button_group_right"] = const_660;
         param1["canvas"] = const_697;
         param1["checkbox"] = const_885;
         param1["closebutton"] = const_1148;
         param1["container"] = const_345;
         param1["container_button"] = const_869;
         param1["display_object_wrapper"] = const_625;
         param1["dropmenu"] = const_475;
         param1["dropmenu_item"] = const_557;
         param1["frame"] = const_372;
         param1["frame_notify"] = const_1540;
         param1["header"] = const_871;
         param1["html"] = const_1001;
         param1["icon"] = const_1058;
         param1["itemgrid"] = const_1047;
         param1["itemgrid_horizontal"] = const_445;
         param1["itemgrid_vertical"] = const_750;
         param1["itemlist"] = const_1099;
         param1["itemlist_horizontal"] = const_384;
         param1["itemlist_vertical"] = const_374;
         param1["label"] = WINDOW_TYPE_LABEL;
         param1["maximizebox"] = const_1422;
         param1["menu"] = const_1573;
         param1["menu_item"] = const_1613;
         param1["submenu"] = const_1079;
         param1["minimizebox"] = const_1470;
         param1["notify"] = const_1657;
         param1["null"] = const_615;
         param1["password"] = const_616;
         param1["radiobutton"] = const_789;
         param1["region"] = const_817;
         param1["restorebox"] = const_1486;
         param1["scaler"] = const_825;
         param1["scaler_horizontal"] = const_1625;
         param1["scaler_vertical"] = const_1509;
         param1["scrollbar_horizontal"] = const_506;
         param1["scrollbar_vertical"] = const_655;
         param1["scrollbar_slider_button_up"] = const_1070;
         param1["scrollbar_slider_button_down"] = const_1188;
         param1["scrollbar_slider_button_left"] = const_1213;
         param1["scrollbar_slider_button_right"] = const_1028;
         param1["scrollbar_slider_bar_horizontal"] = const_1006;
         param1["scrollbar_slider_bar_vertical"] = const_1154;
         param1["scrollbar_slider_track_horizontal"] = const_974;
         param1["scrollbar_slider_track_vertical"] = const_1065;
         param1["scrollable_itemlist"] = const_1398;
         param1["scrollable_itemlist_vertical"] = const_538;
         param1["scrollable_itemlist_horizontal"] = const_1165;
         param1["selector"] = const_755;
         param1["selector_list"] = const_775;
         param1["submenu"] = const_1079;
         param1["tab_button"] = const_426;
         param1["tab_container_button"] = const_972;
         param1["tab_context"] = const_385;
         param1["tab_content"] = const_1104;
         param1["tab_selector"] = const_667;
         param1["text"] = const_548;
         param1["input"] = const_640;
         param1["toolbar"] = const_1575;
         param1["tooltip"] = const_341;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
