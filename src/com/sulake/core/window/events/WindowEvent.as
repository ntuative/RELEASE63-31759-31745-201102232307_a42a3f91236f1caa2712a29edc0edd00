package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_1455:String = "WE_CREATE";
      
      public static const const_1535:String = "WE_CREATED";
      
      public static const const_1478:String = "WE_DESTROY";
      
      public static const const_304:String = "WE_DESTROYED";
      
      public static const const_1479:String = "WE_OPEN";
      
      public static const const_1430:String = "WE_OPENED";
      
      public static const const_1534:String = "WE_CLOSE";
      
      public static const const_1472:String = "WE_CLOSED";
      
      public static const const_1506:String = "WE_FOCUS";
      
      public static const const_306:String = "WE_FOCUSED";
      
      public static const const_1558:String = "WE_UNFOCUS";
      
      public static const const_1659:String = "WE_UNFOCUSED";
      
      public static const const_1622:String = "WE_ACTIVATE";
      
      public static const const_1639:String = "WE_ACTIVATED";
      
      public static const const_1413:String = "WE_DEACTIVATE";
      
      public static const const_614:String = "WE_DEACTIVATED";
      
      public static const const_453:String = "WE_SELECT";
      
      public static const const_57:String = "WE_SELECTED";
      
      public static const const_832:String = "WE_UNSELECT";
      
      public static const const_783:String = "WE_UNSELECTED";
      
      public static const const_1882:String = "WE_ATTACH";
      
      public static const const_1868:String = "WE_ATTACHED";
      
      public static const const_1885:String = "WE_DETACH";
      
      public static const const_1747:String = "WE_DETACHED";
      
      public static const const_1626:String = "WE_LOCK";
      
      public static const const_1638:String = "WE_LOCKED";
      
      public static const const_1431:String = "WE_UNLOCK";
      
      public static const const_1563:String = "WE_UNLOCKED";
      
      public static const const_611:String = "WE_ENABLE";
      
      public static const const_311:String = "WE_ENABLED";
      
      public static const const_889:String = "WE_DISABLE";
      
      public static const const_264:String = "WE_DISABLED";
      
      public static const const_1637:String = "WE_RELOCATE";
      
      public static const const_355:String = "WE_RELOCATED";
      
      public static const const_1467:String = "WE_RESIZE";
      
      public static const const_48:String = "WE_RESIZED";
      
      public static const const_1443:String = "WE_MINIMIZE";
      
      public static const const_1530:String = "WE_MINIMIZED";
      
      public static const const_1588:String = "WE_MAXIMIZE";
      
      public static const const_1603:String = "WE_MAXIMIZED";
      
      public static const const_1539:String = "WE_RESTORE";
      
      public static const const_1567:String = "WE_RESTORED";
      
      public static const const_1844:String = "WE_ARRANGE";
      
      public static const const_1933:String = "WE_ARRANGED";
      
      public static const const_101:String = "WE_UPDATE";
      
      public static const const_1895:String = "WE_UPDATED";
      
      public static const const_1926:String = "WE_CHILD_RELOCATE";
      
      public static const const_563:String = "WE_CHILD_RELOCATED";
      
      public static const const_1892:String = "WE_CHILD_RESIZE";
      
      public static const const_299:String = "WE_CHILD_RESIZED";
      
      public static const const_1886:String = "WE_CHILD_REMOVE";
      
      public static const const_574:String = "WE_CHILD_REMOVED";
      
      public static const const_1735:String = "WE_PARENT_RELOCATE";
      
      public static const const_1847:String = "WE_PARENT_RELOCATED";
      
      public static const const_1761:String = "WE_PARENT_RESIZE";
      
      public static const const_1646:String = "WE_PARENT_RESIZED";
      
      public static const const_184:String = "WE_OK";
      
      public static const const_754:String = "WE_CANCEL";
      
      public static const const_107:String = "WE_CHANGE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_515:String = "WE_SCROLL";
      
      public static const const_158:String = "";
       
      
      protected var _type:String = "";
      
      protected var _window:IWindow;
      
      protected var var_1989:IWindow;
      
      protected var var_1988:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         this._type = param1;
         this._window = param2;
         this.var_1989 = param3;
         this.var_1988 = false;
         super(param1,param4,param5);
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      override public function get type() : String
      {
         return this._type;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_1989;
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(this._type,this.window,this.related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            this.var_1988 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1988;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
   }
}
