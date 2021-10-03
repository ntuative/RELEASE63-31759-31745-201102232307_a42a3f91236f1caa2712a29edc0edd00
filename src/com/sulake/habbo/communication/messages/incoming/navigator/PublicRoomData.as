package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2573:String;
      
      private var var_2376:int;
      
      private var var_2452:int;
      
      private var var_2377:String;
      
      private var var_2574:int;
      
      private var var_1576:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2573 = param1.readString();
         this.var_2376 = param1.readInteger();
         this.var_2452 = param1.readInteger();
         this.var_2377 = param1.readString();
         this.var_2574 = param1.readInteger();
         this.var_1576 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2573;
      }
      
      public function get unitPort() : int
      {
         return this.var_2376;
      }
      
      public function get worldId() : int
      {
         return this.var_2452;
      }
      
      public function get castLibs() : String
      {
         return this.var_2377;
      }
      
      public function get maxUsers() : int
      {
         return this.var_2574;
      }
      
      public function get nodeId() : int
      {
         return this.var_1576;
      }
   }
}
