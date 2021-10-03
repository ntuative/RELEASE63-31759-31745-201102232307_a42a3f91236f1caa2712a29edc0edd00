package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_822:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_623:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_822);
         this.var_623 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_623;
      }
   }
}
