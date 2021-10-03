package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_929:int = 3;
       
      
      private var var_2314:int = -1;
      
      private var var_2316:int = -2;
      
      private var var_336:Vector3d = null;
      
      private var var_406:Vector3d = null;
      
      private var var_2313:Boolean = false;
      
      private var var_2322:Boolean = false;
      
      private var var_2318:Boolean = false;
      
      private var var_2320:Boolean = false;
      
      private var var_2315:int = 0;
      
      private var var_2321:int = 0;
      
      private var var_2317:int = 0;
      
      private var var_2319:int = 0;
      
      private var var_1351:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_406;
      }
      
      public function get targetId() : int
      {
         return this.var_2314;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2316;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2313;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_2322;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2318;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2320;
      }
      
      public function get screenWd() : int
      {
         return this.var_2315;
      }
      
      public function get screenHt() : int
      {
         return this.var_2321;
      }
      
      public function get roomWd() : int
      {
         return this.var_2317;
      }
      
      public function get roomHt() : int
      {
         return this.var_2319;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2314 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2316 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2313 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_2322 = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2318 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2320 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2315 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2321 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2317 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2319 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(this.var_336 == null)
         {
            this.var_336 = new Vector3d();
         }
         if(this.var_336.x != param1.x || this.var_336.y != param1.y || this.var_336.z != param1.z)
         {
            this.var_336.assign(param1);
            this.var_1351 = 0;
         }
      }
      
      public function dispose() : void
      {
         this.var_336 = null;
         this.var_406 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_406 != null)
         {
            return;
         }
         this.var_406 = new Vector3d();
         this.var_406.assign(param1);
      }
      
      public function update(param1:uint, param2:Number, param3:Number) : void
      {
         var _loc4_:* = null;
         if(this.var_336 != null && this.var_406 != null)
         {
            ++this.var_1351;
            _loc4_ = Vector3d.dif(this.var_336,this.var_406);
            if(_loc4_.length <= param2)
            {
               this.var_406 = this.var_336;
               this.var_336 = null;
            }
            else
            {
               _loc4_.div(_loc4_.length);
               if(_loc4_.length < param2 * (const_929 + 1))
               {
                  _loc4_.mul(param2);
               }
               else if(this.var_1351 <= const_929)
               {
                  _loc4_.mul(param2);
               }
               else
               {
                  _loc4_.mul(param3);
               }
               this.var_406 = Vector3d.sum(this.var_406,_loc4_);
            }
         }
      }
   }
}
