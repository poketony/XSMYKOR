function txt1()
{
   var _loc1_ = this;
   timeOut = 1000;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"私は今、スキエンティアと呼ばれる組織の協力を得てU.M.N.に存在するヴェクターの重要管理領域への潜入を試みている。","reset",function()
         {
            _root.mov3.txt2();
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
         _root.talk(this,50,"\n\n私がヴェクターをやめ、スキエンティアと行動を共にするきっかけとなった事件。後にグノーシス・テロと呼ばれるその事件は、私と私の周りの人間をも巻き込み、それぞれの心に不安と不信感を植え付けていった。","add",function()
         {
            _root.mov3.txt3();
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
         _root.talk(this,50,"\n\nこの不信感を拭い去ることができなかった私は、わだかまりを抱えたまま、KOS-MOSと接することができず、ヴェクターを去ることを決めたのだった。","add",function()
         {
            _root.mov3.txt4();
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
         _root.talk(this,130,"\n\nだから、私はこの目で確かめなければならない。\nあの時知ってしまった秘密…そのすべてを。","add",function()
         {
            _root.mov3.last();
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
_root.makeWindow(this,20,60,190,170,1);
txt1();
stop();
