package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.LandscapeRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.FloorRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallAdRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallRasterizer;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   
   public class RoomVisualizationData implements IRoomObjectVisualizationData
   {
       
      
      private var var_461:WallRasterizer;
      
      private var var_462:FloorRasterizer;
      
      private var var_669:WallAdRasterizer;
      
      private var var_460:LandscapeRasterizer;
      
      private var var_670:PlaneMaskManager;
      
      private var var_741:Boolean = false;
      
      public function RoomVisualizationData()
      {
         super();
         this.var_461 = new WallRasterizer();
         this.var_462 = new FloorRasterizer();
         this.var_669 = new WallAdRasterizer();
         this.var_460 = new LandscapeRasterizer();
         this.var_670 = new PlaneMaskManager();
      }
      
      public function get initialized() : Boolean
      {
         return this.var_741;
      }
      
      public function get floorRasterizer() : IPlaneRasterizer
      {
         return this.var_462;
      }
      
      public function get wallRasterizer() : IPlaneRasterizer
      {
         return this.var_461;
      }
      
      public function get wallAdRasterizr() : WallAdRasterizer
      {
         return this.var_669;
      }
      
      public function get landscapeRasterizer() : IPlaneRasterizer
      {
         return this.var_460;
      }
      
      public function get maskManager() : PlaneMaskManager
      {
         return this.var_670;
      }
      
      public function dispose() : void
      {
         if(this.var_461 != null)
         {
            this.var_461.dispose();
            this.var_461 = null;
         }
         if(this.var_462 != null)
         {
            this.var_462.dispose();
            this.var_462 = null;
         }
         if(this.var_669 != null)
         {
            this.var_669.dispose();
            this.var_669 = null;
         }
         if(this.var_460 != null)
         {
            this.var_460.dispose();
            this.var_460 = null;
         }
         if(this.var_670 != null)
         {
            this.var_670.dispose();
            this.var_670 = null;
         }
      }
      
      public function clearCache() : void
      {
         if(this.var_461 != null)
         {
            this.var_461.clearCache();
         }
         if(this.var_462 != null)
         {
            this.var_462.clearCache();
         }
         if(this.var_460 != null)
         {
            this.var_460.clearCache();
         }
      }
      
      public function initialize(param1:XML) : Boolean
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         this.reset();
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:XMLList = param1.wallData;
         if(_loc2_.length() > 0)
         {
            _loc7_ = _loc2_[0];
            this.var_461.initialize(_loc7_);
         }
         var _loc3_:XMLList = param1.floorData;
         if(_loc3_.length() > 0)
         {
            _loc8_ = _loc3_[0];
            this.var_462.initialize(_loc8_);
         }
         var _loc4_:XMLList = param1.wallAdData;
         if(_loc4_.length() > 0)
         {
            _loc9_ = _loc4_[0];
            this.var_669.initialize(_loc9_);
         }
         var _loc5_:XMLList = param1.landscapeData;
         if(_loc5_.length() > 0)
         {
            _loc10_ = _loc5_[0];
            this.var_460.initialize(_loc10_);
         }
         var _loc6_:XMLList = param1.maskData;
         if(_loc6_.length() > 0)
         {
            _loc11_ = _loc6_[0];
            this.var_670.initialize(_loc11_);
         }
         return true;
      }
      
      public function initializeAssetCollection(param1:IGraphicAssetCollection) : void
      {
         if(this.var_741)
         {
            return;
         }
         this.var_461.initializeAssetCollection(param1);
         this.var_462.initializeAssetCollection(param1);
         this.var_669.initializeAssetCollection(param1);
         this.var_460.initializeAssetCollection(param1);
         this.var_670.initializeAssetCollection(param1);
         this.var_741 = true;
      }
      
      protected function reset() : void
      {
      }
   }
}
