package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_1559:Boolean;
      
      private var var_826:PetData;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1559 = param1.readBoolean();
         this.var_826 = new PetData(param1);
         Logger.log("Got PetReceived: " + this.var_1559 + ", " + this.var_826.id + ", " + this.var_826.name + ", " + this.var_826.type + ", " + this.var_826.breed + ", " + this.pet.color);
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return this.var_1559;
      }
      
      public function get pet() : PetData
      {
         return this.var_826;
      }
   }
}
