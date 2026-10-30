function txt1()
{
   var _loc1_ = this;
   timeOut = 1000;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"ヴェクターが今回の一連の事件に関わっている？私はその話の内容をすぐには理解できなかった。","reset",function()
         {
            _root.mov9.txt2();
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
         _loc1_.gotoAndPlay("1st");
         _root.talk(_loc1_,50,"\n\n確かに、U.M.N.はヴェクターにより管理運営されていた。だからといって、事件にヴェクターが絡んでいると考えるのは強引すぎだと思える。","add",function()
         {
            _root.mov9.txt3();
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
         _root.talk(this,50,"\n\nしかし、少女とレメゲトン。そしてU.M.N.内で活動しているグリモアという人物。それらの情報をヴェクターが知らないわけも無い。","add",function()
         {
            _root.mov9.txt4();
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
         chara.gotoAndPlay("2nd");
         _root.talk(this,50,"確かにヴェクターには謎が多いと思う。KOS-MOSにしても、主任である私にも知らされない、何者かの力が働いているように感じる。","add",function()
         {
            _root.mov9.txt5();
         }
         );
         delete this.onEnterFrame;
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
         chara.gotoAndPlay("3rd");
         _root.talk(this,50,"\n\n私はドクトゥス達の言葉をそのまま受け止める気にはなれなかったが、心の奥に徐々に不信感が募っていくのを感じていた。","add",function()
         {
            _root.mov9.last();
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
