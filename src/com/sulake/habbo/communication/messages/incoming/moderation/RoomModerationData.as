package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_323:int;
      
      private var var_2129:int;
      
      private var var_2372:Boolean;
      
      private var var_2004:int;
      
      private var _ownerName:String;
      
      private var var_104:RoomData;
      
      private var var_703:RoomData;
      
      private var _disposed:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         this.var_323 = param1.readInteger();
         this.var_2129 = param1.readInteger();
         this.var_2372 = param1.readBoolean();
         this.var_2004 = param1.readInteger();
         this._ownerName = param1.readString();
         this.var_104 = new RoomData(param1);
         this.var_703 = new RoomData(param1);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_104 != null)
         {
            this.var_104.dispose();
            this.var_104 = null;
         }
         if(this.var_703 != null)
         {
            this.var_703.dispose();
            this.var_703 = null;
         }
      }
      
      public function get flatId() : int
      {
         return this.var_323;
      }
      
      public function get userCount() : int
      {
         return this.var_2129;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return this.var_2372;
      }
      
      public function get ownerId() : int
      {
         return this.var_2004;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get room() : RoomData
      {
         return this.var_104;
      }
      
      public function get event() : RoomData
      {
         return this.var_703;
      }
   }
}
