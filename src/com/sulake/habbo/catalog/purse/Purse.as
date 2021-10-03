package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
      
      public static const const_173:int = 0;
       
      
      private var var_2607:int = 0;
      
      private var var_1441:Dictionary;
      
      private var var_1865:int = 0;
      
      private var var_1864:int = 0;
      
      private var var_2172:Boolean = false;
      
      private var var_2415:int = 0;
      
      private var var_2416:int = 0;
      
      public function Purse()
      {
         this.var_1441 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_2607;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_2607 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1865;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1865 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1864;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1864 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1865 > 0 || this.var_1864 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2172;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2172 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2415;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2415 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2416;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2416 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1441;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1441 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1441[param1];
      }
   }
}
