function txt1()
{
   var _loc1_ = this;
   timeOut = 1000;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"ネピリム─私の前に度々出現する幻影の少女。さらわれた少女は、自らを「ネピリム」と名乗ったという。","reset",function()
         {
            _root.mov10.txt2();
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
         _root.talk(this,50,"\n\nネピリムと少女にどんな関わりがあるのか？もし、少女が14年前のミルチア紛争とネピリムに関わりがあるのならば、私にとっても決して無関係な存在ではないはず。","add",function()
         {
            _root.mov10.txt3();
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
      var _loc1_ = this;
      if(getTimer() > startTime + timeOut)
      {
         _loc1_.gotoAndPlay(71);
         _root.talk(_loc1_,50,"\n\nそして、その少女を狙うドクトゥスというエージェント。彼女は、少女とネピリムに関する情報も握っているかもしれない。","add",function()
         {
            _root.mov10.last();
         }
         );
         delete _loc1_.onEnterFrame;
      }
   };
}
function last()
{
   this.txtBox.scrollCheck();
   this.gotoAndPlay(105);
}
_root.makeWindow(this,130,20,150,190,1);
txt1();
