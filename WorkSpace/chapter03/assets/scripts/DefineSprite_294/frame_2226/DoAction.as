function txt1()
{
   var _loc1_ = this;
   timeOut = 1000;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"スキエンティアによる少女の解析が始まった。","reset",function()
         {
            _root.mov11.txt2();
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
         _root.talk(this,50,"\n\n今回の事件の黒幕であるグリモアという人物の手がかりを手に入れるのが目的だった。","add",function()
         {
            _root.mov11.txt3();
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
         _root.talk(this,50,"\n\n強引な解析におびえ苦しむ少女。けれど、その少女のおびえは解析によるものではなかった。","add",function()
         {
            _root.mov11.txt4();
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
         _loc1_.gotoAndPlay("2nd");
         _root.talk(_loc1_,50,"\n\n彼女が兄さんの存在に気が付いた時、私はわずかに彼女の表情が変わったのを感じた。","add",function()
         {
            _root.mov11.txt5();
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
         _root.talk(this,50,"\n\nまるで、昔から兄さんを知っていたかのような。兄さんが彼女のすべてを奪ってしまったかのような、恐れとも驚きともとれる顔。","add",function()
         {
            _root.mov11.txt6();
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
         _root.talk(this,50,"\n\nそう、確かに少女は兄さんの姿におびえていたのだ。そしてそれは、彼女の中に眠っていた何かを目覚めさせてしまった。","add",function()
         {
            _root.mov11.last();
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
_root.makeWindow(this,119,18,170,220,1);
txt1();
