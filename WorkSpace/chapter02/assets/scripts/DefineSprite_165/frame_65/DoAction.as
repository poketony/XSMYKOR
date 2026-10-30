function txt1()
{
   var _loc1_ = this;
   timeOut = 1000;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"KOS-MOSを破壊し、少女を連れ去ってしまったドクトゥス。兄さんの話では、グノーシス襲撃現場でも彼女の襲撃を受けたという。","reset",function()
         {
            _root.mov1.txt2();
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
         _root.talk(_loc1_,50,"\n\nでも何故、彼女は執拗に少女を狙うのか？","add",function()
         {
            _root.mov1.txt3();
         }
         );
         delete _loc1_.onEnterFrame;
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
         _root.talk(this,50,"\n\nドクトゥスが少女の事を「グリモアの少女」と呼称していることから、少女の過去について何らかの情報を持っていることは明白であった。","add",function()
         {
            _root.mov1.txt4();
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
      var _loc1_ = this;
      if(getTimer() > startTime + timeOut)
      {
         _loc1_.gotoAndPlay(123);
         _root.talk(_loc1_,50,"\n\n私はユリさんから提出された報告書の中から、必死に少女と今回の事件に関する手がかりを見つけようとしていた。","add",function()
         {
            _root.mov1.txt5();
         }
         );
         delete _loc1_.onEnterFrame;
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
         _root.talk(this,50,"\n\nこの時、私自身の心にわだかまっていた少女に対する不安が、徐々に薄れていくのを感じていた。","add",function()
         {
            _root.mov1.last();
         }
         );
         delete this.onEnterFrame;
      }
   };
}
function last()
{
   this.txtBox.scrollCheck();
   this.gotoAndPlay(175);
}
_root.makeWindow(this,130,20,150,190,1);
txt1();
