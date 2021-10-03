package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2599:String;
      
      private var var_1854:String;
      
      private var var_2598:String;
      
      private var var_1853:Boolean;
      
      private var var_1852:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2599 = String(param1["set-type"]);
         this.var_1854 = String(param1["flipped-set-type"]);
         this.var_2598 = String(param1["remove-set-type"]);
         this.var_1853 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1852 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_1852;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1852 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2599;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1854;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2598;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1853;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1853 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1854 = param1;
      }
   }
}
