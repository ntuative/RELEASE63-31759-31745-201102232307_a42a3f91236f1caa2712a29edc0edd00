package com.sulake.core.window
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.services.IInternalWindowServices;
   import com.sulake.core.window.services.ServiceManager;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventProcessor;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.IMouseCursor;
   import com.sulake.core.window.utils.IWindowParser;
   import com.sulake.core.window.utils.MouseCursorControl;
   import com.sulake.core.window.utils.MouseEventProcessor;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import com.sulake.core.window.utils.tablet.TabletEventProcessor;
   import com.sulake.core.window.utils.tablet.TabletEventQueue;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class WindowContext implements IWindowContext, IDisposable, IUpdateReceiver
   {
      
      public static const const_550:uint = 0;
      
      public static const const_1370:uint = 1;
      
      public static const const_1947:int = 0;
      
      public static const const_1780:int = 1;
      
      public static const const_1784:int = 2;
      
      public static const const_1901:int = 3;
      
      public static const const_1466:int = 4;
      
      public static const const_362:int = 5;
      
      public static var var_1479:IMouseCursor;
      
      public static var var_374:IEventQueue;
      
      private static var var_585:IEventProcessor;
      
      private static var var_1668:uint = const_550;
      
      private static var stage:Stage;
      
      private static var var_151:IWindowRenderer;
       
      
      private var _eventProcessorState:EventProcessorState;
      
      private var var_2287:IWindowContextStateListener;
      
      protected var _localization:ICoreLocalizationManager;
      
      protected var var_183:DisplayObjectContainer;
      
      protected var var_2793:Boolean = true;
      
      protected var var_1230:Error;
      
      protected var var_1981:int = -1;
      
      protected var var_1231:IInternalWindowServices;
      
      protected var var_1483:IWindowParser;
      
      protected var var_2743:IWindowFactory;
      
      protected var var_135:IDesktopWindow;
      
      protected var var_1484:SubstituteParentController;
      
      private var _disposed:Boolean = false;
      
      private var var_530:Boolean = false;
      
      private var var_2288:Boolean = false;
      
      private var _name:String;
      
      public function WindowContext(param1:String, param2:IWindowRenderer, param3:IWindowFactory, param4:ICoreLocalizationManager, param5:DisplayObjectContainer, param6:Rectangle, param7:IWindowContextStateListener)
      {
         super();
         this._name = param1;
         var_151 = param2;
         this._localization = param4;
         this.var_183 = param5;
         this.var_1231 = new ServiceManager(this,param5);
         this.var_2743 = param3;
         this.var_1483 = new WindowParser(this);
         this.var_2287 = param7;
         if(!stage)
         {
            if(this.var_183 is Stage)
            {
               stage = this.var_183 as Stage;
            }
            else if(this.var_183.stage)
            {
               stage = this.var_183.stage;
            }
         }
         Classes.init();
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,800,600);
         }
         this.var_135 = new DesktopController("_CONTEXT_DESKTOP_" + this._name,this,param6);
         this.var_183.addChild(this.var_135.getDisplayObject());
         this.var_183.doubleClickEnabled = true;
         this.var_183.addEventListener(Event.RESIZE,this.stageResizedHandler);
         this._eventProcessorState = new EventProcessorState(var_151,this.var_135,this.var_135,null,this.var_2287);
         inputMode = const_550;
         this.var_1484 = new SubstituteParentController(this);
      }
      
      public static function get inputMode() : uint
      {
         return var_1668;
      }
      
      public static function set inputMode(param1:uint) : void
      {
         var value:uint = param1;
         if(var_374)
         {
            if(var_374 is IDisposable)
            {
               IDisposable(var_374).dispose();
            }
         }
         if(var_585)
         {
            if(var_585 is IDisposable)
            {
               IDisposable(var_585).dispose();
            }
         }
         switch(value)
         {
            case const_550:
               var_374 = new MouseEventQueue(stage);
               var_585 = new MouseEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            case const_1370:
               var_374 = new TabletEventQueue(stage);
               var_585 = new TabletEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            default:
               inputMode = const_550;
               throw new Error("Unknown input mode " + value);
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_183.removeEventListener(Event.RESIZE,this.stageResizedHandler);
            this.var_183.removeChild(IGraphicContextHost(this.var_135).getGraphicContext(true) as DisplayObject);
            this.var_135.destroy();
            this.var_135 = null;
            this.var_1484.destroy();
            this.var_1484 = null;
            if(this.var_1231 is IDisposable)
            {
               IDisposable(this.var_1231).dispose();
            }
            this.var_1231 = null;
            this.var_1483.dispose();
            this.var_1483 = null;
            var_151 = null;
         }
      }
      
      public function getLastError() : Error
      {
         return this.var_1230;
      }
      
      public function getLastErrorCode() : int
      {
         return this.var_1981;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         this.var_1230 = param2;
         this.var_1981 = param1;
         if(this.var_2793)
         {
            throw param2;
         }
      }
      
      public function flushError() : void
      {
         this.var_1230 = null;
         this.var_1981 = -1;
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return this.var_1231;
      }
      
      public function getWindowParser() : IWindowParser
      {
         return this.var_1483;
      }
      
      public function getWindowFactory() : IWindowFactory
      {
         return this.var_2743;
      }
      
      public function getDesktopWindow() : IDesktopWindow
      {
         return this.var_135;
      }
      
      public function getMouseCursor() : IMouseCursor
      {
         if(var_1479 == null)
         {
            var_1479 = new MouseCursorControl(this.var_183);
         }
         return var_1479;
      }
      
      public function findWindowByName(param1:String) : IWindow
      {
         return this.var_135.findChildByName(param1);
      }
      
      public function registerLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function removeLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:IWindow, param9:uint, param10:Array = null, param11:Array = null) : IWindow
      {
         var _loc12_:* = null;
         var _loc13_:Class = Classes.getWindowClassByType(param3);
         if(_loc13_ == null)
         {
            this.handleError(WindowContext.const_1466,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 0)
            {
               param8 = this.var_1484;
            }
         }
         _loc12_ = new _loc13_(param1,param3,param4,param5,this,param6,param8 != null ? param8 : this.var_135,param7,param10,param11,param9);
         if(param2 && param2.length)
         {
            _loc12_.caption = param2;
         }
         return _loc12_;
      }
      
      public function destroy(param1:IWindow) : Boolean
      {
         if(param1 == this.var_135)
         {
            this.var_135 = null;
         }
         if(param1.state != WindowState.const_492)
         {
            param1.destroy();
         }
         return true;
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : void
      {
         if(!this.disposed)
         {
            var_151.addToRenderQueue(WindowController(param1),param2,param3);
         }
      }
      
      public function update(param1:uint) : void
      {
         this.var_530 = true;
         if(this.var_1230)
         {
            throw this.var_1230;
         }
         var_585.process(this._eventProcessorState,var_374);
         this.var_530 = false;
      }
      
      public function render(param1:uint) : void
      {
         this.var_2288 = true;
         var_151.update(param1);
         this.var_2288 = false;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         if(this.var_135 != null && !this.var_135.disposed)
         {
            if(this.var_183 is Stage)
            {
               this.var_135.width = Stage(this.var_183).stageWidth;
               this.var_135.height = Stage(this.var_183).stageHeight;
            }
            else
            {
               this.var_135.width = this.var_183.width;
               this.var_135.height = this.var_183.height;
            }
         }
      }
   }
}
