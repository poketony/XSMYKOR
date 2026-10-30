function txt1()
{
   var _loc1_ = this;
   timeOut = 1000;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"この時私は、アルマデルの意識と共感していた。彼女が求めていた記憶。","reset",function()
         {
            _root.mov20.txt2();
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
         _root.talk(this,50,"\n\nそれは私と共に過ごした、たった数日間の、しかし彼女にとっては暖かく楽しかった、とても大切な思い出。","add",function()
         {
            _root.mov20.txt3();
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
         _root.talk(this,50,"\n\nだから彼女は決意してくれたのだ。その思い出を、そして私達を守る為に。","add",function()
         {
            _root.mov20.last();
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
_root.makeWindow(this,120,20,154,250,1);
txt1();
