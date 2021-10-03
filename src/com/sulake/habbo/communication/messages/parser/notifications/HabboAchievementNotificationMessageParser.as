package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboAchievementNotificationMessageParser implements IMessageParser
   {
       
      
      private var _type:int;
      
      private var var_1348:int;
      
      private var var_1661:int;
      
      private var var_2162:int;
      
      private var var_1676:int;
      
      private var var_1347:int;
      
      private var var_2113:String = "";
      
      private var var_2609:String = "";
      
      private var var_2608:int;
      
      public function HabboAchievementNotificationMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._type = param1.readInteger();
         this.var_1348 = param1.readInteger();
         this.var_2113 = param1.readString();
         this.var_1661 = param1.readInteger();
         this.var_2162 = param1.readInteger();
         this.var_1676 = param1.readInteger();
         this.var_1347 = param1.readInteger();
         this.var_2608 = param1.readInteger();
         this.var_2609 = param1.readString();
         return true;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1348;
      }
      
      public function get points() : int
      {
         return this.var_1661;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2162;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1676;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_1347;
      }
      
      public function get badgeID() : String
      {
         return this.var_2113;
      }
      
      public function get achievementID() : int
      {
         return this.var_2608;
      }
      
      public function get removedBadgeID() : String
      {
         return this.var_2609;
      }
   }
}
