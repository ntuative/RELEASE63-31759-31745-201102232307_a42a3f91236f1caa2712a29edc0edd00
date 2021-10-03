package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1767:IID;
      
      private var var_764:Boolean;
      
      private var var_1136:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_1767 = param1;
         this.var_1136 = new Array();
         this.var_764 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_1767;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_764;
      }
      
      public function get receivers() : Array
      {
         return this.var_1136;
      }
      
      public function dispose() : void
      {
         if(!this.var_764)
         {
            this.var_764 = true;
            this.var_1767 = null;
            while(this.var_1136.length > 0)
            {
               this.var_1136.pop();
            }
            this.var_1136 = null;
         }
      }
   }
}
