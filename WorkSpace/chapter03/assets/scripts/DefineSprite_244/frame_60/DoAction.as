function txt1()
{
   var _loc1_ = this;
   timeOut = 1000;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"スキエンティア。\nU.M.N.の危険性を唱え、独自に活動を続ける地下組織。彼らが、なぜそんなにも少女にこだわるのか？その理由は、やはり14年前のミルチア紛争と関わりがあった。","reset",function()
         {
            _root.mov5.txt2();
         }
         );
         delete this.onEnterFrame;
      }
   };
}
function txt2()
{
   var _loc1_ = this;
   timeOut = 2000;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      var _loc1_ = this;
      if(getTimer() > startTime + timeOut)
      {
         _loc1_.gotoAndPlay("1st");
         _root.talk(_loc1_,50,"\n\n彼らは、少女がヨアキム･ミズラヒ博士によって製作されたレアリエンであり、紛争時になんらかの実験の献体となっていた事実を突き止めていた。そして、その実験に使用されていたのがレメゲトンというプログラムだったのである。","add",function()
         {
            _root.mov5.txt3();
         }
         );
         delete _loc1_.onEnterFrame;
      }
   };
}
function txt3()
{
   var _loc1_ = this;
   timeOut = 2000;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      var _loc1_ = this;
      if(getTimer() > startTime + timeOut)
      {
         _loc1_.gotoAndPlay("2nd");
         _root.talk(_loc1_,50,"\n\nヨアキム･ミズラヒ博士に作られたレアリエン。\nそう、私は知っている。","add",function()
         {
            _root.mov5.txt4();
         }
         );
         delete _loc1_.onEnterFrame;
      }
   };
}
function txt4()
{
   var _loc1_ = this;
   timeOut = 2000;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      var _loc1_ = this;
      if(getTimer() > startTime + timeOut)
      {
         _loc1_.gotoAndPlay("3rd");
         _root.talk(_loc1_,50,"私の過去に関わりを持つ三人のレアリエン。フェブとセシリーとキャス。","add",function()
         {
            _root.mov5.txt5();
         }
         );
         delete _loc1_.onEnterFrame;
      }
   };
}
function txt5()
{
   var _loc1_ = this;
   timeOut = 2000;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      var _loc1_ = this;
      if(getTimer() > startTime + timeOut)
      {
         _loc1_.gotoAndPlay("4th");
         _root.talk(_loc1_,50,"\n\nまさか「グリモアの少女」も彼女達と同じ境遇のレアリエンであり、U-TIC機関の実験に利用されたというのだろうか？","add",function()
         {
            _root.mov5.txt6();
         }
         );
         delete _loc1_.onEnterFrame;
      }
   };
}
function txt6()
{
   var _loc1_ = this;
   timeOut = 2000;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"\n\nけれど、少女には瞳の色を変えてまで隠したい何かがあった。いったい何を─","add",function()
         {
            _root.mov5.last();
         }
         );
         delete this.onEnterFrame;
      }
   };
}
function last()
{
   this.txtBox.scrollCheck();
   this.gotoAndPlay("end");
}
_root.makeWindow(this,119,18,170,220,1);
txt1();
