package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_570:int = 0;
      
      public static const const_181:int = 1;
      
      public static const const_122:int = 2;
      
      public static const const_735:Array = ["open","closed","password"];
       
      
      private var _roomId:int;
      
      private var _name:String;
      
      private var var_1507:String;
      
      private var var_2016:int;
      
      private var var_1284:int;
      
      private var var_2014:int;
      
      private var var_2684:int;
      
      private var var_804:Array;
      
      private var var_2017:Array;
      
      private var var_2685:int;
      
      private var var_2018:Boolean;
      
      private var var_2019:Boolean;
      
      private var var_2020:Boolean;
      
      private var var_2015:Boolean;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2018;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         this.var_2018 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return this.var_2019;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         this.var_2019 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return this.var_2020;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         this.var_2020 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return this.var_2015;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         this.var_2015 = param1;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function set roomId(param1:int) : void
      {
         this._roomId = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get description() : String
      {
         return this.var_1507;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1507 = param1;
      }
      
      public function get doorMode() : int
      {
         return this.var_2016;
      }
      
      public function set doorMode(param1:int) : void
      {
         this.var_2016 = param1;
      }
      
      public function get categoryId() : int
      {
         return this.var_1284;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1284 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return this.var_2014;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         this.var_2014 = param1;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return this.var_2684;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         this.var_2684 = param1;
      }
      
      public function get tags() : Array
      {
         return this.var_804;
      }
      
      public function set tags(param1:Array) : void
      {
         this.var_804 = param1;
      }
      
      public function get controllers() : Array
      {
         return this.var_2017;
      }
      
      public function set controllers(param1:Array) : void
      {
         this.var_2017 = param1;
      }
      
      public function get controllerCount() : int
      {
         return this.var_2685;
      }
      
      public function set controllerCount(param1:int) : void
      {
         this.var_2685 = param1;
      }
   }
}
