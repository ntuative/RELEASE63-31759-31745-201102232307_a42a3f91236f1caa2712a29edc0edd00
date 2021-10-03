package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_369:int = 1;
      
      public static const const_261:int = 2;
      
      public static const const_305:int = 3;
      
      public static const const_349:int = 4;
      
      public static const const_250:int = 5;
      
      public static const const_392:int = 1;
      
      public static const const_713:int = 2;
      
      public static const const_704:int = 3;
      
      public static const const_638:int = 4;
      
      public static const const_222:int = 5;
      
      public static const const_676:int = 6;
      
      public static const const_767:int = 7;
      
      public static const const_242:int = 8;
      
      public static const const_388:int = 9;
      
      public static const const_1849:int = 10;
      
      public static const const_856:int = 11;
      
      public static const const_508:int = 12;
       
      
      private var var_437:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_437 = new Array();
         this.var_437.push(new Tab(this._navigator,const_369,const_508,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_554));
         this.var_437.push(new Tab(this._navigator,const_261,const_392,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_554));
         this.var_437.push(new Tab(this._navigator,const_349,const_856,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1184));
         this.var_437.push(new Tab(this._navigator,const_305,const_222,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_554));
         this.var_437.push(new Tab(this._navigator,const_250,const_242,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_777));
         this.setSelectedTab(const_369);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_349;
      }
      
      public function get tabs() : Array
      {
         return this.var_437;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_437)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_437)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_437)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
