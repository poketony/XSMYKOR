function txt1()
{
   var _loc1_ = this;
   timeOut = 1000;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"グリモア・ヴェルムによって製作されたグノーシス召還プログラムで、ある特殊波長を発生させ、その波長がグノーシスの行動に干渉することが可能である。","add",function()
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
         _root.talk(this,50,"\n\n数千年前、ゾハルとグノーシスとの関連性を調査する為に、研究利用されたが、実験は失敗。\nロスト・エルサレムの消滅の原因である局所事象変移を引き起こす結果となった。","add",function()
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
      var _loc1_ = this;
      if(getTimer() > startTime + timeOut)
      {
         _loc1_.gotoAndPlay(102);
         _root.talk(_loc1_,50,"\n\nレメゲトン自体はロスト・エルサレム脱出時にヴェクターにより回収され、同社において厳重保管されていたが、ゾハルプロジェクトの発動によりミズラヒ脳物理学研究所への引き渡しが行われた。\nその後、同研究所のヨアキム・ミズラヒ博士によりプログラムが復元され、ネピリムの歌声装置の基礎が完成する。","add",function()
         {
            _root.mov5.txt4();
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
         _loc1_.gotoAndPlay(495);
         _root.talk(_loc1_,50,"\n\nユリ・ミズラヒ博士からの情報によれば、プログラムの復元の際、特異タイプのレアリエンを献体としその疑似脳にプログラムを移植、レメゲトンの制御と波動の調整を行っていたとのことだが、実際の研究記録は残っておらず事実確認にはいたっていない。","add",function()
         {
            _root.mov5.last();
         }
         );
         delete _loc1_.onEnterFrame;
      }
   };
}
function last()
{
   this.txtBox.scrollCheck();
   this.gotoAndPlay(526);
}
_root.makeWindow(this,25,70,350,160,1);
txt1();
