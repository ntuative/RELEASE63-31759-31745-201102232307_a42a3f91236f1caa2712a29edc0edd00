package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2510:int = 0;
      
      private var var_1413:String = "";
      
      private var var_1816:String = "";
      
      private var var_2519:String = "";
      
      private var var_2675:String = "";
      
      private var var_1913:int = 0;
      
      private var var_2674:int = 0;
      
      private var var_2673:int = 0;
      
      private var var_1412:int = 0;
      
      private var var_2672:int = 0;
      
      private var var_1411:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2510 = param1;
         this.var_1413 = param2;
         this.var_1816 = param3;
         this.var_2519 = param4;
         this.var_2675 = param5;
         if(param6)
         {
            this.var_1913 = 1;
         }
         else
         {
            this.var_1913 = 0;
         }
         this.var_2674 = param7;
         this.var_2673 = param8;
         this.var_1412 = param9;
         this.var_2672 = param10;
         this.var_1411 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2510,this.var_1413,this.var_1816,this.var_2519,this.var_2675,this.var_1913,this.var_2674,this.var_2673,this.var_1412,this.var_2672,this.var_1411];
      }
   }
}
