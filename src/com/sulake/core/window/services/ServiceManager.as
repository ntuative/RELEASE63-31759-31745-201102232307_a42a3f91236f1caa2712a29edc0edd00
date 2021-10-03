package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_2780:uint;
      
      private var var_137:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var _windowContext:IWindowContext;
      
      private var var_1188:IMouseDraggingService;
      
      private var var_1187:IMouseScalingService;
      
      private var var_1186:IMouseListenerService;
      
      private var var_1184:IFocusManagerService;
      
      private var var_1189:IToolTipAgentService;
      
      private var var_1185:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_2780 = 0;
         this.var_137 = param2;
         this._windowContext = param1;
         this.var_1188 = new WindowMouseDragger(param2);
         this.var_1187 = new WindowMouseScaler(param2);
         this.var_1186 = new WindowMouseListener(param2);
         this.var_1184 = new FocusManager(param2);
         this.var_1189 = new WindowToolTipAgent(param2);
         this.var_1185 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1188 != null)
         {
            this.var_1188.dispose();
            this.var_1188 = null;
         }
         if(this.var_1187 != null)
         {
            this.var_1187.dispose();
            this.var_1187 = null;
         }
         if(this.var_1186 != null)
         {
            this.var_1186.dispose();
            this.var_1186 = null;
         }
         if(this.var_1184 != null)
         {
            this.var_1184.dispose();
            this.var_1184 = null;
         }
         if(this.var_1189 != null)
         {
            this.var_1189.dispose();
            this.var_1189 = null;
         }
         if(this.var_1185 != null)
         {
            this.var_1185.dispose();
            this.var_1185 = null;
         }
         this.var_137 = null;
         this._windowContext = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1188;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1187;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1186;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1184;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1189;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1185;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
