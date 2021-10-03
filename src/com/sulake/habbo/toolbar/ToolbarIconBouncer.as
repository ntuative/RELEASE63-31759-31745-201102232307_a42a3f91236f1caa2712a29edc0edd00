package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2087:Number;
      
      private var var_1635:Number;
      
      private var var_820:Number;
      
      private var var_819:Number = 0;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         this.var_2087 = param1;
         this.var_1635 = param2;
      }
      
      public function reset(param1:int) : void
      {
         this.var_820 = param1;
         this.var_819 = 0;
      }
      
      public function update() : void
      {
         this.var_820 += this.var_1635;
         this.var_819 += this.var_820;
         if(this.var_819 > 0)
         {
            this.var_819 = 0;
            this.var_820 = this.var_2087 * -1 * this.var_820;
         }
      }
      
      public function get location() : Number
      {
         return this.var_819;
      }
   }
}
