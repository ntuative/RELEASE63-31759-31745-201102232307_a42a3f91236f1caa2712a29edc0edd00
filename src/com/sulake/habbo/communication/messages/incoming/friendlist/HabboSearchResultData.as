package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2484:int;
      
      private var var_1870:String;
      
      private var var_2498:String;
      
      private var var_2494:Boolean;
      
      private var var_2497:Boolean;
      
      private var var_2496:int;
      
      private var var_2499:String;
      
      private var var_2495:String;
      
      private var var_1871:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2484 = param1.readInteger();
         this.var_1870 = param1.readString();
         this.var_2498 = param1.readString();
         this.var_2494 = param1.readBoolean();
         this.var_2497 = param1.readBoolean();
         param1.readString();
         this.var_2496 = param1.readInteger();
         this.var_2499 = param1.readString();
         this.var_2495 = param1.readString();
         this.var_1871 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2484;
      }
      
      public function get avatarName() : String
      {
         return this.var_1870;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2498;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2494;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2497;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2496;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2499;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2495;
      }
      
      public function get realName() : String
      {
         return this.var_1871;
      }
   }
}
