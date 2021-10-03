package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2592:int;
      
      private var var_1277:String;
      
      private var _objId:int;
      
      private var var_1658:int;
      
      private var _category:int;
      
      private var var_1974:String;
      
      private var var_2689:Boolean;
      
      private var var_2690:Boolean;
      
      private var var_2688:Boolean;
      
      private var var_2638:Boolean;
      
      private var var_2518:int;
      
      private var var_1374:int;
      
      private var var_1731:String = "";
      
      private var var_2028:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2592 = param1;
         this.var_1277 = param2;
         this._objId = param3;
         this.var_1658 = param4;
         this._category = param5;
         this.var_1974 = param6;
         this.var_2689 = param7;
         this.var_2690 = param8;
         this.var_2688 = param9;
         this.var_2638 = param10;
         this.var_2518 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_1731 = param1;
         this.var_1374 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2592;
      }
      
      public function get itemType() : String
      {
         return this.var_1277;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_1658;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_1974;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2689;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2690;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2688;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2638;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2518;
      }
      
      public function get slotId() : String
      {
         return this.var_1731;
      }
      
      public function get songId() : int
      {
         return this.var_2028;
      }
      
      public function get extra() : int
      {
         return this.var_1374;
      }
   }
}
