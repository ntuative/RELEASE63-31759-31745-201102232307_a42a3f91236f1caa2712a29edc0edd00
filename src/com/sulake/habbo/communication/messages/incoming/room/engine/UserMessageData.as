package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1141:String = "M";
      
      public static const const_1412:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_158:Number = 0;
      
      private var var_159:Number = 0;
      
      private var var_261:int = 0;
      
      private var _name:String = "";
      
      private var _userType:int = 0;
      
      private var var_814:String = "";
      
      private var var_595:String = "";
      
      private var var_2086:String = "";
      
      private var var_2056:int;
      
      private var var_2082:int = 0;
      
      private var var_2081:String = "";
      
      private var var_2084:int = 0;
      
      private var var_2085:int = 0;
      
      private var var_2083:String = "";
      
      private var var_167:Boolean = false;
      
      public function UserMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_167 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_167)
         {
            this._x = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_158;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_167)
         {
            this.var_158 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_159;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_167)
         {
            this.var_159 = param1;
         }
      }
      
      public function get dir() : int
      {
         return this.var_261;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_167)
         {
            this.var_261 = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_167)
         {
            this._name = param1;
         }
      }
      
      public function get userType() : int
      {
         return this._userType;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_167)
         {
            this._userType = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_814;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_167)
         {
            this.var_814 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this.var_595;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_167)
         {
            this.var_595 = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2086;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_167)
         {
            this.var_2086 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_2056;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_167)
         {
            this.var_2056 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_2082;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_167)
         {
            this.var_2082 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2081;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_167)
         {
            this.var_2081 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2084;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_167)
         {
            this.var_2084 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_2085;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_167)
         {
            this.var_2085 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2083;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_167)
         {
            this.var_2083 = param1;
         }
      }
   }
}
