function txt1()
{
   var _loc1_ = this;
   timeOut = 1000;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"レメゲトンによって生み出された黒い霧は、やがて少女の全身を包み込み、グノーシスへと変貌していった。","reset",function()
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
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"\n\nレメゲトンの断章は、人としての意識を保持したままグノーシス化させる。だがその時の少女は、正気を失っており、こちらの声は聞こえてはいなかった。","add",function()
         {
            _root.mov6.txt3();
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
         _root.talk(this,50,"\n\n自らの感情を抑えられず暴れだすグノーシス。その私達の窮地を救ったのは、新型の躯体に身を包んだKOS-MOSだった。","add",function()
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
         _root.talk(this,50,"\n\n私達の盾となり、グノーシスの攻撃を防ぐKOS-MOS。その隙をつき、兄さんは少女に向かい刀を抜き放った。","add",function()
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
}
_root.makeWindow(this,120,20,154,250,1);
txt1();
