package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1907:int = 1;
      
      public static const const_1549:int = 2;
       
      
      private var var_889:String;
      
      private var var_2418:int;
      
      private var var_2420:int;
      
      private var var_2414:int;
      
      private var var_2417:int;
      
      private var var_2412:Boolean;
      
      private var var_2172:Boolean;
      
      private var var_2415:int;
      
      private var var_2416:int;
      
      private var var_2413:Boolean;
      
      private var var_2419:int;
      
      private var var_2411:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_889 = param1.readString();
         this.var_2418 = param1.readInteger();
         this.var_2420 = param1.readInteger();
         this.var_2414 = param1.readInteger();
         this.var_2417 = param1.readInteger();
         this.var_2412 = param1.readBoolean();
         this.var_2172 = param1.readBoolean();
         this.var_2415 = param1.readInteger();
         this.var_2416 = param1.readInteger();
         this.var_2413 = param1.readBoolean();
         this.var_2419 = param1.readInteger();
         this.var_2411 = param1.readInteger();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_889;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return this.var_2418;
      }
      
      public function get memberPeriods() : int
      {
         return this.var_2420;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return this.var_2414;
      }
      
      public function get responseType() : int
      {
         return this.var_2417;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return this.var_2412;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2172;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2415;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2416;
      }
      
      public function get isShowBasicPromo() : Boolean
      {
         return this.var_2413;
      }
      
      public function get basicNormalPrice() : int
      {
         return this.var_2419;
      }
      
      public function get basicPromoPrice() : int
      {
         return this.var_2411;
      }
   }
}
