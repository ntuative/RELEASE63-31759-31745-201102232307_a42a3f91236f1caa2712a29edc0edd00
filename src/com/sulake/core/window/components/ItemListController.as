package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowStyle;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.WindowNotifyEvent;
   import com.sulake.core.window.graphics.WindowRedrawFlag;
   import com.sulake.core.window.utils.IInputProcessorRoot;
   import com.sulake.core.window.utils.IIterator;
   import com.sulake.core.window.utils.Iterator;
   import com.sulake.core.window.utils.PropertyDefaults;
   import com.sulake.core.window.utils.PropertyStruct;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class ItemListController extends WindowController implements IItemListWindow, IInputProcessorRoot
   {
       
      
      protected var var_649:Number;
      
      protected var var_648:Number;
      
      protected var var_103:Number;
      
      protected var var_92:Number;
      
      protected var _container:IWindowContainer;
      
      protected var var_1980:Boolean = false;
      
      protected var var_530:Boolean = false;
      
      protected var _spacing:int = 0;
      
      protected var _horizontal:Boolean = false;
      
      protected var var_2792:Number = 0.0;
      
      protected var var_2791:Number = 0.0;
      
      protected var var_993:Boolean = true;
      
      protected var var_439:Boolean = false;
      
      protected var var_1228:Boolean = false;
      
      protected var var_1979:int = 0;
      
      protected var var_1978:int = 0;
      
      protected var var_1225:Number;
      
      protected var var_1226:Number;
      
      protected var var_1227:Boolean = false;
      
      public function ItemListController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function = null, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         this.var_649 = 0;
         this.var_648 = 0;
         this.var_103 = 0;
         this.var_92 = 0;
         this._horizontal = param2 == WindowType.const_384;
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         var_165 = var_442 || !testParamFlag(WindowParam.const_32);
         this._container = _context.create("_CONTAINER","",WindowType.const_345,WindowStyle.const_866,0 | 0 | 0,new Rectangle(0,0,width,height),null,this,0,null,[TAG_INTERNAL,TAG_EXCLUDE]) as IWindowContainer;
         this._container.addEventListener(WindowEvent.const_48,this.containerEventHandler);
         this._container.addEventListener(WindowEvent.const_574,this.containerEventHandler);
         this._container.addEventListener(WindowEvent.const_299,this.containerEventHandler);
         this._container.addEventListener(WindowEvent.const_563,this.containerEventHandler);
         this.resizeOnItemUpdate = this.var_1228;
      }
      
      public function get spacing() : int
      {
         return this._spacing;
      }
      
      public function set spacing(param1:int) : void
      {
         if(param1 != this._spacing)
         {
            this._spacing = param1;
            this.updateScrollAreaRegion();
         }
      }
      
      public function get scrollH() : Number
      {
         return this.var_649;
      }
      
      public function get scrollV() : Number
      {
         return this.var_648;
      }
      
      public function get maxScrollH() : int
      {
         var _loc1_:int = this.var_103 - width;
         return _loc1_ < 0 ? 0 : int(_loc1_);
      }
      
      public function get maxScrollV() : int
      {
         var _loc1_:int = this.var_92 - height;
         return _loc1_ < 0 ? 0 : int(_loc1_);
      }
      
      public function get visibleRegion() : Rectangle
      {
         return new Rectangle(this.var_649 * this.maxScrollH,this.var_648 * this.maxScrollV,width,height);
      }
      
      public function get scrollableRegion() : Rectangle
      {
         return this._container.rectangle.clone();
      }
      
      public function set scrollH(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 1)
         {
            param1 = 1;
         }
         if(param1 != this.var_649)
         {
            this.var_649 = param1;
            this._container.x = -this.var_649 * this.maxScrollH;
            _context.invalidate(this._container,this.visibleRegion,WindowRedrawFlag.const_65);
            dispatchEvent(new WindowEvent(WindowEvent.const_515,this,null));
         }
      }
      
      public function set scrollV(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 1)
         {
            param1 = 1;
         }
         if(param1 != this.var_648)
         {
            this.var_648 = param1;
            this._container.y = -this.var_648 * this.maxScrollV;
            _context.invalidate(this._container,this.visibleRegion,WindowRedrawFlag.const_65);
            dispatchEvent(new WindowEvent(WindowEvent.const_515,this,null));
         }
      }
      
      public function get scrollStepH() : Number
      {
         return !!this._horizontal ? Number(this._container.width / this.numListItems) : Number(0.1 * this._container.width);
      }
      
      public function get scrollStepV() : Number
      {
         return !!this._horizontal ? Number(0.1 * this._container.height) : Number(this._container.height / this.numListItems);
      }
      
      public function set scrollStepH(param1:Number) : void
      {
         this.var_2792 = Math.max(param1,0);
      }
      
      public function set scrollStepV(param1:Number) : void
      {
         this.var_2791 = Math.max(param1,0);
      }
      
      public function set scaleToFitItems(param1:Boolean) : void
      {
         if(this.var_439 != param1)
         {
            this.var_439 = param1;
            this.updateScrollAreaRegion();
         }
      }
      
      public function get scaleToFitItems() : Boolean
      {
         return this.var_439;
      }
      
      public function set autoArrangeItems(param1:Boolean) : void
      {
         this.var_993 = param1;
         this.updateScrollAreaRegion();
      }
      
      public function get autoArrangeItems() : Boolean
      {
         return this.var_993;
      }
      
      public function set resizeOnItemUpdate(param1:Boolean) : void
      {
         this.var_1228 = param1;
         if(this._container)
         {
            if(this._horizontal)
            {
               this._container.setParamFlag(WindowParam.const_562,param1);
            }
            else
            {
               this._container.setParamFlag(WindowParam.const_479,param1);
            }
         }
      }
      
      public function get resizeOnItemUpdate() : Boolean
      {
         return this.var_1228;
      }
      
      public function get iterator() : IIterator
      {
         return new Iterator(this);
      }
      
      public function get firstListItem() : IWindow
      {
         return this.numListItems > 0 ? this.getListItemAt(0) : null;
      }
      
      public function get lastListItem() : IWindow
      {
         return this.numListItems > 0 ? this.getListItemAt(this.numListItems - 1) : null;
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            if(this.var_1227)
            {
               try
               {
                  _context.getWindowServices().getGestureAgentService().end(this);
               }
               catch(e:Error)
               {
               }
            }
            this._container.removeEventListener(WindowEvent.const_48,this.containerEventHandler);
            this._container.removeEventListener(WindowEvent.const_574,this.containerEventHandler);
            this._container.removeEventListener(WindowEvent.const_299,this.containerEventHandler);
            this._container.removeEventListener(WindowEvent.const_563,this.containerEventHandler);
            super.dispose();
         }
      }
      
      override protected function cloneChildWindows(param1:WindowController) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.numListItems)
         {
            IItemListWindow(param1).addListItem(this.getListItemAt(_loc2_).clone());
            _loc2_++;
         }
      }
      
      public function get numListItems() : int
      {
         return this._container != null ? int(this._container.numChildren) : 0;
      }
      
      public function addListItem(param1:IWindow) : IWindow
      {
         this.var_530 = true;
         if(this._horizontal)
         {
            param1.x = this.var_103 + (this.numListItems > 0 ? this._spacing : 0);
            this.var_103 = param1.rectangle.right;
            this._container.width = this.var_103;
         }
         else
         {
            if(this.autoArrangeItems)
            {
               param1.y = this.var_92 + (this.numListItems > 0 ? this._spacing : 0);
               this.var_92 = param1.rectangle.bottom;
            }
            else
            {
               this.var_92 = Math.max(this.var_92,param1.rectangle.bottom);
            }
            this._container.height = this.var_92;
         }
         param1 = this._container.addChild(param1);
         this.var_530 = false;
         return param1;
      }
      
      public function addListItemAt(param1:IWindow, param2:uint) : IWindow
      {
         param1 = this._container.addChildAt(param1,param2);
         this.updateScrollAreaRegion();
         return param1;
      }
      
      public function getListItemAt(param1:uint) : IWindow
      {
         return this._container.getChildAt(param1);
      }
      
      public function getListItemByID(param1:uint) : IWindow
      {
         return this._container.getChildByID(param1);
      }
      
      public function getListItemByName(param1:String) : IWindow
      {
         return this._container.getChildByName(param1);
      }
      
      public function getListItemIndex(param1:IWindow) : int
      {
         return this._container.getChildIndex(param1);
      }
      
      public function removeListItem(param1:IWindow) : IWindow
      {
         param1 = this._container.removeChild(param1);
         if(param1)
         {
            this.updateScrollAreaRegion();
         }
         return param1;
      }
      
      public function removeListItemAt(param1:int) : IWindow
      {
         return this._container.removeChildAt(param1);
      }
      
      public function setListItemIndex(param1:IWindow, param2:int) : void
      {
         this._container.setChildIndex(param1,param2);
      }
      
      public function swapListItems(param1:IWindow, param2:IWindow) : void
      {
         this._container.swapChildren(param1,param2);
         this.updateScrollAreaRegion();
      }
      
      public function swapListItemsAt(param1:int, param2:int) : void
      {
         this._container.swapChildrenAt(param1,param2);
         this.updateScrollAreaRegion();
      }
      
      public function groupListItemsWithID(param1:uint, param2:Array, param3:Boolean = false) : uint
      {
         return this._container.groupChildrenWithID(param1,param2,param3);
      }
      
      public function groupListItemsWithTag(param1:String, param2:Array, param3:Boolean = false) : uint
      {
         return this._container.groupChildrenWithTag(param1,param2,param3);
      }
      
      public function removeListItems() : void
      {
         this.var_530 = true;
         while(this.numListItems > 0)
         {
            this._container.removeChildAt(0);
         }
         this.var_530 = false;
         this.updateScrollAreaRegion();
      }
      
      public function destroyListItems() : void
      {
         this.var_530 = true;
         while(this.numListItems > 0)
         {
            this._container.removeChildAt(0).destroy();
         }
         this.var_530 = false;
         this.updateScrollAreaRegion();
      }
      
      public function arrangeListItems() : void
      {
         this.updateScrollAreaRegion();
      }
      
      override public function populate(param1:Array) : void
      {
         WindowController(this._container).populate(param1);
         this.updateScrollAreaRegion();
      }
      
      override public function update(param1:WindowController, param2:Event) : Boolean
      {
         var _loc3_:Boolean = super.update(param1,param2);
         switch(param2.type)
         {
            case WindowNotifyEvent.const_455:
               break;
            case WindowNotifyEvent.const_648:
               this.var_1980 = true;
               break;
            case WindowNotifyEvent.const_189:
               if(!this.var_439)
               {
                  if(this._horizontal)
                  {
                     this._container.height = var_11.height;
                  }
                  else
                  {
                     this._container.width = var_11.width;
                  }
               }
               this.updateScrollAreaRegion();
               this.var_1980 = false;
               break;
            default:
               if(param2 is WindowEvent)
               {
                  _loc3_ = this.process(param2 as WindowEvent);
               }
         }
         return _loc3_;
      }
      
      public function process(param1:WindowEvent) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param1 is WindowMouseEvent)
         {
            _loc3_ = WindowMouseEvent(param1).localX;
            _loc4_ = WindowMouseEvent(param1).localY;
            _loc5_ = WindowMouseEvent(param1).delta;
         }
         switch(param1.type)
         {
            case WindowMouseEvent.const_292:
               if(this._horizontal)
               {
                  this.scrollH -= _loc5_ * 0.01;
               }
               else
               {
                  this.scrollV -= _loc5_ * 0.01;
               }
               _loc2_ = true;
               break;
            case WindowMouseEvent.const_43:
               this.var_1979 = _loc3_;
               this.var_1978 = _loc4_;
               this.var_1225 = 0;
               this.var_1226 = 0;
               this.var_1227 = true;
               _loc2_ = true;
               break;
            case WindowMouseEvent.const_196:
               if(this.var_1227)
               {
                  this.var_1225 = this.var_1979 - _loc3_;
                  this.var_1226 = this.var_1978 - _loc4_;
                  if(this._horizontal)
                  {
                     if(this.var_1225 != 0 && this.var_103 != 0)
                     {
                        this.scrollH += this.var_1225 / this.var_103;
                     }
                  }
                  else if(this.var_1226 != 0 && this.var_92 != 0)
                  {
                     this.scrollV += this.var_1226 / this.var_92;
                  }
                  this.var_1979 = _loc3_;
                  this.var_1978 = _loc4_;
                  _loc2_ = true;
               }
               break;
            case WindowMouseEvent.const_59:
            case WindowMouseEvent.const_174:
               if(this.var_1227)
               {
                  if(this._horizontal)
                  {
                     _context.getWindowServices().getGestureAgentService().begin(this,this.scrollAnimationCallback,0,-this.var_1225,0);
                  }
                  else
                  {
                     _context.getWindowServices().getGestureAgentService().begin(this,this.scrollAnimationCallback,0,0,-this.var_1226);
                  }
                  this.var_1227 = false;
                  _loc2_ = true;
               }
         }
         return _loc2_;
      }
      
      private function scrollAnimationCallback(param1:int, param2:int) : void
      {
         if(!disposed)
         {
            this.scrollH -= param1 / this.var_103;
            this.scrollV -= param2 / this.var_92;
         }
      }
      
      private function containerEventHandler(param1:Event) : void
      {
         switch(param1.type)
         {
            case WindowEvent.const_574:
               this.updateScrollAreaRegion();
               break;
            case WindowEvent.const_299:
               if(!this.var_1980)
               {
                  this.updateScrollAreaRegion();
               }
               break;
            case WindowEvent.const_563:
               this.updateScrollAreaRegion();
               break;
            case WindowEvent.const_48:
               dispatchEvent(new WindowEvent(WindowEvent.const_48,this,null));
               break;
            default:
               Logger.log("ItemListController::containerEventHandler(" + param1.type + ")");
         }
      }
      
      protected function updateScrollAreaRegion() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this.var_993 && !this.var_530 && this._container)
         {
            this.var_530 = true;
            _loc1_ = uint(this._container.numChildren);
            if(this._horizontal)
            {
               this.var_103 = 0;
               this.var_92 = var_11.height;
               _loc4_ = 0;
               while(_loc4_ < _loc1_)
               {
                  _loc2_ = this._container.getChildAt(_loc4_);
                  if(_loc2_.visible)
                  {
                     _loc2_.x = this.var_103;
                     this.var_103 += _loc2_.width + this._spacing;
                     if(this.var_439)
                     {
                        _loc3_ = _loc2_.height + _loc2_.y;
                        this.var_92 = _loc3_ > this.var_92 ? Number(_loc3_) : Number(this.var_92);
                     }
                  }
                  _loc4_++;
               }
               if(_loc1_ > 0)
               {
                  this.var_103 -= this._spacing;
               }
            }
            else
            {
               this.var_103 = var_11.width;
               this.var_92 = 0;
               _loc4_ = 0;
               while(_loc4_ < _loc1_)
               {
                  _loc2_ = this._container.getChildAt(_loc4_);
                  if(_loc2_.visible)
                  {
                     _loc2_.y = this.var_92;
                     this.var_92 += _loc2_.height + this._spacing;
                     if(this.var_439)
                     {
                        _loc3_ = _loc2_.width + _loc2_.x;
                        this.var_103 = _loc3_ > this.var_103 ? Number(_loc3_) : Number(this.var_103);
                     }
                  }
                  _loc4_++;
               }
               if(_loc1_ > 0)
               {
                  this.var_92 -= this._spacing;
               }
            }
            if(this.var_649 > 0)
            {
               if(this.var_103 <= var_11.width)
               {
                  this.scrollH = 0;
               }
               else
               {
                  this._container.x = -(this.var_649 * this.maxScrollH);
               }
            }
            if(this.var_648 > 0)
            {
               if(this.var_92 <= var_11.height)
               {
                  this.scrollV = 0;
               }
               else
               {
                  this._container.y = -(this.var_648 * this.maxScrollV);
               }
            }
            this._container.height = this.var_92;
            this._container.width = this.var_103;
            this.var_530 = false;
         }
      }
      
      override public function get properties() : Array
      {
         var _loc1_:Array = super.properties;
         if(this._spacing != PropertyDefaults.const_723)
         {
            _loc1_.push(new PropertyStruct(PropertyDefaults.const_393,this._spacing,PropertyStruct.const_39,true));
         }
         else
         {
            _loc1_.push(PropertyDefaults.const_983);
         }
         if(this.var_993 != PropertyDefaults.const_1167)
         {
            _loc1_.push(new PropertyStruct(PropertyDefaults.const_694,this.var_993,PropertyStruct.const_36,true));
         }
         else
         {
            _loc1_.push(PropertyDefaults.const_1449);
         }
         if(this.var_439 != PropertyDefaults.const_1144)
         {
            _loc1_.push(new PropertyStruct(PropertyDefaults.const_850,this.var_439,PropertyStruct.const_36,true));
         }
         else
         {
            _loc1_.push(PropertyDefaults.const_1494);
         }
         if(this.var_1228 != PropertyDefaults.const_1032)
         {
            _loc1_.push(new PropertyStruct(PropertyDefaults.const_752,this.var_1228,PropertyStruct.const_36,true));
         }
         else
         {
            _loc1_.push(PropertyDefaults.const_1433);
         }
         return _loc1_;
      }
      
      override public function set properties(param1:Array) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1)
         {
            switch(_loc2_.key)
            {
               case PropertyDefaults.const_393:
                  this.spacing = _loc2_.value as int;
                  break;
               case PropertyDefaults.const_850:
                  this.scaleToFitItems = _loc2_.value as Boolean;
                  break;
               case PropertyDefaults.const_752:
                  this.resizeOnItemUpdate = _loc2_.value as Boolean;
                  break;
               case PropertyDefaults.const_694:
                  this.var_993 = _loc2_.value as Boolean;
                  break;
            }
         }
         super.properties = param1;
      }
   }
}
