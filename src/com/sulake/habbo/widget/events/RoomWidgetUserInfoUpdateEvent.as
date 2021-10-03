package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_120:String = "RWUIUE_OWN_USER";
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_133:String = "RWUIUE_PEER";
      
      public static const TRADE_REASON_OK:int = 0;
      
      public static const const_992:int = 2;
      
      public static const const_1217:int = 3;
      
      public static const const_1554:String = "BOT";
       
      
      private var _name:String = "";
      
      private var var_1902:String = "";
      
      private var var_2056:int;
      
      private var var_2082:int = 0;
      
      private var var_2085:int = 0;
      
      private var var_595:String = "";
      
      private var var_44:BitmapData = null;
      
      private var var_254:Array;
      
      private var var_1820:Array;
      
      private var var_1393:int = 0;
      
      private var var_2539:String = "";
      
      private var var_2540:int = 0;
      
      private var var_2538:int = 0;
      
      private var var_1791:Boolean = false;
      
      private var var_1871:String = "";
      
      private var var_2671:Boolean = false;
      
      private var var_2668:Boolean = true;
      
      private var _respectLeft:int = 0;
      
      private var var_2667:Boolean = false;
      
      private var var_2663:Boolean = false;
      
      private var var_2664:Boolean = false;
      
      private var var_2670:Boolean = false;
      
      private var var_2666:Boolean = false;
      
      private var var_2669:Boolean = false;
      
      private var var_2665:int = 0;
      
      private var var_1788:Boolean = false;
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_254 = [];
         this.var_1820 = [];
         super(param1,param2,param3);
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1902 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1902;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2056 = param1;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2056;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2082 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2082;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2085 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2085;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_595 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_595;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_44 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_44;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_254 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_254;
      }
      
      public function get givableBadges() : Array
      {
         return this.var_1820;
      }
      
      public function set givableBadges(param1:Array) : void
      {
         this.var_1820 = param1;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1393 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1393;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2539 = param1;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2539;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_2671 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_2671;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this._respectLeft = param1;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_2667 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_2667;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_2663 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_2663;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_2664 = param1;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_2664;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_2670 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_2670;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_2666 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_2666;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_2669 = param1;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_2669;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_2665 = param1;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_2665;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_2668 = param1;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_2668;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1788 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1788;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2540 = param1;
      }
      
      public function get carryItem() : int
      {
         return this.var_2540;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2538 = param1;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2538;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_1791 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_1791;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1871 = param1;
      }
      
      public function get realName() : String
      {
         return this.var_1871;
      }
   }
}
