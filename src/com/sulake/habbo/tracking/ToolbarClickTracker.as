package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class ToolbarClickTracker
   {
       
      
      private var var_1241:IHabboTracking;
      
      private var var_1621:Boolean = false;
      
      private var var_2456:int = 0;
      
      private var var_1776:int = 0;
      
      public function ToolbarClickTracker(param1:IHabboTracking)
      {
         super();
         this.var_1241 = param1;
      }
      
      public function dispose() : void
      {
         this.var_1241 = null;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_1621 = Boolean(parseInt(param1.getKey("toolbar.tracking.enabled","1")));
         this.var_2456 = parseInt(param1.getKey("toolbar.tracking.max.events","100"));
      }
      
      public function track(param1:String) : void
      {
         if(!this.var_1621)
         {
            return;
         }
         ++this.var_1776;
         if(this.var_1776 <= this.var_2456)
         {
            this.var_1241.track("toolbar",param1);
         }
      }
   }
}
