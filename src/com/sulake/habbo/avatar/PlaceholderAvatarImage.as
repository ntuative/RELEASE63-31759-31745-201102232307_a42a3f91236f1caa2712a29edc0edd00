package com.sulake.habbo.avatar
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import flash.display.BitmapData;
   
   public class PlaceholderAvatarImage extends AvatarImage
   {
      
      static var var_769:Map = new Map();
       
      
      public function PlaceholderAvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:AvatarFigureContainer, param4:String)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!var_764)
         {
            _structure = null;
            _assets = null;
            var_248 = null;
            var_269 = null;
            var_595 = null;
            var_533 = null;
            var_314 = null;
            if(!var_1235 && var_44)
            {
               var_44.dispose();
            }
            var_44 = null;
            _loc1_ = getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_666 = null;
            var_764 = true;
         }
      }
      
      override protected function getFullImage(param1:String) : BitmapData
      {
         return var_769[param1];
      }
      
      override protected function cacheFullImage(param1:String, param2:BitmapData) : void
      {
         var_769[param1] = param2;
      }
      
      override public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         switch(param1)
         {
            case AvatarAction.const_336:
               switch(_loc3_)
               {
                  case AvatarAction.const_802:
                  case AvatarAction.const_520:
                  case AvatarAction.const_379:
                  case AvatarAction.const_760:
                  case AvatarAction.const_333:
                  case AvatarAction.const_737:
                     super.appendAction.apply(null,[param1].concat(rest));
               }
               break;
            case AvatarAction.const_274:
            case AvatarAction.const_708:
            case AvatarAction.const_214:
            case AvatarAction.const_658:
            case AvatarAction.const_819:
            case AvatarAction.const_688:
               super.addActionData.apply(null,[param1].concat(rest));
         }
         return true;
      }
      
      override public function isPlaceholder() : Boolean
      {
         return true;
      }
   }
}
