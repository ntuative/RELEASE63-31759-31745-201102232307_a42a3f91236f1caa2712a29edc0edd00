package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1808:int = 0;
      
      public static const const_1538:int = 1;
      
      public static const const_1643:int = 2;
      
      public static const const_1919:int = 3;
      
      public static const const_1904:int = 4;
      
      public static const const_1896:int = 5;
      
      public static const const_1481:int = 10;
      
      public static const const_1936:int = 11;
      
      public static const const_1913:int = 12;
      
      public static const const_1829:int = 13;
      
      public static const const_1736:int = 16;
      
      public static const const_1887:int = 17;
      
      public static const const_1918:int = 18;
      
      public static const const_1791:int = 19;
      
      public static const const_1854:int = 20;
      
      public static const const_1771:int = 22;
      
      public static const const_1752:int = 23;
      
      public static const const_1864:int = 24;
      
      public static const const_1909:int = 25;
      
      public static const const_1722:int = 26;
      
      public static const const_1932:int = 27;
      
      public static const const_1745:int = 28;
      
      public static const const_1929:int = 29;
      
      public static const const_1765:int = 100;
      
      public static const const_1742:int = 101;
      
      public static const const_1730:int = 102;
      
      public static const const_1818:int = 103;
      
      public static const const_1905:int = 104;
      
      public static const const_1821:int = 105;
      
      public static const const_1827:int = 106;
      
      public static const const_1944:int = 107;
      
      public static const const_1726:int = 108;
      
      public static const const_1787:int = 109;
      
      public static const const_1938:int = 110;
      
      public static const const_1836:int = 111;
      
      public static const const_1874:int = 112;
      
      public static const const_1759:int = 113;
      
      public static const const_1903:int = 114;
      
      public static const const_1879:int = 115;
      
      public static const const_1724:int = 116;
      
      public static const const_1945:int = 117;
      
      public static const const_1841:int = 118;
      
      public static const const_1720:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1538:
            case const_1481:
               return "banned";
            case const_1643:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
