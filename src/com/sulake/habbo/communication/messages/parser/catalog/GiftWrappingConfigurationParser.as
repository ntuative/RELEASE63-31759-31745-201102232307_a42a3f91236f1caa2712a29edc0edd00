package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class GiftWrappingConfigurationParser implements IMessageParser
   {
       
      
      private var var_2257:Boolean;
      
      private var var_2258:int;
      
      private var var_1618:Array;
      
      private var var_692:Array;
      
      private var var_691:Array;
      
      public function GiftWrappingConfigurationParser()
      {
         super();
      }
      
      public function get isWrappingEnabled() : Boolean
      {
         return this.var_2257;
      }
      
      public function get wrappingPrice() : int
      {
         return this.var_2258;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1618;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_692;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_691;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         this.var_1618 = [];
         this.var_692 = [];
         this.var_691 = [];
         this.var_2257 = param1.readBoolean();
         this.var_2258 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_1618.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_692.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_691.push(param1.readInteger());
            _loc2_++;
         }
         return true;
      }
   }
}
