package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1731:int;
      
      private var var_2427:String;
      
      private var var_906:String;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1731 = param1.readInteger();
         this.var_2427 = param1.readString();
         this.var_906 = param1.readString();
      }
      
      public function get slotId() : int
      {
         return this.var_1731;
      }
      
      public function get figureString() : String
      {
         return this.var_2427;
      }
      
      public function get gender() : String
      {
         return this.var_906;
      }
   }
}
