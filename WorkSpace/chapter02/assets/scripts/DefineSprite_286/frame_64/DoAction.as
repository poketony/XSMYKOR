function txt1()
{
   var _loc1_ = this;
   timeOut = 1000;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"ヴェクターからの指示により、破損したKOS-MOSはバージョン3への躯体換装の為、一度本社へ帰還させる事となった。","reset",function()
         {
            _root.mov12.txt2();
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
         _root.talk(this,50,"\n\nKOS-MOSがいないのは不安ではあったが、それよりも少女の存在が、私の心の中で確実に大きくなっているのを感じていた。そして私は、兄さんと共に少女の救出に参加する事を決めたのだった。","add",function()
         {
            _root.mov12.txt3();
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
         _root.talk(this,50,"\n\n一方ユリさんは、少女を捜索する為の方法として少女の脳から発せられるレメゲトンの波長パターンの特性を利用しレメゲトンの断章と共鳴させることによって、少女の位置を割り出す事に成功した。","add",function()
         {
            _root.mov12.last();
         }
         );
         delete this.onEnterFrame;
      }
   };
}
function last()
{
   this.txtBox.scrollCheck();
   this.gotoAndPlay(90);
}
_root.makeWindow(this,130,20,150,190,1);
txt1();
