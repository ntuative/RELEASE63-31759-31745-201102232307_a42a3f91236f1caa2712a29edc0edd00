package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1435:String = "WN_CRETAE";
      
      public static const const_1454:String = "WN_CREATED";
      
      public static const const_985:String = "WN_DESTROY";
      
      public static const const_1106:String = "WN_DESTROYED";
      
      public static const const_1093:String = "WN_OPEN";
      
      public static const const_1140:String = "WN_OPENED";
      
      public static const const_1197:String = "WN_CLOSE";
      
      public static const const_1164:String = "WN_CLOSED";
      
      public static const const_1009:String = "WN_FOCUS";
      
      public static const const_1017:String = "WN_FOCUSED";
      
      public static const const_1096:String = "WN_UNFOCUS";
      
      public static const const_1172:String = "WN_UNFOCUSED";
      
      public static const const_1166:String = "WN_ACTIVATE";
      
      public static const const_396:String = "WN_ACTVATED";
      
      public static const const_1090:String = "WN_DEACTIVATE";
      
      public static const const_1075:String = "WN_DEACTIVATED";
      
      public static const const_438:String = "WN_SELECT";
      
      public static const const_340:String = "WN_SELECTED";
      
      public static const const_635:String = "WN_UNSELECT";
      
      public static const const_894:String = "WN_UNSELECTED";
      
      public static const const_1068:String = "WN_LOCK";
      
      public static const const_1016:String = "WN_LOCKED";
      
      public static const const_1116:String = "WN_UNLOCK";
      
      public static const const_1115:String = "WN_UNLOCKED";
      
      public static const const_1205:String = "WN_ENABLE";
      
      public static const const_787:String = "WN_ENABLED";
      
      public static const const_1033:String = "WN_DISABLE";
      
      public static const const_710:String = "WN_DISABLED";
      
      public static const const_648:String = "WN_RESIZE";
      
      public static const const_189:String = "WN_RESIZED";
      
      public static const const_1168:String = "WN_RELOCATE";
      
      public static const const_443:String = "WN_RELOCATED";
      
      public static const const_1029:String = "WN_MINIMIZE";
      
      public static const const_1095:String = "WN_MINIMIZED";
      
      public static const const_1067:String = "WN_MAXIMIZE";
      
      public static const const_1050:String = "WN_MAXIMIZED";
      
      public static const const_1078:String = "WN_RESTORE";
      
      public static const const_1004:String = "WN_RESTORED";
      
      public static const const_1766:String = "WN_ARRANGE";
      
      public static const const_1871:String = "WN_ARRANGED";
      
      public static const const_1807:String = "WN_UPDATE";
      
      public static const const_1817:String = "WN_UPDATED";
      
      public static const const_344:String = "WN_CHILD_ADDED";
      
      public static const const_861:String = "WN_CHILD_REMOVED";
      
      public static const const_286:String = "WN_CHILD_RESIZED";
      
      public static const const_296:String = "WN_CHILD_RELOCATED";
      
      public static const const_244:String = "WN_CHILD_ACTIVATED";
      
      public static const const_540:String = "WN_PARENT_ADDED";
      
      public static const const_1027:String = "WN_PARENT_REMOVED";
      
      public static const const_455:String = "WN_PARENT_RESIZED";
      
      public static const const_1143:String = "WN_PARENT_RELOCATED";
      
      public static const const_848:String = "WN_PARENT_ACTIVATED";
      
      public static const const_487:String = "WN_STATE_UPDATED";
      
      public static const const_425:String = "WN_STYLE_UPDATED";
      
      public static const const_511:String = "WN_PARAM_UPDATED";
      
      public static const const_1912:String = "";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1989,cancelable);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
   }
}
