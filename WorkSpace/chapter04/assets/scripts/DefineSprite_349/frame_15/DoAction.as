function txt1()
{
   timeOut = 1000;
   startTime = getTimer();
   this.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"当初、レメゲトンの断章に関する一連の事件はグリモア・ヴェルムの名を語る人物によって引き起こされたものと推測されたが、これまでの不可解な事象及び犯人の潜伏場所がヴェクターの特別管理領域である事から、おそらくグリモア・ヴェルム本人の可能性が高いと思われる。","reset",function()
         {
            _root.mov19.txt2();
         }
         );
         delete this.onEnterFrame;
      }
   };
}
function txt2()
{
   timeOut = 2000;
   startTime = getTimer();
   this.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"\n\nどのような方法で、数千年の時を生きてこれたのか、まったくの謎ではあるが、何かの理由（おそらくはロスト・エルサレム消失に関係すると思われるが）により精神体としてU.M.N.内に存在していたものと思われる。\nヴェクターはこの事実を知り、レメゲトン再生の為にグリモアを隔離し、その存在を隠していたと思われる。","add",function()
         {
            _root.mov19.last();
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
_root.makeWindow(this,-170,-98,340,170,1);
txt1();
