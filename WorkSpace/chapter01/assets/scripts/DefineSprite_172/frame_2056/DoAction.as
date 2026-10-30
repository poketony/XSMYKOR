function txt1()
{
   var _loc1_ = this;
   timeOut = 1000;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"保護された「グリモアの少女」と呼称されている少女だが、14年前にU-TIC機関によって製作されていた特異タイプのレアリエンと酷似する部分が多く見受けられる。","reset",function()
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
         _root.talk(this,50,"\n\nしかし、このタイプに関する当時の記録が残されていない為、彼女が同一のレアリエンであるかは特定できていない。","add",function()
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
         _root.talk(this,50,"\n\n彼女の記憶素子内のデータに関しても、記録のほとんどが削除された状態であり、いくつかの記憶の残滓が断片的に残る程度で、事件に関する重要な情報を得られるに至っていない。","add",function()
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
         _root.talk(this,50,"\n\n当初記憶の消失に関して、14年前の紛争が原因であろうと考えられたが、人為的に記録を改竄された形跡が発見され、今回の彼女の行動と関わりがあるものと考えられる","add",function()
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
   this.gotoAndPlay(3855);
}
_root.makeWindow(this,25,70,350,160,1);
txt1();
