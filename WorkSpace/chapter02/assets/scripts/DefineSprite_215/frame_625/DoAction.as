function txt1()
{
   var _loc1_ = this;
   timeOut = 1000;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"本名グリモア・ヴェルム。\nヴェクターのゾハル研究プロジェクトの技術主任であり、グノーシス召還プログラム「レメゲトン」を製作したプログラマー。\nその他のパーソナルデータは不明。\n彼の情報はロスト・エルサレムの消滅の際に紛失したモノと思われ、彼自身も消滅時に死亡したと推測される。","reset",function()
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
         _root.talk(this,50,"\n\n実の娘をレメゲトンの献体としグノーシス召喚プログラムを完成させるが、その実験中の事故によりゾハルが暴走し、結果ロスト・エルサレム消失の直接の原因である局所事象変異を引き起こした人物とされる。\n献体であった娘もその事故で死亡している。","add",function()
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
   this.gotoAndPlay(1430);
}
_root.makeWindow(this,25,70,350,160,1);
txt1();
