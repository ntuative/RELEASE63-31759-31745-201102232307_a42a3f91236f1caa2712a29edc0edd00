package com.sulake.habbo.inventory.furni
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.outgoing.inventory.furni.RequestFurniInventoryComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.furni.RequestRoomPropertySet;
   import com.sulake.habbo.inventory.HabboInventory;
   import com.sulake.habbo.inventory.IInventoryModel;
   import com.sulake.habbo.inventory.enum.FurniCategory;
   import com.sulake.habbo.inventory.enum.InventoryCategory;
   import com.sulake.habbo.inventory.enum.InventorySubCategory;
   import com.sulake.habbo.inventory.events.HabboInventoryTrackingEvent;
   import com.sulake.habbo.inventory.items.FloorItem;
   import com.sulake.habbo.inventory.items.GroupItem;
   import com.sulake.habbo.inventory.items.IItem;
   import com.sulake.habbo.inventory.items.WallItem;
   import com.sulake.habbo.inventory.marketplace.MarketplaceModel;
   import com.sulake.habbo.inventory.recycler.RecyclerModel;
   import com.sulake.habbo.inventory.trading.TradingModel;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.events.RoomEngineObjectEvent;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class FurniModel implements IInventoryModel
   {
      
      public static const const_44:String = "floor";
      
      public static const const_49:String = "wall";
      
      public static const const_366:String = "pets";
      
      private static const const_1322:int = 100;
       
      
      private var _controller:HabboInventory;
      
      private var _view:FurniView;
      
      private var var_502:Map;
      
      private var _assets:IAssetLibrary;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _roomEngine:IRoomEngine;
      
      private var _communication:IHabboCommunicationManager;
      
      private var _disposed:Boolean = false;
      
      private var var_1416:int = -1;
      
      private var var_197:Timer;
      
      private var var_2541:XML;
      
      private var var_942:IWindowContainer;
      
      private var var_1415:Boolean;
      
      private var var_618:Timer;
      
      private var var_2501:Boolean;
      
      private var _catalog:IHabboCatalog;
      
      public function FurniModel(param1:HabboInventory, param2:MarketplaceModel, param3:IHabboWindowManager, param4:IHabboCommunicationManager, param5:IAssetLibrary, param6:IRoomEngine, param7:IHabboCatalog)
      {
         super();
         this._controller = param1;
         this._communication = param4;
         this._windowManager = param3;
         this._assets = param5;
         this._roomEngine = param6;
         this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_258,this.onObjectPlaced);
         this._catalog = param7;
         this.var_618 = new Timer(const_1322,1);
         this.var_618.addEventListener(TimerEvent.TIMER_COMPLETE,this.onImageUpdateTimerEvent);
         var _loc8_:IAsset = this._assets.getAssetByName("inventory_thumb_xml");
         var _loc9_:XmlAsset = XmlAsset(_loc8_);
         this.var_2541 = XML(_loc9_.content);
         this.clearFurniList();
         this._view = new FurniView(this,param2,this._windowManager,this._assets,this._roomEngine);
         this._view.switchCategory(const_44);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._controller = null;
            if(this.var_502 != null)
            {
               this.var_502.dispose();
               this.var_502 = null;
            }
            if(this._view != null)
            {
               this._view.dispose();
               this._view = null;
            }
            if(this._roomEngine != null)
            {
               if(this._roomEngine.events != null)
               {
                  this._roomEngine.events.removeEventListener(RoomEngineObjectEvent.const_258,this.onObjectPlaced);
               }
               this._roomEngine = null;
            }
            this._communication = null;
            this._assets = null;
            this._windowManager = null;
            if(this.var_618 != null)
            {
               this.var_618.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onImageUpdateTimerEvent);
               this.var_618.stop();
               this.var_618 = null;
            }
            if(this.var_197 != null)
            {
               this.var_197.removeEventListener(TimerEvent.TIMER_COMPLETE,this.initTimeout);
               this.var_197.stop();
               this.var_197 = null;
            }
            if(this.var_942 != null)
            {
               this.var_942.dispose();
               this.var_942 = null;
            }
            this._disposed = true;
         }
      }
      
      public function isListInited() : Boolean
      {
         return this.var_2501;
      }
      
      public function setListInitialized() : void
      {
         this.var_2501 = true;
         this._view.setViewToState();
      }
      
      public function createNewGroupItemTemplate(param1:int, param2:String, param3:int, param4:String = null, param5:Number = NaN, param6:Boolean = false) : GroupItem
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         if(param3 == FurniCategory.const_347)
         {
            _loc8_ = this._assets.getAssetByName("icon_wallpaper_png");
            if(_loc8_ != null)
            {
               _loc7_ = _loc8_.content as BitmapData;
            }
         }
         else if(param3 == FurniCategory.const_332)
         {
            _loc8_ = this._assets.getAssetByName("icon_floor_png");
            if(_loc8_ != null)
            {
               _loc7_ = _loc8_.content as BitmapData;
            }
         }
         else if(param3 == FurniCategory.const_375)
         {
            _loc8_ = this._assets.getAssetByName("icon_landscape_png");
            if(_loc8_ != null)
            {
               _loc7_ = _loc8_.content as BitmapData;
            }
         }
         var _loc10_:IAsset = this._assets.getAssetByName("thumb_icon_recycle_png");
         if(_loc10_ != null)
         {
            _loc9_ = _loc10_.content as BitmapData;
         }
         if(this.var_942 == null)
         {
            this.var_942 = this._windowManager.buildFromXML(this.var_2541) as IWindowContainer;
         }
         var _loc11_:IWindowContainer = this.var_942.clone() as IWindowContainer;
         return new GroupItem(param1,param2,param3,_loc11_,this._roomEngine,_loc9_.clone(),this._controller.recyclerModel.running,param4,param5,_loc7_,param6);
      }
      
      public function initListImages() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc6_:int = 0;
         var _loc4_:Array = [const_44,const_49];
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc2_ = _loc4_[_loc5_];
            _loc1_ = this.getCategoryContent(_loc2_);
            if(_loc1_ != null)
            {
               _loc6_ = 0;
               while(_loc6_ < _loc1_.length)
               {
                  _loc3_ = _loc1_[_loc6_] as GroupItem;
                  if(!_loc3_.isImageInited)
                  {
                     _loc3_.initImage();
                     if(!_loc3_.isImageFinished)
                     {
                        this.var_618.reset();
                        this.var_618.start();
                        return;
                     }
                  }
                  _loc6_++;
               }
            }
            _loc5_++;
         }
      }
      
      private function onImageUpdateTimerEvent(param1:TimerEvent) : void
      {
         this.initListImages();
      }
      
      public function requestInitialization(param1:int = 0) : void
      {
         if(param1 > 0)
         {
            if(this.var_197 != null)
            {
               this.var_197.removeEventListener(TimerEvent.TIMER_COMPLETE,this.initTimeout);
               this.var_197.stop();
               this.var_197 = null;
            }
            this.var_197 = new Timer(param1,1);
            this.var_197.addEventListener(TimerEvent.TIMER_COMPLETE,this.initTimeout);
            this.var_197.start();
         }
         else
         {
            this.requestNewList();
         }
      }
      
      public function categorySwitch(param1:String) : void
      {
         if(param1 == InventoryCategory.const_78 && this._controller.isVisible)
         {
            switch(this._view.visibleCategoryId)
            {
               case const_44:
                  this._controller.events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_FURNI));
                  break;
               case const_49:
                  this._controller.events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_POSTERS));
                  break;
               case const_366:
                  this._controller.toggleInventoryPage(InventoryCategory.const_131);
            }
         }
      }
      
      public function furniCategorySwitch() : void
      {
         if(this._controller.isVisible)
         {
            switch(this._view.visibleCategoryId)
            {
               case const_44:
                  this._controller.events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_FURNI));
                  break;
               case const_49:
                  this._controller.events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_POSTERS));
                  break;
               case const_366:
                  this._controller.toggleInventoryPage(InventoryCategory.const_131);
            }
         }
      }
      
      public function switchCategory(param1:String) : void
      {
         this._view.switchCategory(param1);
      }
      
      private function initTimeout(param1:TimerEvent) : void
      {
         if(this.var_197 != null)
         {
            this.var_197.removeEventListener(TimerEvent.TIMER_COMPLETE,this.initTimeout);
            this.var_197.stop();
            this.var_197 = null;
         }
         this.requestNewList();
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         this._controller.checkCategoryInitilization(InventoryCategory.const_405);
         return this._view.getWindowContainer();
      }
      
      public function closingInventoryView() : void
      {
      }
      
      public function updateLocks() : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc9_:int = 0;
         var _loc1_:Array = new Array();
         var _loc2_:TradingModel = this._controller.tradingModel;
         if(_loc2_ != null)
         {
            _loc1_ = _loc1_.concat(_loc2_.getOwnItemIdsInTrade());
         }
         var _loc3_:RecyclerModel = this._controller.recyclerModel;
         if(_loc3_ != null)
         {
            _loc1_ = _loc1_.concat(_loc3_.getOwnItemsInRecycler());
         }
         if(_loc1_.length == 0)
         {
            this.removeAllLocks();
            return;
         }
         var _loc7_:Array = [const_44,const_49];
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_.length)
         {
            _loc5_ = _loc7_[_loc8_];
            _loc4_ = this.getCategoryContent(_loc5_);
            if(_loc4_ != null)
            {
               _loc9_ = 0;
               while(_loc9_ < _loc4_.length)
               {
                  _loc6_ = _loc4_[_loc9_] as GroupItem;
                  _loc6_.addLocksFromData(_loc1_);
                  _loc9_++;
               }
            }
            _loc8_++;
         }
         this._view.updateActionView();
      }
      
      public function addLockTo(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc7_:int = 0;
         var _loc5_:Array = [const_44,const_49];
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length)
         {
            _loc3_ = _loc5_[_loc6_];
            _loc2_ = this.getCategoryContent(_loc3_);
            if(_loc2_ != null)
            {
               _loc7_ = 0;
               while(_loc7_ < _loc2_.length)
               {
                  _loc4_ = _loc2_[_loc7_] as GroupItem;
                  _loc4_.addLockTo(param1);
                  _loc7_++;
               }
            }
            _loc6_++;
         }
         this._view.updateActionView();
      }
      
      public function removeLockFrom(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc7_:int = 0;
         var _loc5_:Array = [const_44,const_49];
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length)
         {
            _loc3_ = _loc5_[_loc6_];
            _loc2_ = this.getCategoryContent(_loc3_);
            if(_loc2_ != null)
            {
               _loc7_ = 0;
               while(_loc7_ < _loc2_.length)
               {
                  _loc4_ = _loc2_[_loc7_] as GroupItem;
                  if(_loc4_)
                  {
                     _loc4_.removeLockFrom(param1);
                  }
                  _loc7_++;
               }
            }
            _loc6_++;
         }
         this._view.updateActionView();
      }
      
      public function showRecyclable(param1:Boolean) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc7_:int = 0;
         var _loc5_:Array = [const_44,const_49];
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length)
         {
            _loc3_ = _loc5_[_loc6_];
            _loc2_ = this.getCategoryContent(_loc3_);
            if(_loc2_ != null)
            {
               _loc7_ = 0;
               while(_loc7_ < _loc2_.length)
               {
                  _loc4_ = _loc2_[_loc7_] as GroupItem;
                  _loc4_.showRecyclable = param1;
                  _loc7_++;
               }
            }
            _loc6_++;
         }
         this._view.updateActionView();
      }
      
      public function clearFurniList() : void
      {
         this.var_502 = new Map();
         this.var_502.add(const_44,new Array());
         this.var_502.add(const_49,new Array());
         if(this._view != null)
         {
            this._view.clearViews();
         }
      }
      
      public function addFurniAsLast(param1:IItem, param2:Boolean = false) : void
      {
         this.addFurniAt(param1,param2);
      }
      
      public function addFurniAt(param1:IItem, param2:Boolean = false, param3:int = -1) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         if(param1 is FloorItem)
         {
            _loc4_ = const_44;
         }
         else
         {
            if(!(param1 is WallItem))
            {
               return;
            }
            _loc4_ = const_49;
         }
         var _loc6_:Array = this.getCategoryContent(_loc4_);
         if(!param1.groupable)
         {
            for each(_loc7_ in _loc6_)
            {
               if(_loc7_.type == param1.type)
               {
                  if(_loc7_.getItem(param1.id) != null)
                  {
                     return;
                  }
                  break;
               }
            }
            _loc5_ = this.createNewGroupItemTemplate(param1.type,_loc4_,param1.category,param1.stuffData,param1.extra,param2);
            _loc5_.push(param1);
            if(param3 == -1)
            {
               _loc6_.push(_loc5_);
            }
            else
            {
               _loc6_.splice(param3,0,_loc5_);
            }
            if(this._view != null)
            {
               if(param3 == -1)
               {
                  this._view.addItemToBottom(_loc4_,_loc5_);
               }
               else
               {
                  this._view.addItemAt(_loc4_,_loc5_,param3);
               }
            }
         }
         else
         {
            _loc8_ = 0;
            for(; _loc8_ < _loc6_.length; _loc8_++)
            {
               _loc7_ = _loc6_[_loc8_] as GroupItem;
               if(_loc7_.type == param1.type)
               {
                  if(param1.category != FurniCategory.const_163)
                  {
                     _loc5_ = _loc7_;
                  }
                  if(_loc7_.stuffData == param1.stuffData)
                  {
                     _loc5_ = _loc7_;
                     break;
                  }
                  continue;
                  break;
               }
            }
            if(_loc5_)
            {
               _loc5_.push(param1);
            }
            else
            {
               _loc5_ = this.createNewGroupItemTemplate(param1.type,_loc4_,param1.category,param1.stuffData,param1.extra,param2);
               _loc5_.push(param1);
               if(this._view != null)
               {
                  if(param3 == -1)
                  {
                     _loc6_.push(_loc5_);
                     this._view.addItemToBottom(_loc4_,_loc5_);
                  }
                  else
                  {
                     _loc6_.unshift(_loc5_);
                     this._view.addItemAt(_loc4_,_loc5_,param3);
                  }
               }
            }
         }
         this._view.setViewToState();
         if(_loc5_.isSelected)
         {
            this._view.updateActionView();
         }
      }
      
      public function removeFurni(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc5_:Array = [const_44,const_49];
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length)
         {
            _loc3_ = _loc5_[_loc6_];
            _loc2_ = this.getCategoryContent(_loc3_);
            if(_loc2_ != null)
            {
               _loc7_ = 0;
               while(_loc7_ < _loc2_.length)
               {
                  _loc4_ = _loc2_[_loc7_] as GroupItem;
                  _loc8_ = _loc4_.remove(param1);
                  if(_loc8_)
                  {
                     if(this.var_1416 == _loc8_.ref)
                     {
                        this.cancelFurniInMover();
                        if(!this.requestSelectedFurniPlacement())
                        {
                           this._controller.showView();
                        }
                     }
                     if(_loc4_.getTotalCount() <= 0)
                     {
                        this._view.removeItem(_loc3_,_loc7_);
                        _loc2_.splice(_loc7_,1);
                        if(_loc4_.isSelected)
                        {
                           this.toggleItemSelection(_loc3_,0);
                        }
                     }
                     else
                     {
                        this._view.updateActionView();
                     }
                     this._view.setViewToState();
                     return;
                  }
                  _loc7_++;
               }
            }
            _loc6_++;
         }
      }
      
      public function updatePostItCount(param1:int, param2:int) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc3_:Array = this.getCategoryContent(const_49);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = _loc3_[_loc4_] as GroupItem;
            _loc6_ = _loc5_.getItem(param1) as WallItem;
            if(_loc6_ != null)
            {
               _loc6_.stuffData = String(param2);
               _loc5_.replaceItem(param1,_loc6_);
            }
            _loc4_++;
         }
      }
      
      public function toggleItemSelection(param1:String, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc3_:Array = this.getCategoryContent(param1);
         if(_loc3_ == null || _loc3_.length == 0)
         {
            return;
         }
         if(_loc3_.length > param2)
         {
            _loc4_ = _loc3_[param2] as GroupItem;
            _loc4_.isSelected = true;
            this._view.updateItem(param1,_loc4_,param2);
         }
         if(_loc4_ && _loc4_.isSelected)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc3_.length)
            {
               if(_loc5_ != param2)
               {
                  _loc4_ = _loc3_[_loc5_] as GroupItem;
                  if(_loc4_ && _loc4_.isSelected)
                  {
                     _loc4_.isSelected = false;
                  }
               }
               _loc5_++;
            }
         }
         this._view.updateActionView();
      }
      
      public function displayItemInfo(param1:GroupItem) : void
      {
         if(this._view && !this._view.disposed)
         {
            this._view.displayItemInfo(param1);
         }
      }
      
      public function getSelectedItemIndex(param1:String = null) : int
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            if(this._view == null)
            {
               return -1;
            }
         }
         if(param1 == null)
         {
            param1 = this._view.visibleCategoryId;
         }
         var _loc2_:Array = this.getCategoryContent(param1);
         if(_loc2_ == null)
         {
            return -1;
         }
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc3_ = _loc2_[_loc4_] as GroupItem;
            if(_loc3_.isSelected)
            {
               return _loc4_;
            }
            _loc4_++;
         }
         return -1;
      }
      
      public function getGroupItemInIndex(param1:int, param2:String = null) : GroupItem
      {
         if(param2 == null)
         {
            param2 = this._view.visibleCategoryId;
         }
         var _loc3_:Array = this.getCategoryContent(param2);
         if(_loc3_ == null)
         {
            return null;
         }
         if(param1 >= _loc3_.length)
         {
            return null;
         }
         return _loc3_[param1] as GroupItem;
      }
      
      public function getGroupItemByType(param1:int) : GroupItem
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc7_:int = 0;
         var _loc5_:Array = [const_44,const_49];
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length)
         {
            _loc3_ = _loc5_[_loc6_];
            _loc2_ = this.getCategoryContent(_loc3_);
            if(_loc2_ != null)
            {
               _loc7_ = 0;
               while(_loc7_ < _loc2_.length)
               {
                  _loc4_ = _loc2_[_loc7_] as GroupItem;
                  if(_loc4_.type == param1)
                  {
                     return _loc4_;
                  }
                  _loc7_++;
               }
            }
            _loc6_++;
         }
         return null;
      }
      
      public function get isTradingOpen() : Boolean
      {
         return this._controller.getSubCategoryViewId() == InventorySubCategory.const_277;
      }
      
      public function canUserOfferToTrade() : Boolean
      {
         return this._controller.canUserOfferToTrade();
      }
      
      public function removeAllLocks() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc6_:int = 0;
         var _loc4_:Array = [const_44,const_49];
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc2_ = _loc4_[_loc5_];
            _loc1_ = this.getCategoryContent(_loc2_);
            if(_loc1_ != null)
            {
               _loc6_ = 0;
               while(_loc6_ < _loc1_.length)
               {
                  _loc3_ = _loc1_[_loc6_] as GroupItem;
                  if(_loc3_ != null)
                  {
                     _loc3_.removeAllLocks();
                  }
                  _loc6_++;
               }
            }
            _loc5_++;
         }
         if(this._view != null)
         {
            this._view.updateActionView();
         }
      }
      
      public function cancelFurniInMover() : void
      {
         if(this.var_1416 > -1)
         {
            this._roomEngine.cancelRoomObjectInsert();
            this.var_1415 = false;
            this.var_1416 = -1;
         }
      }
      
      public function requestSelectedFurniPlacement(param1:Boolean = false) : Boolean
      {
         var _loc2_:GroupItem = this.getGroupItemInIndex(this.getSelectedItemIndex(),this._view.visibleCategoryId);
         if(_loc2_ == null)
         {
            return false;
         }
         if(_loc2_.getUnlockedCount() == 0)
         {
            return false;
         }
         var _loc3_:IItem = _loc2_.peek();
         if(_loc3_ == null)
         {
            return false;
         }
         if(_loc3_.category == FurniCategory.const_332 || _loc3_.category == FurniCategory.const_347 || _loc3_.category == FurniCategory.const_375)
         {
            if(param1)
            {
               return false;
            }
            this._communication.getHabboMainConnection(null).send(new RequestRoomPropertySet(_loc3_.id));
         }
         else
         {
            this.requestSelectedFurniToMover(_loc3_);
         }
         this._view.updateActionView();
         return true;
      }
      
      private function requestSelectedFurniToMover(param1:IItem) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         if(param1 is FloorItem)
         {
            _loc2_ = 0;
         }
         else
         {
            _loc2_ = 0;
         }
         if(param1.category == FurniCategory.const_163)
         {
            _loc3_ = this._roomEngine.method_3(param1.id,_loc2_,param1.type,param1.stuffData);
         }
         else
         {
            _loc3_ = this._roomEngine.method_3(param1.id,_loc2_,param1.type,param1.extra.toString());
         }
         if(_loc3_)
         {
            this.var_1416 = param1.ref;
            if(!this._controller.recyclerModel.running)
            {
               this.requestClose();
            }
            this.var_1415 = true;
         }
         this._view.updateActionView();
      }
      
      public function requestSelectedFurniToTrading() : void
      {
         var _loc1_:GroupItem = this.getGroupItemInIndex(this.getSelectedItemIndex(),this._view.visibleCategoryId);
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:IItem = _loc1_.getOneForTrade();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:TradingModel = this._controller.tradingModel;
         if(_loc3_ != null)
         {
            _loc3_.requestAddItemToTrading(_loc2_.id,_loc2_.type,_loc2_.category,_loc2_.groupable,_loc2_.stuffData);
         }
         this._view.updateActionView();
      }
      
      public function requestSelectedFurniSelling() : void
      {
         var _loc1_:GroupItem = this.getGroupItemInIndex(this.getSelectedItemIndex(),this._view.visibleCategoryId);
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:IItem = _loc1_.getOneForTrade();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:MarketplaceModel = this._controller.marketplaceModel;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.startOfferMaking(_loc2_);
      }
      
      public function requestSelectedFurniToRecycler() : IItem
      {
         var _loc1_:GroupItem = this.getGroupItemInIndex(this.getSelectedItemIndex(),this._view.visibleCategoryId);
         if(_loc1_ == null)
         {
            return null;
         }
         var _loc2_:IItem = _loc1_.getOneForRecycle();
         if(_loc2_ == null)
         {
            return null;
         }
         this._view.updateActionView();
         return _loc2_;
      }
      
      public function requestCurrentActionOnSelection() : void
      {
         if(this.isTradingOpen)
         {
            this.requestSelectedFurniToTrading();
         }
         else
         {
            this.requestSelectedFurniPlacement(false);
         }
      }
      
      public function onObjectPlaced(param1:Event) : void
      {
         if(this.var_1415 && param1.type == RoomEngineObjectEvent.const_258)
         {
            this.var_1415 = false;
         }
      }
      
      public function requestClose() : void
      {
         this._controller.closeView();
      }
      
      public function requestNewList() : void
      {
         var _loc1_:IConnection = this._communication.getHabboMainConnection(null);
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.send(new RequestFurniInventoryComposer(0,0));
      }
      
      public function requestCatalogOpen() : void
      {
         this._catalog.openCatalog();
      }
      
      public function getCategoryContent(param1:String) : Array
      {
         return this.var_502.getValue(param1);
      }
      
      public function subCategorySwitch(param1:String) : void
      {
         switch(param1)
         {
            case InventorySubCategory.const_277:
               this.cancelFurniInMover();
               if(this._view != null)
               {
                  this._view.updateActionView();
               }
               break;
            case InventorySubCategory.const_47:
               this.removeAllLocks();
               if(this._view != null)
               {
                  this._view.updateActionView();
               }
         }
      }
      
      public function getAllStripIds(param1:Array) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc2_:Array = this.var_502.getKeys();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = this.var_502.getValue(_loc2_[_loc3_]) as Array;
            if(_loc4_ != null)
            {
               _loc5_ = 0;
               while(_loc5_ < _loc4_.length)
               {
                  _loc6_ = GroupItem(_loc4_[_loc5_]);
                  _loc7_ = _loc6_.getTotalCount();
                  if(_loc6_.category == FurniCategory.const_876)
                  {
                     _loc7_ = 1;
                  }
                  _loc8_ = 0;
                  while(_loc8_ < _loc7_)
                  {
                     param1.push(GroupItem(_loc4_[_loc5_]).getAt(_loc8_).id);
                     _loc8_++;
                  }
                  _loc5_++;
               }
            }
            _loc3_++;
         }
      }
      
      public function method_1() : void
      {
         if(this._view != null)
         {
            this._view.updateActionView();
         }
      }
      
      public function get isPrivateRoom() : Boolean
      {
         if(!this._controller || !this._controller.roomSession)
         {
            return false;
         }
         return this._controller.roomSession.isPrivateRoom;
      }
   }
}
