package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_1450:IID;
      
      private var var_1888:String;
      
      private var var_108:IUnknown;
      
      private var var_776:uint;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         this.var_1450 = param1;
         this.var_1888 = getQualifiedClassName(this.var_1450);
         this.var_108 = param2;
         this.var_776 = 0;
      }
      
      public function get iid() : IID
      {
         return this.var_1450;
      }
      
      public function get iis() : String
      {
         return this.var_1888;
      }
      
      public function get unknown() : IUnknown
      {
         return this.var_108;
      }
      
      public function get references() : uint
      {
         return this.var_776;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_108 == null;
      }
      
      public function dispose() : void
      {
         this.var_1450 = null;
         this.var_1888 = null;
         this.var_108 = null;
         this.var_776 = 0;
      }
      
      public function reserve() : uint
      {
         return ++this.var_776;
      }
      
      public function release() : uint
      {
         return this.references > 0 ? uint(--this.var_776) : uint(0);
      }
   }
}
