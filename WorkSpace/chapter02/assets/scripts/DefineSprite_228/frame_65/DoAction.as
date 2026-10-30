function txt1()
{
   var _loc1_ = this;
   timeOut = 1000;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"襲撃現場にて、「グリモアの少女」と呼称される少女を保護。\n特に目立った外傷はないが、記憶を失っているらしく自分の名前以外の事を覚えていない。\n事件のショックによる一時的なモノとも思われるが、専門的な診断が必要であると思われる。","reset",function()
         {
            _root.mov8.txt2();
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
         _root.talk(this,50,"\n\nまた、この少女に関していくつか奇妙な点がある。\n少女は複数の人物から命を狙われており、それらの人物は少女の事を「グリモアの少女」と呼称している。\nしかし本人はその名前を否定し、自らを「ネピリム」と名乗り「グリモア」と呼ばれる人物に対し助けを求めている。","add",function()
         {
            _root.mov8.txt3();
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
         _root.talk(this,50,"\n\n過去に私が知り得た「ネピリム」の特徴とは大きな差違があり、彼女が同一人物とは考えづらい。\nまた、襲撃事件と関係があると思われる「グリモア」と言う人物と彼女との間にどのような関連性があるのかも不明である。","add",function()
         {
            _root.mov8.last();
         }
         );
         delete this.onEnterFrame;
      }
   };
}
function last()
{
   this.txtBox.scrollCheck();
   this.gotoAndPlay(1100);
}
_root.makeWindow(this,132,58,255,175,1);
txt1();
