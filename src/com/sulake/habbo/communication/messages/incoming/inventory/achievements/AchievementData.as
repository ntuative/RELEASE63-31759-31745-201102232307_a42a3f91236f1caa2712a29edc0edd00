package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1348:int;
      
      private var var_293:String;
      
      private var var_2163:int;
      
      private var var_2162:int;
      
      private var var_1676:int;
      
      private var var_2164:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1348 = param1.readInteger();
         this.var_293 = param1.readString();
         this.var_2163 = param1.readInteger();
         this.var_2162 = param1.readInteger();
         this.var_1676 = param1.readInteger();
         this.var_2164 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_293;
      }
      
      public function get level() : int
      {
         return this.var_1348;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_2163;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2162;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1676;
      }
      
      public function get currentPoints() : int
      {
         return this.var_2164;
      }
   }
}
