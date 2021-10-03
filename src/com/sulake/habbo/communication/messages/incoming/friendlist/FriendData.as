package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_906:int;
      
      private var var_774:Boolean;
      
      private var var_1662:Boolean;
      
      private var var_595:String;
      
      private var var_1284:int;
      
      private var var_1902:String;
      
      private var var_1869:String;
      
      private var var_1871:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_906 = param1.readInteger();
         this.var_774 = param1.readBoolean();
         this.var_1662 = param1.readBoolean();
         this.var_595 = param1.readString();
         this.var_1284 = param1.readInteger();
         this.var_1902 = param1.readString();
         this.var_1869 = param1.readString();
         this.var_1871 = param1.readString();
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_906;
      }
      
      public function get online() : Boolean
      {
         return this.var_774;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1662;
      }
      
      public function get figure() : String
      {
         return this.var_595;
      }
      
      public function get categoryId() : int
      {
         return this.var_1284;
      }
      
      public function get motto() : String
      {
         return this.var_1902;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1869;
      }
      
      public function get realName() : String
      {
         return this.var_1871;
      }
   }
}
