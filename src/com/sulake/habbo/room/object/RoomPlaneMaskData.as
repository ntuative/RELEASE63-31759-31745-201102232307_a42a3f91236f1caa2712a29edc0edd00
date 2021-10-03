package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_2061:Number = 0.0;
      
      private var var_2059:Number = 0.0;
      
      private var var_2060:Number = 0.0;
      
      private var var_2058:Number = 0.0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2061 = param1;
         this.var_2059 = param2;
         this.var_2060 = param3;
         this.var_2058 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2061;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2059;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2060;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2058;
      }
   }
}
