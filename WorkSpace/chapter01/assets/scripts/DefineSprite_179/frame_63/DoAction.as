function txt1()
{
   var _loc1_ = this;
   timeOut = 1000;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"グノーシスによる襲撃事件。\n当初それは、頻発しているグノーシス現象と同様のものと認識されていたし、私自身、兄さんが事件に関わっている事を知らなければ、その詳細を知ろうとさえしなかったかもしれない。","reset",function()
         {
            _root.mov6.txt2();
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
         _loc1_.gotoAndPlay(592);
         _root.talk(_loc1_,50,"\n\nただ、その事件の異常さにいち早く気づいたユリさんは兄さん達と共に事件の調査を続け、そしてある重要な手がかりを掴んだ。事件現場で目撃されていた謎の少女を保護したのである。","add",function()
         {
            _root.mov6.txt3();
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
         _root.talk(this,50,"\n\n小委員会でその少女の調査が開始され、結果、少女は何らかの目的のために製作された特殊なタイプのレアリエンだということが判明したのだった。","add",function()
         {
            _root.mov6.txt4();
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
         _root.talk(this,50,"\n\n小委員会からの報告書はヴェクターにも届けられ、三局がそのレアリエンの調査のサポートを行うこととなった。私も対グノーシス戦のアドバイザーとして調査に参加する事となったが、参考資料として三局が提出した少女の調査結果を見て言葉を失った。","add",function()
         {
            _root.mov6.txt5();
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
         _root.talk(this,50,"\n\nその少女は14年前にヨアキム・ミズラヒの手によって製作されたレアリエンと同系統のものだったのである。しかも、少女の製造記録は存在さえしていなかった。","add",function()
         {
            _root.mov6.txt6();
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
         _root.talk(this,50,"\n\nその少女がこの事件に深い関わりがあるのは間違いないだろう。私はこの時すでに、心のどこかで少女の存在を否定しようとしていたのかもしれない。この少女に関わる事で、心の中の平穏を崩されるのが怖かったから…","add",function()
         {
            _root.mov6.txt7();
         }
         );
         delete this.onEnterFrame;
      }
   };
}
function txt7()
{
   var _loc1_ = this;
   timeOut = 2000;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"\n\nしかし、その私の迷いは小委員会からの緊急連絡により不安へと変わった。\n事件は緊急を要する事態へと変化していったのである。","add",function()
         {
            _root.mov6.last();
         }
         );
         delete this.onEnterFrame;
      }
   };
}
function last()
{
   this.txtBox.scrollCheck();
   this.gotoAndPlay(635);
}
_root.makeWindow(this,20,20,190,170,1);
txt1();
