function txt1()
{
   var _loc1_ = this;
   timeOut = 1000;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"グノーシスによる小委員会ラボの襲撃。それは保護された少女が、今回の事件の鍵である事を証明する結果となった。","reset",function()
         {
            _root.mov8.txt2();
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
         _loc1_.gotoAndPlay(170);
         _root.talk(_loc1_,50,"\n\n私は、小委員会からの依頼を受け、KOS-MOSと共に、急ぎ生存者の救出に向かった。","add",function()
         {
            _root.mov8.txt3();
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
      var _loc1_ = this;
      if(getTimer() > startTime + timeOut)
      {
         _loc1_.gotoAndPlay(310);
         _root.talk(_loc1_,50,"\n\n軍のA.G.W.S.隊と共に、ラボに突入した私達は無事、ユリさんと少女、そして兄さんの救出に成功する。","add",function()
         {
            _root.mov8.txt4();
         }
         );
         delete _loc1_.onEnterFrame;
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
         _loc1_.gotoAndPlay(448);
         _root.talk(_loc1_,50,"\n\nだが、施設からの脱出を試みる私達の前に出現した謎のエージェント「ドクトゥス」。スキエンティアという反U.M.N.組織に属する彼女は、驚くべきことに、KOS-MOSを中破させ、私の目の前で少女を連れ去ってしまうのだった。","add",function()
         {
            _root.mov8.last();
         }
         );
         delete _loc1_.onEnterFrame;
      }
   };
}
function last()
{
   this.txtBox.scrollCheck();
   this.gotoAndPlay(585);
}
_root.makeWindow(this,130,20,170,190,1);
txt1();
