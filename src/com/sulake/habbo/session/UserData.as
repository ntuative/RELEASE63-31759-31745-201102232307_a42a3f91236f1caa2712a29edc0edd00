package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var _type:int = 0;
      
      private var var_814:String = "";
      
      private var var_595:String = "";
      
      private var var_2086:String = "";
      
      private var var_2056:int;
      
      private var var_2082:int = 0;
      
      private var var_2081:String = "";
      
      private var var_2084:int = 0;
      
      private var var_2085:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2056;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2056 = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
      }
      
      public function get sex() : String
      {
         return this.var_814;
      }
      
      public function set sex(param1:String) : void
      {
         this.var_814 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_595;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_595 = param1;
      }
      
      public function get custom() : String
      {
         return this.var_2086;
      }
      
      public function set custom(param1:String) : void
      {
         this.var_2086 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2082;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2082 = param1;
      }
      
      public function get groupID() : String
      {
         return this.var_2081;
      }
      
      public function set groupID(param1:String) : void
      {
         this.var_2081 = param1;
      }
      
      public function get groupStatus() : int
      {
         return this.var_2084;
      }
      
      public function set groupStatus(param1:int) : void
      {
         this.var_2084 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2085;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2085 = param1;
      }
   }
}
