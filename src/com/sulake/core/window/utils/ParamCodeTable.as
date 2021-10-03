package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_194;
         param1["bound_to_parent_rect"] = const_93;
         param1["child_window"] = const_1007;
         param1["embedded_controller"] = const_1142;
         param1["resize_to_accommodate_children"] = const_70;
         param1["input_event_processor"] = const_30;
         param1["internal_event_handling"] = const_744;
         param1["mouse_dragging_target"] = const_227;
         param1["mouse_dragging_trigger"] = const_352;
         param1["mouse_scaling_target"] = const_310;
         param1["mouse_scaling_trigger"] = const_450;
         param1["horizontal_mouse_scaling_trigger"] = const_270;
         param1["vertical_mouse_scaling_trigger"] = const_224;
         param1["observe_parent_input_events"] = const_1153;
         param1["optimize_region_to_layout_size"] = const_447;
         param1["parent_window"] = const_999;
         param1["relative_horizontal_scale_center"] = const_180;
         param1["relative_horizontal_scale_fixed"] = const_138;
         param1["relative_horizontal_scale_move"] = const_382;
         param1["relative_horizontal_scale_strech"] = const_363;
         param1["relative_scale_center"] = const_1026;
         param1["relative_scale_fixed"] = const_773;
         param1["relative_scale_move"] = const_979;
         param1["relative_scale_strech"] = const_998;
         param1["relative_vertical_scale_center"] = const_176;
         param1["relative_vertical_scale_fixed"] = const_150;
         param1["relative_vertical_scale_move"] = const_360;
         param1["relative_vertical_scale_strech"] = const_407;
         param1["on_resize_align_left"] = const_880;
         param1["on_resize_align_right"] = const_555;
         param1["on_resize_align_center"] = const_493;
         param1["on_resize_align_top"] = const_749;
         param1["on_resize_align_bottom"] = const_421;
         param1["on_resize_align_middle"] = const_434;
         param1["on_accommodate_align_left"] = const_1041;
         param1["on_accommodate_align_right"] = const_435;
         param1["on_accommodate_align_center"] = const_649;
         param1["on_accommodate_align_top"] = const_984;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_811;
         param1["route_input_events_to_parent"] = const_527;
         param1["use_parent_graphic_context"] = const_32;
         param1["draggable_with_mouse"] = const_1128;
         param1["scalable_with_mouse"] = const_1064;
         param1["reflect_horizontal_resize_to_parent"] = const_562;
         param1["reflect_vertical_resize_to_parent"] = const_479;
         param1["reflect_resize_to_parent"] = const_309;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1019;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
