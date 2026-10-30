function txt1()
{
   var _loc1_ = this;
   timeOut = 1000;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"「グリモアの少女」を襲撃した女性エージェント。\nその装備と身のこなしから専門の訓練を受けていると推測されるが、彼女が何故少女の命を狙うのか、その目的は不明。また、彼女の行動が単独によるものなのか組織的なものなのかも不明。\n彼女が少女の事を「グリモアの少女」と呼称している事から、「グリモア」と言う人物と襲撃事件に関わりがあると推測される。","reset",function()
         {
            _root.mov10.last();
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
_root.makeWindow(this,143,54,240,220,1);
txt1();
