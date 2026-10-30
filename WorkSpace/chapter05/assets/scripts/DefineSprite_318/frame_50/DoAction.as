function txt1()
{
   timeOut = 1000;
   startTime = getTimer();
   this.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"そう、彼女は断章がほしかったのだ。自分の思い出を取り戻す為に、断章が必要なのだと言った。","reset",function()
         {
            _root.mov17.txt2();
         }
         );
         delete this.onEnterFrame;
      }
   };
}
function txt2()
{
   timeOut = 2000;
   startTime = getTimer();
   this.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"\n\n彼女の思い出。","add",function()
         {
            _root.mov17.txt3();
         }
         );
         delete this.onEnterFrame;
      }
   };
}
function txt3()
{
   timeOut = 2000;
   startTime = getTimer();
   this.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"\n\nソレは自分が何者なのかさえわからない彼女にとって、唯一自分を定義できるモノなのかもしれない。だが、レアリエンとして、献体として生まれた彼女の思い出を取り戻すことが本当に幸せなことなのだろうか———","add",function()
         {
            _root.mov17.last();
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
_root.makeWindow(this,26,21,220,234,1);
txt1();
