package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_2402:int;
      
      private var var_2403:int;
      
      private var var_2401:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         this.var_2402 = param1;
         this.var_2403 = param2;
         this.var_2401 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2402,this.var_2403,this.var_2401];
      }
      
      public function dispose() : void
      {
      }
   }
}
