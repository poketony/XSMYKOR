function txt1()
{
   var _loc1_ = this;
   timeOut = 1000;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"「グリモアの少女」（以下少女）に関する現段階での情報。\n少女は現在確認できるどのタイプのレアリエンとも規格が異なった特殊なレアリエンであり、レアリエンの大きな外的特徴である瞳にも特殊加工がなされている。U-TIC機関所属のヨアキム・ミズラヒ博士により研究、製作されていたタイプに酷似した特徴が見受けられる。","reset",function()
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
         _root.talk(this,50,"\n\n彼女はおそらくミルチアに存在したU-TIC機関本部「ラビュリントス」において、同博士が研究していたレメゲトンの再生の為の献体として使用されていたと推測されるが、14年前のミルチア紛争により研究データと共に献体のパーソナルデータ等もすべて消失してしまっており、その詳細は不明である。","add",function()
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
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"\n\n紛争後、公式においてラビュリントス内で研究利用されていたレアリエンは、そのすべてを廃棄処分したとの発表があったが、幼体偽装を施されたタイプが数体紛争時に行方不明になったままとの情報提供もあり、その真意は定かではない。","add",function()
         {
            _root.mov4.last();
         }
         );
         delete this.onEnterFrame;
      }
   };
}
function last()
{
   this.txtBox.scrollCheck();
   this.gotoAndPlay("end");
}
_root.makeWindow(this,20,55,360,170,1);
txt1();
