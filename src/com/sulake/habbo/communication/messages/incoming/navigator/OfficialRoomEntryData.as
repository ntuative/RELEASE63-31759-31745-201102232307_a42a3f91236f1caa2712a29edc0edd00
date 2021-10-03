package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1055:int = 1;
      
      public static const const_858:int = 2;
      
      public static const const_729:int = 3;
      
      public static const const_1492:int = 4;
       
      
      private var _index:int;
      
      private var var_2239:String;
      
      private var var_2236:String;
      
      private var var_2234:Boolean;
      
      private var var_2238:String;
      
      private var var_957:String;
      
      private var var_2237:int;
      
      private var var_2129:int;
      
      private var _type:int;
      
      private var var_2235:String;
      
      private var var_871:GuestRoomData;
      
      private var var_872:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2239 = param1.readString();
         this.var_2236 = param1.readString();
         this.var_2234 = param1.readInteger() == 1;
         this.var_2238 = param1.readString();
         this.var_957 = param1.readString();
         this.var_2237 = param1.readInteger();
         this.var_2129 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1055)
         {
            this.var_2235 = param1.readString();
         }
         else if(this._type == const_729)
         {
            this.var_872 = new PublicRoomData(param1);
         }
         else if(this._type == const_858)
         {
            this.var_871 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_871 != null)
         {
            this.var_871.dispose();
            this.var_871 = null;
         }
         if(this.var_872 != null)
         {
            this.var_872.dispose();
            this.var_872 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2239;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2236;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2234;
      }
      
      public function get picText() : String
      {
         return this.var_2238;
      }
      
      public function get picRef() : String
      {
         return this.var_957;
      }
      
      public function get folderId() : int
      {
         return this.var_2237;
      }
      
      public function get tag() : String
      {
         return this.var_2235;
      }
      
      public function get userCount() : int
      {
         return this.var_2129;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_871;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_872;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1055)
         {
            return 0;
         }
         if(this.type == const_858)
         {
            return this.var_871.maxUserCount;
         }
         if(this.type == const_729)
         {
            return this.var_872.maxUsers;
         }
         return 0;
      }
   }
}
