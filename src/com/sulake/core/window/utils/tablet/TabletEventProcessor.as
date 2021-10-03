package com.sulake.core.window.utils.tablet
{
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.MouseEventProcessor;
   
   public class TabletEventProcessor extends MouseEventProcessor
   {
       
      
      private var var_2812:String = "";
      
      public function TabletEventProcessor()
      {
         super();
      }
      
      override public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         var_135 = param1.desktop;
         var_82 = param1.var_1218 as WindowController;
         _lastClickTarget = param1.var_1219 as WindowController;
         var_151 = param1.renderer;
         var_797 = param1.var_1221;
         param2.begin();
         param2.end();
         param1.desktop = var_135;
         param1.var_1218 = var_82;
         param1.var_1219 = _lastClickTarget;
         param1.renderer = var_151;
         param1.var_1221 = var_797;
      }
   }
}
