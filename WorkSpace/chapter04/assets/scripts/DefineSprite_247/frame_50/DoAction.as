function txt1()
{
   timeOut = 1000;
   startTime = getTimer();
   this.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"私の意識に干渉してきた「ネピリム」。彼女はシオンと少女がグリモアに囚われていると告げた。","reset",function()
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
   timeOut = 2000;
   startTime = getTimer();
   this.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"\n\nその場所はU.M.N.でもっともセキュリティレベルの高い場所。ヴェクターによって管理された「S-Division」の内の１つの、最深部。","add",function()
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
   timeOut = 2000;
   startTime = getTimer();
   this.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"\n\nネピリムはグリモアを止めてくれと言っていた。彼女とグリモアの間に何があるのかは、わからなかったが、シオンと少女の囚われている場所が判明した以上、もはや躊躇している余裕などなかった。","add",function()
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
   this.gotoAndPlay("end");
}
_root.makeWindow(this,-40,-127,220,230,1);
txt1();
