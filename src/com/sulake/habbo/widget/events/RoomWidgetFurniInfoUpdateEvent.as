package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetFurniInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_323:String = "RWFIUE_FURNI";
       
      
      private var _id:int = 0;
      
      private var _category:int = 0;
      
      private var _name:String = "";
      
      private var var_1507:String = "";
      
      private var var_44:BitmapData = null;
      
      private var var_2013:Boolean = false;
      
      private var var_2012:Boolean = false;
      
      private var var_1788:Boolean = false;
      
      private var var_1789:Boolean = false;
      
      private var var_2010:Boolean = false;
      
      private var var_1883:int = -1;
      
      private var var_2011:int = -1;
      
      private var _offerId:int = -1;
      
      public function RoomWidgetFurniInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set category(param1:int) : void
      {
         this._category = param1;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1507 = param1;
      }
      
      public function get description() : String
      {
         return this.var_1507;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_44 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_44;
      }
      
      public function set isWallItem(param1:Boolean) : void
      {
         this.var_2013 = param1;
      }
      
      public function get isWallItem() : Boolean
      {
         return this.var_2013;
      }
      
      public function set isStickie(param1:Boolean) : void
      {
         this.var_2012 = param1;
      }
      
      public function get isStickie() : Boolean
      {
         return this.var_2012;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1788 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1788;
      }
      
      public function set isRoomController(param1:Boolean) : void
      {
         this.var_1789 = param1;
      }
      
      public function get isRoomController() : Boolean
      {
         return this.var_1789;
      }
      
      public function set isAnyRoomController(param1:Boolean) : void
      {
         this.var_2010 = param1;
      }
      
      public function get isAnyRoomController() : Boolean
      {
         return this.var_2010;
      }
      
      public function set expiration(param1:int) : void
      {
         this.var_1883 = param1;
      }
      
      public function get expiration() : int
      {
         return this.var_1883;
      }
      
      public function set catalogPageId(param1:int) : void
      {
         this.var_2011 = param1;
      }
      
      public function get catalogPageId() : int
      {
         return this.var_2011;
      }
      
      public function set offerId(param1:int) : void
      {
         this._offerId = param1;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
   }
}
