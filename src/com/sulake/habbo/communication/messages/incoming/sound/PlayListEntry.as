package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_2028:int;
      
      private var var_2029:int;
      
      private var var_2031:String;
      
      private var var_2032:String;
      
      private var var_2030:int = 0;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this.var_2028 = param1;
         this.var_2029 = param2;
         this.var_2031 = param3;
         this.var_2032 = param4;
      }
      
      public function get id() : int
      {
         return this.var_2028;
      }
      
      public function get length() : int
      {
         return this.var_2029;
      }
      
      public function get name() : String
      {
         return this.var_2031;
      }
      
      public function get creator() : String
      {
         return this.var_2032;
      }
      
      public function get startPlayHeadPos() : int
      {
         return this.var_2030;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         this.var_2030 = param1;
      }
   }
}
