function txt1()
{
   var _loc1_ = this;
   timeOut = 1000;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"断章保持者（グランディ）とは「レメゲトンの断章」を体内に取り込む事でレメゲトンにより汚染された者の呼称であり、現在確認されている断章保持者はローゼン特区にて確認された「少年」のみである。\nまた「グリモアの少女」もすでに断章保持者となっている可能性は高い。","reset",function()
         {
            _root.mov6.txt2();
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
         _root.talk(this,50,"\n\n「レメゲトンの断章」は単体ではその意味を成さないが、脳内に取り込んだ場合、プログラムが発する波長に汚染されグノーシス化してしまう。\n従来のグノーシス化と異なるのは個体の生命機能を維持する為、個人の意識がそのまま保持される点であり、この状態になった者を断章保持者と呼称し、レメゲトンの断章の危険性はまさにこの断章保持者を生み出す事にある。","add",function()
         {
            _root.mov6.txt3();
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
         _root.talk(this,50,"\n\n断章保持者となった者はその波動をコントロールする事ができ、望む場所に望みどおりのグノーシスを召還し操ることが可能となる、まさに脅威の存在である。","add",function()
         {
            _root.mov6.last();
         }
         );
         delete this.onEnterFrame;
      }
   };
}
function last()
{
   this.txtBox.scrollCheck();
   kaisetsu.gotoAndStop(2);
}
_root.makeWindow(this,20,55,360,170,1);
txt1();
