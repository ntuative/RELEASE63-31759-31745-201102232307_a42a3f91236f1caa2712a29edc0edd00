package com.sulake.habbo.widget.infostand
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.GivableBadgeData;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetBadgeImageUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFurniInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetCommandsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserBadgesUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserFigureUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserGivableBadgesUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserTagsUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetUserActionMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class InfostandWidget extends RoomWidgetBase
   {
       
      
      private const const_1690:String = "infostand_user_view";
      
      private const const_1688:String = "infostand_furni_view";
      
      private const const_1687:String = "infostand_pet_view";
      
      private const const_1689:String = "infostand_bot_view";
      
      private var var_1067:InfoStandFurniView;
      
      private var var_125:InfoStandUserView;
      
      private var var_332:InfoStandPetView;
      
      private var var_398:InfoStandBotView;
      
      private var var_2231:Array;
      
      private var var_1325:InfostandUserData;
      
      private var var_502:InfostandFurniData;
      
      private var _petData:InfoStandPetData;
      
      private var _mainContainer:IWindowContainer;
      
      private var var_147:Timer;
      
      private var _config:IHabboConfigurationManager;
      
      private var _catalog:IHabboCatalog;
      
      private const const_1974:int = 3000;
      
      public function InfostandWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IHabboConfigurationManager, param5:IHabboCatalog)
      {
         super(param1,param2,param3);
         this._config = param4;
         this._catalog = param5;
         this.var_1067 = new InfoStandFurniView(this,this.const_1688,this._catalog);
         this.var_125 = new InfoStandUserView(this,this.const_1690);
         this.var_332 = new InfoStandPetView(this,this.const_1687,this._catalog);
         this.var_398 = new InfoStandBotView(this,this.const_1689);
         this.var_1325 = new InfostandUserData();
         this.var_502 = new InfostandFurniData();
         this._petData = new InfoStandPetData();
         this.var_147 = new Timer(this.const_1974);
         this.var_147.addEventListener(TimerEvent.TIMER,this.onUpdateTimer);
         this.mainContainer.visible = false;
      }
      
      override public function get mainWindow() : IWindow
      {
         return this.mainContainer;
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return this._config;
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(this._mainContainer == null)
         {
            this._mainContainer = windowManager.createWindow("infostand_main_container","",HabboWindowType.const_61,HabboWindowStyle.const_42,HabboWindowParam.const_42,new Rectangle(0,0,50,100)) as IWindowContainer;
            this._mainContainer.tags.push("room_widget_infostand");
            this._mainContainer.background = true;
            this._mainContainer.color = 0;
         }
         return this._mainContainer;
      }
      
      public function getXmlWindow(param1:String) : IWindow
      {
         var asset:IAsset = null;
         var xmlAsset:XmlAsset = null;
         var name:String = param1;
         var window:IWindow = null;
         try
         {
            asset = assets.getAssetByName(name);
            xmlAsset = XmlAsset(asset);
            window = windowManager.buildFromXML(XML(xmlAsset.content));
         }
         catch(e:Error)
         {
         }
         return window;
      }
      
      override public function dispose() : void
      {
         if(this.var_147)
         {
            this.var_147.stop();
         }
         this.var_147 = null;
         if(this.var_125)
         {
            this.var_125.dispose();
         }
         this.var_125 = null;
         if(this.var_1067)
         {
            this.var_1067.dispose();
         }
         this.var_1067 = null;
         if(this.var_398)
         {
            this.var_398.dispose();
         }
         this.var_398 = null;
         if(this.var_332)
         {
            this.var_332.dispose();
         }
         this.var_332 = null;
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_367,this.onRoomObjectSelected);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_143,this.onClose);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_160,this.onRoomObjectRemoved);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_136,this.onRoomObjectRemoved);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_120,this.onUserInfo);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_133,this.onUserInfo);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.onBotInfo);
         param1.addEventListener(RoomWidgetFurniInfoUpdateEvent.const_323,this.onFurniInfo);
         param1.addEventListener(RoomWidgetUserTagsUpdateEvent.const_155,this.onUserTags);
         param1.addEventListener(RoomWidgetUserFigureUpdateEvent.const_164,this.onUserFigureUpdate);
         param1.addEventListener(RoomWidgetUserBadgesUpdateEvent.const_71,this.onUserBadges);
         param1.addEventListener(RoomWidgetUserGivableBadgesUpdateEvent.const_774,this.onUserGivableBadges);
         param1.addEventListener(RoomWidgetBadgeImageUpdateEvent.const_820,this.onBadgeImage);
         param1.addEventListener(RoomWidgetPetInfoUpdateEvent.const_99,this.onPetInfo);
         param1.addEventListener(RoomWidgetPetCommandsUpdateEvent.PET_COMMANDS,this.onPetCommands);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_367,this.onRoomObjectSelected);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_143,this.onClose);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_160,this.onRoomObjectRemoved);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_136,this.onRoomObjectRemoved);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_120,this.onUserInfo);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_133,this.onUserInfo);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.onBotInfo);
         param1.removeEventListener(RoomWidgetFurniInfoUpdateEvent.const_323,this.onFurniInfo);
         param1.removeEventListener(RoomWidgetUserTagsUpdateEvent.const_155,this.onUserTags);
         param1.removeEventListener(RoomWidgetUserFigureUpdateEvent.const_164,this.onUserFigureUpdate);
         param1.removeEventListener(RoomWidgetUserBadgesUpdateEvent.const_71,this.onUserBadges);
         param1.removeEventListener(RoomWidgetUserGivableBadgesUpdateEvent.const_774,this.onUserGivableBadges);
         param1.removeEventListener(RoomWidgetBadgeImageUpdateEvent.const_820,this.onBadgeImage);
         param1.removeEventListener(RoomWidgetPetInfoUpdateEvent.const_99,this.onPetInfo);
         param1.removeEventListener(RoomWidgetPetCommandsUpdateEvent.PET_COMMANDS,this.onPetCommands);
      }
      
      public function get userData() : InfostandUserData
      {
         return this.var_1325;
      }
      
      public function get furniData() : InfostandFurniData
      {
         return this.var_502;
      }
      
      public function get petData() : InfoStandPetData
      {
         return this._petData;
      }
      
      private function onUpdateTimer(param1:TimerEvent) : void
      {
         if(this.var_332 == null)
         {
            return;
         }
         messageListener.processWidgetMessage(new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.const_395,this.var_332.getCurrentPetId()));
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         this.userData.setData(param1);
         this.var_125.update(param1);
         this.selectView(this.const_1690);
         if(this.var_147)
         {
            this.var_147.stop();
         }
      }
      
      private function onBotInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         this.userData.setData(param1);
         this.var_398.update(param1);
         this.selectView(this.const_1689);
         if(this.var_147)
         {
            this.var_147.stop();
         }
      }
      
      private function onFurniInfo(param1:RoomWidgetFurniInfoUpdateEvent) : void
      {
         this.furniData.setData(param1);
         this.var_1067.update(param1);
         this.selectView(this.const_1688);
         if(this.var_147)
         {
            this.var_147.stop();
         }
      }
      
      private function onPetInfo(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         this.petData.setData(param1);
         this.userData.petRespectLeft = param1.petRespectLeft;
         this.var_332.update(this.petData);
         this.selectView(this.const_1687);
         if(this.var_147)
         {
            this.var_147.start();
         }
      }
      
      private function onPetCommands(param1:RoomWidgetPetCommandsUpdateEvent) : void
      {
         this.var_332.updateEnabledTrainingCommands(param1.id,new CommandConfiguration(param1.allCommands,param1.enabledCommands));
      }
      
      private function onUserTags(param1:RoomWidgetUserTagsUpdateEvent) : void
      {
         if(param1.isOwnUser)
         {
            this.var_2231 = param1.tags;
         }
         if(param1.userId != this.userData.userId)
         {
            return;
         }
         if(param1.isOwnUser)
         {
            this.var_125.setTags(param1.tags);
         }
         else
         {
            this.var_125.setTags(param1.tags,this.var_2231);
         }
      }
      
      private function onUserFigureUpdate(param1:RoomWidgetUserFigureUpdateEvent) : void
      {
         if(param1.userId != this.userData.userId)
         {
            return;
         }
         if(this.userData.isBot())
         {
            this.var_398.image = param1.image;
         }
         else
         {
            this.var_125.image = param1.image;
            this.var_125.setMotto(param1.customInfo,param1.isOwnUser);
            this.var_125.achievementScore = param1.achievementScore;
         }
      }
      
      private function onUserBadges(param1:RoomWidgetUserBadgesUpdateEvent) : void
      {
         if(param1.userId != this.userData.userId)
         {
            return;
         }
         this.userData.badges = param1.badges;
         this.var_125.clearBadges();
      }
      
      private function onUserGivableBadges(param1:RoomWidgetUserGivableBadgesUpdateEvent) : void
      {
         this.userData.givableBadges = param1.badges;
         this.var_125.updateGivableBadges();
      }
      
      private function onBadgeImage(param1:RoomWidgetBadgeImageUpdateEvent) : void
      {
         var _loc6_:* = null;
         var _loc2_:int = this.userData.badges.indexOf(param1.badgeID);
         if(_loc2_ >= 0)
         {
            if(this.userData.isBot())
            {
               this.var_398.setBadgeImage(_loc2_,param1.badgeImage);
            }
            else
            {
               this.var_125.setBadgeImage(_loc2_,param1.badgeImage);
            }
            return;
         }
         var _loc4_:* = [];
         var _loc5_:int = 0;
         for each(_loc6_ in this.userData.givableBadges)
         {
            if(param1.badgeID == _loc6_.achievementTypeName)
            {
               if(!this.userData.isBot())
               {
                  _loc4_.push(_loc5_);
               }
            }
            _loc5_++;
         }
         if(_loc4_.length > 0)
         {
            this.var_125.setGivableBadgeImage(_loc4_,param1.badgeImage);
            return;
         }
         if(param1.badgeID == this.userData.groupBadgeId)
         {
            this.var_125.setGroupBadgeImage(param1.badgeImage);
         }
      }
      
      private function onRoomObjectSelected(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         var _loc2_:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_381,param1.id,param1.category);
         messageListener.processWidgetMessage(_loc2_);
      }
      
      private function onRoomObjectRemoved(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         var _loc2_:* = false;
         switch(param1.type)
         {
            case RoomWidgetRoomObjectUpdateEvent.const_136:
               _loc2_ = param1.id == this.var_502.id;
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_160:
               if(this.var_125 != null && this.var_125.window != null && this.var_125.window.visible)
               {
                  _loc2_ = param1.id == this.var_1325.userRoomId;
                  break;
               }
               if(this.var_332 != null && this.var_332.window != null && this.var_332.window.visible)
               {
                  _loc2_ = param1.id == this._petData.roomIndex;
                  break;
               }
               if(this.var_398 != null && this.var_398.window != null && this.var_398.window.visible)
               {
                  _loc2_ = param1.id == this.var_1325.userRoomId;
                  break;
               }
         }
         if(_loc2_)
         {
            this.close();
         }
      }
      
      public function close() : void
      {
         this.hideChildren();
         if(this.var_147)
         {
            this.var_147.stop();
         }
      }
      
      private function onClose(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         this.close();
         if(this.var_147)
         {
            this.var_147.stop();
         }
      }
      
      private function hideChildren() : void
      {
         var _loc1_:int = 0;
         if(this._mainContainer != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this._mainContainer.numChildren)
            {
               this._mainContainer.getChildAt(_loc1_).visible = false;
               _loc1_++;
            }
         }
      }
      
      private function selectView(param1:String) : void
      {
         this.hideChildren();
         var _loc2_:IWindow = this.mainContainer.getChildByName(param1) as IWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.visible = true;
         this.mainContainer.visible = true;
         this.mainContainer.width = _loc2_.width;
         this.mainContainer.height = _loc2_.height;
      }
      
      public function refreshContainer() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.mainContainer.numChildren)
         {
            _loc1_ = this.mainContainer.getChildAt(_loc2_);
            if(_loc1_.visible)
            {
               this.mainContainer.width = _loc1_.width;
               this.mainContainer.height = _loc1_.height;
            }
            _loc2_++;
         }
      }
   }
}
