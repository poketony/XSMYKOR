function txt1()
{
   var _loc1_ = this;
   timeOut = 1000;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"グノーシス襲撃事件に関する接触小委員会による考察","reset",function()
         {
            _root.mov5.txt2();
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
         _root.talk(this,50,"\n\n現段階で複数の襲撃事件について、関連性は見つかっていない。\nしかし、襲撃に加わっているグノーシスの行動に関し、不可思議な点がいくつか見受けられる。","add",function()
         {
            _root.mov5.txt3();
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
         _root.talk(this,50,"\n\n・襲撃場所が繁華街や市街地を中心に狙われており、民間人をターゲットにした襲撃の可能性がある。\n・グノーシスの行動が単に破壊活動ではなく、その行動に一貫性の法則が見受けられる。\n・襲撃後、すべてのグノーシスが一定の期間内にすべて消滅している。","add",function()
         {
            _root.mov5.txt4();
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
         _root.talk(this,50,"\n\nこれらの事実から考察するに、何者かの指示によりグノーシスの行動が決められているような節も見受けられる。また先の襲撃事件では、グノーシスと共に行動し、百式をグノーシス化させた少年？が確認されており、その少年の言葉から「グリモア」と呼ばれる人物が本件に深く関わりがあるものと考えられる。\nおよそ信じられないことではあるが、彼らを率いている統率者の存在が確認されれば、我らの大きな驚異となり得る。","add",function()
         {
            _root.mov5.last();
         }
         );
         delete this.onEnterFrame;
      }
   };
}
function last()
{
   this.txtBox.scrollCheck();
   this.gotoAndPlay(1955);
}
_root.makeWindow(this,25,70,350,160,1);
txt1();
