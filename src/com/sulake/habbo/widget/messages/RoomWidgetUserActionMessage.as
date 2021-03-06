package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_799:String = "RWUAM_WHISPER_USER";
      
      public static const const_892:String = "RWUAM_IGNORE_USER";
      
      public static const const_852:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_459:String = "RWUAM_KICK_USER";
      
      public static const const_761:String = "RWUAM_BAN_USER";
      
      public static const const_784:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_821:String = "RWUAM_RESPECT_USER";
      
      public static const const_807:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_691:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_844:String = "RWUAM_START_TRADING";
      
      public static const const_730:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_524:String = "RWUAM_KICK_BOT";
      
      public static const const_877:String = "RWUAM_REPORT";
      
      public static const const_569:String = "RWUAM_PICKUP_PET";
      
      public static const const_1520:String = "RWUAM_TRAIN_PET";
      
      public static const const_526:String = " RWUAM_RESPECT_PET";
      
      public static const const_395:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_762:String = "RWUAM_START_NAME_CHANGE";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         this._userId = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
