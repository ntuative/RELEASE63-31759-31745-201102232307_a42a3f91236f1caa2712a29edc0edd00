package com.sulake.core.window.services
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IToolTipWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowType;
   import flash.display.DisplayObject;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class WindowToolTipAgent extends WindowMouseOperator implements IToolTipAgentService
   {
       
      
      protected var var_1223:String;
      
      protected var var_268:IToolTipWindow;
      
      protected var var_375:Timer;
      
      protected var var_1222:Point;
      
      protected var var_1224:Point;
      
      protected var var_1482:uint;
      
      public function WindowToolTipAgent(param1:DisplayObject)
      {
         this.var_1224 = new Point();
         this.var_1222 = new Point(20,20);
         this.var_1482 = 500;
         super(param1);
      }
      
      override public function begin(param1:IWindow, param2:uint = 0) : IWindow
      {
         if(param1 && !param1.disposed)
         {
            if(param1 is IInteractiveWindow)
            {
               this.var_1223 = IInteractiveWindow(param1).toolTipCaption;
               this.var_1482 = IInteractiveWindow(param1).toolTipDelay;
            }
            else
            {
               this.var_1223 = param1.caption;
               this.var_1482 = 500;
            }
            _mouse.x = var_137.mouseX;
            _mouse.y = var_137.mouseY;
            getMousePositionRelativeTo(param1,_mouse,this.var_1224);
            if(this.var_1223 != null && this.var_1223 != "")
            {
               if(this.var_375 == null)
               {
                  this.var_375 = new Timer(this.var_1482,1);
                  this.var_375.addEventListener(TimerEvent.TIMER,this.showToolTip);
               }
               this.var_375.reset();
               this.var_375.start();
            }
         }
         return super.begin(param1,param2);
      }
      
      override public function end(param1:IWindow) : IWindow
      {
         if(this.var_375 != null)
         {
            this.var_375.stop();
            this.var_375.removeEventListener(TimerEvent.TIMER,this.showToolTip);
            this.var_375 = null;
         }
         this.hideToolTip();
         return super.end(param1);
      }
      
      override public function operate(param1:int, param2:int) : void
      {
         if(_window && true)
         {
            _mouse.x = param1;
            _mouse.y = param2;
            getMousePositionRelativeTo(_window,_mouse,this.var_1224);
            if(this.var_268 != null && !this.var_268.disposed)
            {
               this.var_268.x = param1 + this.var_1222.x;
               this.var_268.y = param2 + this.var_1222.y;
            }
         }
      }
      
      protected function showToolTip(param1:TimerEvent) : void
      {
         var _loc2_:* = null;
         if(this.var_375 != null)
         {
            this.var_375.reset();
         }
         if(_window && true)
         {
            if(this.var_268 == null || this.var_268.disposed)
            {
               this.var_268 = _window.context.create("undefined::ToolTip",this.var_1223,WindowType.const_341,_window.style,0 | 0,null,null,null,0,null,null) as IToolTipWindow;
            }
            _loc2_ = new Point();
            _window.getGlobalPosition(_loc2_);
            this.var_268.x = _loc2_.x + this.var_1224.x + this.var_1222.x;
            this.var_268.y = _loc2_.y + this.var_1224.y + this.var_1222.y;
         }
      }
      
      protected function hideToolTip() : void
      {
         if(this.var_268 != null && !this.var_268.disposed)
         {
            this.var_268.destroy();
            this.var_268 = null;
         }
      }
   }
}
