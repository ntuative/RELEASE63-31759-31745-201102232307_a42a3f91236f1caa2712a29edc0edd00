package com.sulake.habbo.notifications
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class HabboNotificationItemView implements IUpdateReceiver
   {
      
      public static const const_845:int = 70;
      
      public static const const_551:int = 4;
      
      private static const name_2:int = 0;
      
      private static const const_464:int = 1;
      
      private static const const_936:int = 2;
      
      private static const const_935:int = 3;
      
      private static const const_413:Number = 50;
       
      
      private var var_181:IHabboToolbar;
      
      private var _window:IWindow;
      
      private var var_213:HabboNotificationItem;
      
      private var var_1763:Boolean = false;
      
      private var var_2482:Map;
      
      private var var_416:Map;
      
      private var var_1134:uint;
      
      private var var_1135:uint;
      
      private var var_1392:uint;
      
      private var var_748:int;
      
      private var var_749:Number;
      
      private var var_1765:int;
      
      private var var_1764:int;
      
      private var _state:int;
      
      public function HabboNotificationItemView(param1:IAsset, param2:IHabboWindowManager, param3:Map, param4:Map, param5:IHabboToolbar, param6:HabboNotificationItem)
      {
         super();
         this.var_2482 = param3;
         this.var_416 = param4;
         var _loc7_:XmlAsset = param1 as XmlAsset;
         if(_loc7_ == null)
         {
            return;
         }
         this._window = ICoreWindowManager(param2).buildFromXML(_loc7_.content as XML,1);
         this._window.tags.push("notificationview");
         this._window.context.getDesktopWindow().addEventListener(WindowEvent.const_48,this.onRoomViewResized);
         this._window.procedure = this.onWindowEvent;
         this._window.blend = 0;
         this._window.visible = false;
         var _loc8_:ITextWindow = IWindowContainer(this._window).findChildByTag("notification_text") as ITextWindow;
         if(_loc8_ != null)
         {
            this.var_1765 = this._window.height - _loc8_.rectangle.bottom;
         }
         else
         {
            this.var_1765 = 15;
         }
         this.var_1764 = this._window.height;
         this.var_748 = 4;
         this.var_749 = 0;
         this._state = name_2;
         this.var_181 = param5;
         this.showItem(param6);
      }
      
      public function get disposed() : Boolean
      {
         return this._window == null;
      }
      
      public function get ready() : Boolean
      {
         return this._state == name_2;
      }
      
      public function get verticalPosition() : int
      {
         return this.var_748;
      }
      
      private function showItem(param1:HabboNotificationItem) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:String = param1.content;
         this.setNotificationText(_loc2_);
         var _loc3_:BitmapData = param1.style.icon;
         this.setNotificationIcon(_loc3_);
         this.var_213 = param1;
         this.reposition();
         this.startFadeIn();
      }
      
      public function replaceIcon(param1:BadgeImageReadyEvent) : void
      {
         if(param1.badgeId != this.var_213.style.iconSrc)
         {
            return;
         }
         if(param1.badgeImage != null)
         {
            this.setNotificationIcon(param1.badgeImage);
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         switch(this._state)
         {
            case name_2:
               break;
            case const_464:
               this.var_1134 += param1;
               _loc2_ = Number(this.var_1134) / Number(this.var_416["time_fade_in"]);
               if(this.var_1134 > int(this.var_416["time_fade_in"]))
               {
                  this.startDisplay();
               }
               this.adjustBlend(_loc2_);
               break;
            case const_936:
               this.var_1392 += param1;
               if(this.var_1392 > int(this.var_416["time_display"]) && !this.var_1763)
               {
                  this.startFadeOut();
               }
               break;
            case const_935:
               this.var_1135 += param1;
               _loc3_ = 1 - Number(this.var_1135) / Number(this.var_416["time_fade_out"]);
               this.adjustBlend(_loc3_);
               if(this.var_1135 > int(this.var_416["time_fade_in"]))
               {
                  this.startIdling();
               }
         }
      }
      
      public function dispose() : void
      {
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
         if(this.var_213 != null)
         {
            this.var_213.dispose();
            this.var_213 = null;
         }
      }
      
      private function setNotificationText(param1:String) : void
      {
         var _loc2_:ITextWindow = IWindowContainer(this._window).findChildByTag("notification_text") as ITextWindow;
         if(_loc2_ == null || param1 == null)
         {
            return;
         }
         this._window.height = 0;
         _loc2_.text = param1;
         _loc2_.height = _loc2_.textHeight + this.var_1765;
         if(this._window.height < this.var_1764)
         {
            this._window.height = this.var_1764;
         }
      }
      
      private function setNotificationIcon(param1:BitmapData) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:IBitmapWrapperWindow = IWindowContainer(this._window).findChildByTag("notification_icon") as IBitmapWrapperWindow;
         if(_loc2_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            _loc2_.bitmap = null;
            return;
         }
         if(param1.width < _loc2_.width && param1.height < _loc2_.height)
         {
            _loc3_ = new BitmapData(_loc2_.width,_loc2_.height,true,0);
            _loc5_ = (_loc2_.width - param1.width) / 2;
            _loc6_ = (_loc2_.height - param1.height) / 2;
            _loc3_.copyPixels(param1,param1.rect,new Point(_loc5_,_loc6_));
         }
         else if(param1.width < param1.height)
         {
            _loc3_ = new BitmapData(param1.height,param1.height,true,0);
            _loc4_ = (param1.height - param1.width) / 2;
            _loc3_.copyPixels(param1,param1.rect,new Point(_loc4_,0));
         }
         else if(param1.width > param1.height)
         {
            _loc3_ = new BitmapData(param1.width,param1.width,true,0);
            _loc4_ = (param1.width - param1.height) / 2;
            _loc3_.copyPixels(param1,param1.rect,new Point(0,_loc4_));
         }
         else
         {
            _loc3_ = new BitmapData(param1.width,param1.height);
            _loc3_.copyPixels(param1,param1.rect,new Point(0,0));
         }
         _loc2_.bitmap = _loc3_;
      }
      
      private function startFadeIn() : void
      {
         this.var_1134 = 0;
         this._state = const_464;
         this._window.visible = true;
      }
      
      private function startFadeOut() : void
      {
         this.var_1135 = 0;
         this._state = const_935;
      }
      
      private function startDisplay() : void
      {
         this.var_1392 = 0;
         this._state = const_936;
      }
      
      private function startIdling() : void
      {
         this._state = name_2;
         this._window.visible = false;
      }
      
      public function reposition(param1:int = -1) : void
      {
         if(this._window == null)
         {
            return;
         }
         if(this.var_181 == null)
         {
            return;
         }
         var _loc2_:IDesktopWindow = this._window.context.getDesktopWindow();
         if(_loc2_ == null)
         {
            return;
         }
         if(param1 != -1)
         {
            this.var_748 = param1;
         }
         var _loc3_:int = this.var_181.orientation == "TOP" ? int(const_413) : 0;
         var _loc4_:int = this.var_181.orientation == "BOTTOM" ? int(_loc2_.height - const_413) : int(_loc2_.height);
         var _loc5_:int = this.var_181.orientation == "LEFT" ? int(const_413) : 0;
         var _loc6_:int = this.var_181.orientation == "RIGHT" ? int(_loc2_.width - const_413) : int(_loc2_.width);
         if(this.var_416["position_horizontal_follow_toolbar"] == "HabboCatalogCom_productViewWidget" && (this.var_181.orientation != "TOP" && this.var_181.orientation != "BOTTOM"))
         {
            if(this.var_181.orientation == "LEFT")
            {
               this._window.x = _loc5_ + const_551;
            }
            else
            {
               this._window.x = _loc6_ - this._window.width - const_551;
            }
         }
         else if(this.var_416["position_horizontal"] == "left")
         {
            this._window.x = _loc5_ + const_551;
         }
         else
         {
            this._window.x = _loc6_ - this._window.width - const_551;
         }
         if(this.var_416["position_vertical_follow_toolbar"] == "HabboCatalogCom_productViewWidget" && (this.var_181.orientation != "RIGHT" && this.var_181.orientation != "LEFT"))
         {
            if(this.var_181.orientation == "TOP")
            {
               this._window.y = _loc3_ + this.var_748;
            }
            else
            {
               this._window.y = _loc4_ - this._window.height - this.var_748;
            }
         }
         else if(this.var_416["position_vertical"] == "top")
         {
            this._window.y = _loc3_ + this.var_748;
         }
         else
         {
            this._window.y = _loc4_ - this._window.height - this.var_748;
         }
      }
      
      public function onWindowEvent(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            this.var_1763 = true;
            Logger.log("notifications - hover on");
         }
         else if(param1.type == WindowMouseEvent.const_25)
         {
            this.var_1763 = false;
            Logger.log("notifications - hover off");
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            if(this.var_213 != null)
            {
               this.var_213.ExecuteUiLinks();
            }
         }
      }
      
      private function onRoomViewResized(param1:WindowEvent) : void
      {
         this.reposition();
      }
      
      private function adjustBlend(param1:Number) : void
      {
         this.var_749 = param1;
         if(this.var_749 > 1)
         {
            this.var_749 = 1;
         }
         if(this.var_749 < 0)
         {
            this.var_749 = 0;
         }
         this._window.blend = this.var_749;
      }
   }
}
