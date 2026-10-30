function txt1()
{
   var _loc1_ = this;
   timeOut = 1000;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"少女が囚われていると思われる戦艦を確認した私と兄さんは、敵に気づかれる前にと、急ぎ内部への突入を開始した。","reset",function()
         {
            _root.mov14.txt2();
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
         _loc1_.gotoAndPlay(80);
         _root.talk(_loc1_,50,"\n\nだがまもなく、私達の行動は迂闊であったと思い知らされることとなった。","add",function()
         {
            _root.mov14.last();
         }
         );
         delete _loc1_.onEnterFrame;
      }
   };
}
function last()
{
   this.txtBox.scrollCheck();
   this.gotoAndPlay(129);
}
_root.makeWindow(this,130,20,150,190,1);
txt1();
