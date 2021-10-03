package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_129:String = "RSPE_VOTE_QUESTION";
      
      public static const const_125:String = "RSPE_VOTE_RESULT";
       
      
      private var var_1120:String = "";
      
      private var var_1266:Array;
      
      private var var_1080:Array;
      
      private var var_1858:int = 0;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         this.var_1266 = [];
         this.var_1080 = [];
         super(param1,param2,param7,param8);
         this.var_1120 = param3;
         this.var_1266 = param4;
         this.var_1080 = param5;
         if(this.var_1080 == null)
         {
            this.var_1080 = [];
         }
         this.var_1858 = param6;
      }
      
      public function get question() : String
      {
         return this.var_1120;
      }
      
      public function get choices() : Array
      {
         return this.var_1266.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1080.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_1858;
      }
   }
}
