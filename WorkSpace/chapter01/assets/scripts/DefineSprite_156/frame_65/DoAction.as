function txt1()
{
   var _loc1_ = this;
   timeOut = 1000;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"アルベドによって引き起こされたミルチア宙域での局所事象変移が収束した後、私はヴェクターの開発主任としての通常業務へと戻った。第二ミルチアへ移動前に受けていた連邦主星に新設される三局分室室長就任という辞令は一旦白紙へと戻され、ヴォークリンデ襲撃事件から今日までの一連の騒動に対する必要書類の処理に追われる毎日を繰り返していた。","reset",function()
         {
            _root.mov4.txt2();
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
         _root.talk(this,50,"\n\nこの間にもグノーシスの脅威は徐々にその範囲を拡大し、連邦の各惑星に対し多大なる被害をもたらしていたが、私はそれをどこか他人事のように感じ始めていたのかもしれない。","add",function()
         {
            _root.mov4.txt3();
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
         _loc1_.gotoAndPlay(1160);
         _root.talk(_loc1_,50,"\n\nそして半年後、宇宙港で別れた兄さんが、接触小委員会の依頼で、一連のグノーシスによる襲撃事件の調査に関わっている事を知らされた。","add",function()
         {
            _root.mov4.last();
         }
         );
         delete _loc1_.onEnterFrame;
      }
   };
}
function last()
{
   this.txtBox.scrollCheck();
   this.gotoAndPlay(1450);
}
_root.makeWindow(this,20,20,190,170,1);
txt1();
