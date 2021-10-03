package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_2096:int;
      
      private var var_2097:int;
      
      private var var_1104:int;
      
      private var var_1105:int;
      
      private var var_1518:int;
      
      private var var_2098:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_2096 = param1.readInteger();
         this.var_2097 = param1.readInteger();
         this.var_1104 = param1.readInteger();
         this.var_1105 = param1.readInteger();
         this.var_1518 = param1.readInteger();
         this.var_2098 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_2096;
      }
      
      public function get charges() : int
      {
         return this.var_2097;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1104;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1105;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2098;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1518;
      }
   }
}
