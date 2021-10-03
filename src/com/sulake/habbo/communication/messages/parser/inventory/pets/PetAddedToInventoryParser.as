package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetAddedToInventoryParser implements IMessageParser
   {
       
      
      private var var_826:PetData;
      
      private var var_2651:Boolean;
      
      public function PetAddedToInventoryParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_826 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_826 = new PetData(param1);
         this.var_2651 = param1.readBoolean();
         return true;
      }
      
      public function get pet() : PetData
      {
         return this.var_826;
      }
      
      public function get purchased() : Boolean
      {
         return this.var_2651;
      }
   }
}
