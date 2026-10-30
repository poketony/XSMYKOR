function txt1()
{
   var _loc1_ = this;
   timeOut = 1000;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"今回の襲撃事件にかかわる「グリモア」という人物。","reset",function()
         {
            _root.mov7.txt2();
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
         _root.talk(this,50,"\n\nそして、グリモアという人物により製作され、14年前にヨアキム・ミズラヒによって復元されたプログラム「レメゲトン」。「グリモアの少女」と呼称されるレアリエン。","add",function()
         {
            _root.mov7.txt3();
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
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"\n\nまだ漠然とではあったが、これらの情報が徐々に一つに繋がりつつあった。","add",function()
         {
            _root.mov7.txt4();
         }
         );
         delete this.onEnterFrame;
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
         _root.talk(this,50,"\n\nユリさんと兄さんは、さらわれた少女救出の指揮をとっている。少女を必死に助けようとしているユリさん。おそらく彼女は、さらわれた少女にモモちゃんの面影を重ねているのだろう。","add",function()
         {
            _root.mov7.txt5();
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
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"\n\n私はといえば、まだ少女の救出に参加するのを迷っており、兄さんが提出した襲撃事件の時の少女に関するレポートに目を通していた。","add",function()
         {
            _root.mov7.txt6();
         }
         );
         delete this.onEnterFrame;
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
         _root.talk(this,50,"\n\nそこには私のよく知っているある人物の名が記されていた。","add",function()
         {
            _root.mov7.last();
         }
         );
         delete this.onEnterFrame;
      }
   };
}
function last()
{
   this.txtBox.scrollCheck();
   this.gotoAndPlay(180);
}
_root.makeWindow(this,20,20,190,170,1);
txt1();
