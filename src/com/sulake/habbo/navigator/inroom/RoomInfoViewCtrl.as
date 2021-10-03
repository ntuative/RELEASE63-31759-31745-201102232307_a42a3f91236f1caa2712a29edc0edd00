package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.ToggleStaffPickMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var _window:IWindowContainer;
      
      private var var_2760:int;
      
      private var var_330:RoomEventViewCtrl;
      
      private var var_239:Timer;
      
      private var var_171:RoomSettingsCtrl;
      
      private var var_240:RoomThumbnailCtrl;
      
      private var var_1117:TagRenderer;
      
      private var var_287:IWindowContainer;
      
      private var var_396:IWindowContainer;
      
      private var var_694:IWindowContainer;
      
      private var var_2218:IWindowContainer;
      
      private var var_2215:IWindowContainer;
      
      private var var_1314:IWindowContainer;
      
      private var var_834:ITextWindow;
      
      private var var_1060:ITextWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_862:ITextWindow;
      
      private var var_1310:ITextWindow;
      
      private var var_1061:ITextWindow;
      
      private var var_859:ITextWindow;
      
      private var var_1624:ITextWindow;
      
      private var var_241:IWindowContainer;
      
      private var var_863:IWindowContainer;
      
      private var var_1623:IWindowContainer;
      
      private var var_2219:ITextWindow;
      
      private var var_693:ITextWindow;
      
      private var var_2217:IWindow;
      
      private var var_1307:IContainerButtonWindow;
      
      private var var_1313:IContainerButtonWindow;
      
      private var var_1312:IContainerButtonWindow;
      
      private var var_1306:IContainerButtonWindow;
      
      private var var_1309:IContainerButtonWindow;
      
      private var var_1308:IContainerButtonWindow;
      
      private var var_1626:IButtonWindow;
      
      private var var_1625:IButtonWindow;
      
      private var var_1622:IButtonWindow;
      
      private var var_860:IWindowContainer;
      
      private var var_1311:ITextWindow;
      
      private var var_1062:ITextFieldWindow;
      
      private var var_65:IWindowContainer;
      
      private var var_1059:IButtonWindow;
      
      private var var_861:IButtonWindow;
      
      private var var_2216:String;
      
      private var var_2220:String;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_330 = new RoomEventViewCtrl(this._navigator);
         this.var_171 = new RoomSettingsCtrl(this._navigator,this,true);
         this.var_240 = new RoomThumbnailCtrl(this._navigator);
         this.var_1117 = new TagRenderer(this._navigator);
         this._navigator.roomSettingsCtrls.push(this.var_171);
         this.var_239 = new Timer(6000,1);
         this.var_239.addEventListener(TimerEvent.TIMER,this.hideInfo);
      }
      
      public function dispose() : void
      {
         if(this._navigator.toolbar)
         {
            this._navigator.toolbar.events.removeEventListener(HabboToolbarSetIconEvent.const_102,this.onToolbarIconState);
         }
         if(this.var_239)
         {
            this.var_239.removeEventListener(TimerEvent.TIMER,this.hideInfo);
            this.var_239.reset();
            this.var_239 = null;
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         this.refresh();
      }
      
      public function startEventEdit() : void
      {
         this.var_239.reset();
         this.var_330.active = true;
         this.var_171.active = false;
         this.var_240.active = false;
         this.reload();
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_239.reset();
         this.var_171.load(param1);
         this.var_171.active = true;
         this.var_330.active = false;
         this.var_240.active = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function backToRoomSettings() : void
      {
         this.var_171.active = true;
         this.var_330.active = false;
         this.var_240.active = false;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_239.reset();
         this.var_171.active = false;
         this.var_330.active = false;
         this.var_240.active = true;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      public function close() : void
      {
         this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_1023,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         if(this._window == null)
         {
            return;
         }
         this._window.visible = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      public function reload() : void
      {
         if(this._window != null && this._window.visible)
         {
            this.refresh();
         }
      }
      
      public function open(param1:Boolean) : void
      {
         this.var_239.reset();
         this.var_330.active = false;
         this.var_171.active = false;
         this.var_240.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(this._navigator.data.enteredGuestRoom.flatId);
         }
         this.refresh();
         this._window.visible = true;
         this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_52,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         this._window.parent.activate();
         this._window.activate();
         if(!param1)
         {
            this.var_239.start();
         }
      }
      
      public function toggle() : void
      {
         this.var_239.reset();
         this.var_330.active = false;
         this.var_171.active = false;
         this.var_240.active = false;
         this.refresh();
         if(!this._window.visible)
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_52,HabboToolbarIconEnum.ROOMINFO,this._window,false));
            this._window.parent.activate();
         }
         else
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_522,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         }
      }
      
      private function refresh() : void
      {
         this.prepareWindow();
         this.refreshRoom();
         this.refreshEvent();
         this.method_9();
         this.refreshButtons();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info","buttons_container"],0,2);
         this._window.height = Util.getLowestPoint(this._window);
         this._window.y = this._window.desktop.height - this._window.height - 5;
         Logger.log("MAIN: " + this.var_287.rectangle + ", " + this.var_241.rectangle + ", " + this._window.rectangle);
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(this.var_287);
         this.var_287.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _loc1_ != null && _loc1_.flatId == this._navigator.data.homeRoomId;
         this.refreshRoomDetails(_loc1_,_loc2_);
         this.refreshPublicSpaceDetails(this._navigator.data.enteredPublicSpace);
         this.refreshRoomButtons(_loc2_);
         this.var_171.refresh(this.var_287);
         this.var_240.refresh(this.var_287);
         Util.moveChildrenToColumn(this.var_287,["room_details","room_buttons"],0,2);
         this.var_287.height = Util.getLowestPoint(this.var_287);
         this.var_287.visible = true;
         Logger.log("XORP: " + this.var_396.visible + ", " + this.var_1314.visible + ", " + this.var_694.visible + ", " + this.var_694.rectangle + ", " + this.var_287.rectangle);
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(this.var_241);
         var _loc1_:RoomEventData = this._navigator.data.roomEventData;
         this.refreshEventDetails(_loc1_);
         this.refreshEventButtons(_loc1_);
         this.var_330.refresh(this.var_241);
         if(Util.hasVisibleChildren(this.var_241) && !(this.var_171.active || this.var_240.active))
         {
            Util.moveChildrenToColumn(this.var_241,["event_details","event_buttons"],0,2);
            this.var_241.height = Util.getLowestPoint(this.var_241);
            this.var_241.visible = true;
         }
         else
         {
            this.var_241.visible = false;
         }
         Logger.log("EVENT: " + this.var_241.visible + ", " + this.var_241.rectangle);
      }
      
      private function method_9() : void
      {
         var _loc1_:* = this._navigator.configuration.getKey("embed.showInRoomInfo","RoomWidgetCreditFurniUpdateEvent") == "HabboCatalogCom_productViewWidget";
         var _loc2_:* = this._navigator.data.enteredGuestRoom != null;
         if(_loc2_ && _loc1_ && !this.var_171.active && !this.var_240.active && !this.var_330.active)
         {
            this.var_860.visible = true;
            this.var_1062.text = this.getEmbedData();
         }
         else
         {
            this.var_860.visible = false;
         }
      }
      
      private function refreshButtons() : void
      {
         var _loc1_:* = false;
         if(!this.var_65)
         {
            return;
         }
         if(this.var_171.active)
         {
            this.var_65.visible = false;
            return;
         }
         this.var_65.visible = true;
         if(this.var_1059)
         {
            if(this.var_2216 == "exit_homeroom")
            {
               this.var_1059.caption = "${navigator.homeroom}";
            }
            else
            {
               this.var_1059.caption = "${navigator.hotelview}";
            }
         }
         if(this.var_861)
         {
            _loc1_ = this._navigator.data.enteredGuestRoom != null;
            this.var_861.visible = _loc1_;
            if(this.var_2220 == "0")
            {
               this.var_861.caption = "${navigator.zoom.in}";
            }
            else
            {
               this.var_861.caption = "${navigator.zoom.out}";
            }
         }
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || this.var_171.active || this.var_240.active)
         {
            return;
         }
         this.var_834.text = param1.roomName;
         this.var_834.height = this.var_834.textHeight + 5;
         this._ownerName.text = param1.ownerName;
         this.var_862.text = param1.description;
         this.var_1117.refreshTags(this.var_396,param1.tags);
         this.var_862.visible = false;
         if(param1.description != "")
         {
            this.var_862.height = this.var_862.textHeight + 5;
            this.var_862.visible = true;
         }
         var _loc3_:Boolean = Boolean(this._navigator.configuration.getKey("client.allow.facebook.like") == "1");
         this._navigator.refreshButton(this.var_1313,"facebook_logo_small",_loc3_,null,0);
         this.var_1313.visible = _loc3_;
         var _loc4_:* = this._navigator.data.currentRoomRating == -1;
         this._navigator.refreshButton(this.var_1307,"thumb_up",_loc4_,null,0);
         this.var_1307.visible = _loc4_;
         this.var_859.visible = !_loc4_;
         this.var_1624.visible = !_loc4_;
         this.var_1624.text = "" + this._navigator.data.currentRoomRating;
         this.refreshStuffPick();
         this._navigator.refreshButton(this.var_396,"home",param2,null,0);
         this._navigator.refreshButton(this.var_396,"favourite",!param2 && this._navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(this.var_396,["room_name","owner_name_cont","tags","room_desc","rating_cont","staff_pick_button"],this.var_834.y,0);
         this.var_396.visible = true;
         this.var_396.height = Util.getLowestPoint(this.var_396);
      }
      
      private function refreshStuffPick() : void
      {
         var _loc1_:IWindow = this.var_396.findChildByName("staff_pick_button");
         if(!this._navigator.data.roomPicker)
         {
            _loc1_.visible = false;
            return;
         }
         _loc1_.visible = true;
         _loc1_.caption = this._navigator.getText(!!this._navigator.data.currentRoomIsStaffPick ? "navigator.staffpicks.unpick" : "navigator.staffpicks.pick");
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || this.var_171.active || this.var_240.active)
         {
            return;
         }
         this.var_1060.text = this._navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         this.var_1060.height = this.var_1060.textHeight + 5;
         this.var_1310.text = this._navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         this.var_1310.height = this.var_1310.textHeight + 5;
         Util.moveChildrenToColumn(this.var_694,["public_space_name","public_space_desc"],this.var_1060.y,0);
         this.var_694.visible = true;
         this.var_694.height = Math.max(86,Util.getLowestPoint(this.var_694));
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || this.var_330.active)
         {
            return;
         }
         this.var_2219.text = param1.eventName;
         this.var_693.text = param1.eventDescription;
         this.var_1117.refreshTags(this.var_863,[this._navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         this.var_693.visible = false;
         if(param1.eventDescription != "")
         {
            this.var_693.height = this.var_693.textHeight + 5;
            this.var_693.y = Util.getLowestPoint(this.var_863) + 2;
            this.var_693.visible = true;
         }
         this.var_863.visible = true;
         this.var_863.height = Util.getLowestPoint(this.var_863);
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(this._navigator.data.enteredGuestRoom == null || this.var_171.active || this.var_240.active)
         {
            return;
         }
         this.var_1626.visible = this._navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = this._navigator.data.isCurrentRoomFavourite();
         this.var_1312.visible = this._navigator.data.canAddFavourite && !_loc2_;
         this.var_1306.visible = this._navigator.data.canAddFavourite && _loc2_;
         this.var_1309.visible = this._navigator.data.canEditRoomSettings && !param1;
         this.var_1308.visible = this._navigator.data.canEditRoomSettings && param1;
         this.var_1314.visible = Util.hasVisibleChildren(this.var_1314);
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(this.var_330.active)
         {
            return;
         }
         this.var_1625.visible = param1 == null && this._navigator.data.currentRoomOwner;
         this.var_1622.visible = param1 != null && (this._navigator.data.currentRoomOwner || this._navigator.data.eventMod);
         this.var_1623.visible = Util.hasVisibleChildren(this.var_1623);
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         this._window = IWindowContainer(this._navigator.getXmlWindow("iro_room_details"));
         this._window.setParamFlag(HabboWindowParam.const_62,false);
         this._window.setParamFlag(HabboWindowParam.const_1445,true);
         this._window.visible = false;
         this.var_287 = IWindowContainer(this.find("room_info"));
         this.var_396 = IWindowContainer(this.find("room_details"));
         this.var_694 = IWindowContainer(this.find("public_space_details"));
         this.var_2218 = IWindowContainer(this.find("owner_name_cont"));
         this.var_2215 = IWindowContainer(this.find("rating_cont"));
         this.var_1314 = IWindowContainer(this.find("room_buttons"));
         this.var_834 = ITextWindow(this.find("room_name"));
         this.var_1060 = ITextWindow(this.find("public_space_name"));
         this._ownerName = ITextWindow(this.find("owner_name"));
         this.var_862 = ITextWindow(this.find("room_desc"));
         this.var_1310 = ITextWindow(this.find("public_space_desc"));
         this.var_1061 = ITextWindow(this.find("owner_caption"));
         this.var_859 = ITextWindow(this.find("rating_caption"));
         this.var_1624 = ITextWindow(this.find("rating_txt"));
         this.var_241 = IWindowContainer(this.find("event_info"));
         this.var_863 = IWindowContainer(this.find("event_details"));
         this.var_1623 = IWindowContainer(this.find("event_buttons"));
         this.var_2219 = ITextWindow(this.find("event_name"));
         this.var_693 = ITextWindow(this.find("event_desc"));
         this.var_1313 = IContainerButtonWindow(this.find("facebook_like_button"));
         this.var_1307 = IContainerButtonWindow(this.find("rate_up_button"));
         this.var_2217 = this.find("staff_pick_button");
         this.var_1312 = IContainerButtonWindow(this.find("add_favourite_button"));
         this.var_1306 = IContainerButtonWindow(this.find("rem_favourite_button"));
         this.var_1309 = IContainerButtonWindow(this.find("make_home_button"));
         this.var_1308 = IContainerButtonWindow(this.find("unmake_home_button"));
         this.var_1626 = IButtonWindow(this.find("room_settings_button"));
         this.var_1625 = IButtonWindow(this.find("create_event_button"));
         this.var_1622 = IButtonWindow(this.find("edit_event_button"));
         this.var_860 = IWindowContainer(this.find("embed_info"));
         this.var_1311 = ITextWindow(this.find("embed_info_txt"));
         this.var_1062 = ITextFieldWindow(this.find("embed_src_txt"));
         this.var_65 = IWindowContainer(this.find("buttons_container"));
         this.var_1059 = IButtonWindow(this.find("exit_room_button"));
         this.var_861 = IButtonWindow(this.find("zoom_button"));
         Util.setProcDirectly(this.var_1312,this.onAddFavouriteClick);
         Util.setProcDirectly(this.var_1306,this.onRemoveFavouriteClick);
         Util.setProcDirectly(this.var_1626,this.onRoomSettingsClick);
         Util.setProcDirectly(this.var_1309,this.onMakeHomeClick);
         Util.setProcDirectly(this.var_1308,this.onUnmakeHomeClick);
         Util.setProcDirectly(this.var_1625,this.onEventSettingsClick);
         Util.setProcDirectly(this.var_1622,this.onEventSettingsClick);
         Util.setProcDirectly(this.var_1062,this.onEmbedSrcClick);
         Util.setProcDirectly(this.var_1307,this.onThumbUp);
         Util.setProcDirectly(this.var_2217,this.onStaffPick);
         Util.setProcDirectly(this.var_1313,this.onFacebookLike);
         Util.setProcDirectly(this.var_861,this.onZoomClick);
         Util.setProcDirectly(this.var_1059,this.onExitRoomClick);
         this._navigator.refreshButton(this.var_1312,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1306,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1309,"home",true,null,0);
         this._navigator.refreshButton(this.var_1308,"home",true,null,0);
         this._window.findChildByName("close").procedure = this.onCloseButtonClick;
         Util.setProcDirectly(this.var_287,this.onHover);
         Util.setProcDirectly(this.var_241,this.onHover);
         this.var_1061.width = this.var_1061.textWidth;
         Util.moveChildrenToRow(this.var_2218,["owner_caption","owner_name"],this.var_1061.x,this.var_1061.y,3);
         this.var_859.width = this.var_859.textWidth;
         Util.moveChildrenToRow(this.var_2215,["rating_caption","rating_txt"],this.var_859.x,this.var_859.y,3);
         this.var_1311.height = this.var_1311.textHeight + 5;
         Util.moveChildrenToColumn(this.var_860,["embed_info_txt","embed_src_txt"],this.var_1311.y,2);
         this.var_860.height = Util.getLowestPoint(this.var_860) + 5;
         this.var_2760 = this._window.y + this._window.height;
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = this._window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!this._navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(this._navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(this._navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            this._navigator.send(new AddFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         this._navigator.send(new DeleteFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.roomEventData == null)
         {
            if(this._navigator.data.currentRoomOwner)
            {
               this._navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            this.startEventEdit();
         }
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         this.startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.hideInfo(null);
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function onStaffPick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new ToggleStaffPickMessageComposer(this._navigator.data.enteredGuestRoom.flatId,this._navigator.data.currentRoomIsStaffPick));
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function onFacebookLike(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         HabboWebTools.facebookLike(this._navigator.data.enteredGuestRoom.flatId);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.var_1062.setSelection(0,this.var_1062.text.length);
      }
      
      private function onZoomClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.const_38);
         _loc3_.iconId = HabboToolbarIconEnum.ZOOM;
         _loc3_.iconName = "ZOOM";
         this._navigator.toolbar.events.dispatchEvent(_loc3_);
      }
      
      private function onExitRoomClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.const_38);
         _loc3_.iconId = HabboToolbarIconEnum.EXITROOM;
         _loc3_.iconName = "EXITROOM";
         this._navigator.toolbar.events.dispatchEvent(_loc3_);
      }
      
      private function onToolbarIconState(param1:HabboToolbarSetIconEvent) : void
      {
         if(param1.type != HabboToolbarSetIconEvent.const_102)
         {
            return;
         }
         switch(param1.iconId)
         {
            case HabboToolbarIconEnum.ZOOM:
               this.var_2220 = param1.iconState;
               this.refreshButtons();
               break;
            case HabboToolbarIconEnum.EXITROOM:
               this.var_2216 = param1.iconState;
               this.refreshButtons();
         }
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         this.var_239.reset();
      }
      
      private function hideInfo(param1:Event) : void
      {
         this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_522,HabboToolbarIconEnum.ROOMINFO,this._window,false));
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + this._navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + this._navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = this._navigator.configuration.getKey("user.hash","");
         this._navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         this._navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         this._navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return this._navigator.getText("navigator.embed.src");
      }
      
      public function registerToolbarEvents() : void
      {
         if(this._navigator.toolbar)
         {
            this._navigator.toolbar.events.addEventListener(HabboToolbarSetIconEvent.const_102,this.onToolbarIconState);
         }
      }
   }
}
