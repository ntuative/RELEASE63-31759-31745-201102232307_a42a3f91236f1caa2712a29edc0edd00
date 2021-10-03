package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_923:BigInteger;
      
      private var var_2195:BigInteger;
      
      private var var_1798:BigInteger;
      
      private var var_2476:BigInteger;
      
      private var var_1401:BigInteger;
      
      private var var_1797:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1401 = param1;
         this.var_1797 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1401.toString() + ",generator: " + this.var_1797.toString() + ",secret: " + param1);
         this.var_923 = new BigInteger();
         this.var_923.fromRadix(param1,param2);
         this.var_2195 = this.var_1797.modPow(this.var_923,this.var_1401);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1798 = new BigInteger();
         this.var_1798.fromRadix(param1,param2);
         this.var_2476 = this.var_1798.modPow(this.var_923,this.var_1401);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2195.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2476.toRadix(param1);
      }
   }
}
