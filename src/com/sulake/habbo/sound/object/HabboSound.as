package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_1049:Sound = null;
      
      private var _soundChannel:SoundChannel = null;
      
      private var var_478:Number;
      
      private var var_1285:Boolean;
      
      public function HabboSound(param1:Sound)
      {
         super();
         this.var_1049 = param1;
         this.var_1049.addEventListener(Event.COMPLETE,this.onComplete);
         this.var_478 = 1;
         this.var_1285 = false;
      }
      
      public function play() : Boolean
      {
         this.var_1285 = false;
         this._soundChannel = this.var_1049.play(0);
         this.volume = this.var_478;
         return true;
      }
      
      public function stop() : Boolean
      {
         this._soundChannel.stop();
         return true;
      }
      
      public function get volume() : Number
      {
         return this.var_478;
      }
      
      public function set volume(param1:Number) : void
      {
         this.var_478 = param1;
         if(this._soundChannel != null)
         {
            this._soundChannel.soundTransform = new SoundTransform(this.var_478);
         }
      }
      
      public function get position() : Number
      {
         return this._soundChannel.position;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get length() : Number
      {
         return this.var_1049.length;
      }
      
      public function get ready() : Boolean
      {
         return !this.var_1049.isBuffering;
      }
      
      public function get finished() : Boolean
      {
         return !this.var_1285;
      }
      
      private function onComplete(param1:Event) : void
      {
         this.var_1285 = true;
      }
   }
}
