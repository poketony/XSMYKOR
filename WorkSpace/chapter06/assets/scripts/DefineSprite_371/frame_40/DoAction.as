function txt1()
{
   var _loc1_ = this;
   timeOut = 1000;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"私はすべてを思い出した。少女の思い出と共に消えていた私の記憶。","reset",function()
         {
            _root.mov13.txt2();
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
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"\n\nそれは14年前のミルチアで、少女と———アルマデルと出会った記憶。","add",function()
         {
            _root.mov13.txt3();
         }
         );
         delete this.onEnterFrame;
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
         _root.talk(_loc1_,50,"\n\nそして彼女の思い出を奪ったのは、私の父「スオウ・ウヅキ」だった。","add",function()
         {
            _root.mov13.txt4();
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
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"\n\nだからアルマデルは、兄さんに父の面影を感じ取り、怯えていたのだ。","add",function()
         {
            _root.mov13.txt5();
         }
         );
         delete this.onEnterFrame;
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
         _loc1_.gotoAndPlay("end");
         _root.talk(_loc1_,50,"\n\n父がグリモアとヴェクターやヨアキム・ミズラヒ、そしてアルマデルとどんな関わりがあったのかは分からない。","add",function()
         {
            _root.mov13.txt6();
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
         _root.talk(this,50,"\n\nただ、はっきりしていたのは彼女は私と同じ思い出を持っていたのだ。","add",function()
         {
            _root.mov13.last();
         }
         );
         delete this.onEnterFrame;
      }
   };
}
function last()
{
   this.txtBox.scrollCheck();
}
_root.makeWindow(this,120,20,154,250,1);
txt1();
