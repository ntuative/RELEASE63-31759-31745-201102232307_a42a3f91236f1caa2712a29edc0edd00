package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1654:int;
      
      private var var_2261:int;
      
      private var var_1082:int;
      
      private var var_500:Number;
      
      private var var_2260:Boolean;
      
      private var var_2262:int;
      
      private var var_1655:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2261 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2262 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2260 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         ++this.var_1082;
         if(this.var_1082 == 1)
         {
            this.var_500 = param1;
            this.var_1654 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_1082);
            this.var_500 = this.var_500 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2260 && param3 - this.var_1654 >= this.var_2261 && this.var_1655 < this.var_2262)
         {
            _loc5_ = 1000 / this.var_500;
            param2.track("performance","averageFramerate",Math.round(_loc5_));
            ++this.var_1655;
            this.var_1654 = param3;
            this.var_1082 = 0;
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
