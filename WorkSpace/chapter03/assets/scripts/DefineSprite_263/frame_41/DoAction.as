function txt1()
{
   var _loc1_ = this;
   timeOut = 1000;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"グノーシスに関する目撃及び遭遇による被害はその41％がU.M.N.内で発生している。\nまた、実数空間へのグノーシス出現の殆どが、U.M.N.経由でのダイブである事は周知の事実である。\nだがこの事実がありながら、U.M.N.内でグノーシスに関する本格的な調査が行なわれた形跡はない。\n現在U.M.N.は星団連邦政府の管轄で管理運営されているが、その整備に関してはヴェクターに一任されており、グノーシスに関する被害の事後処理に関してもヴェクターが主導で行なわれている。この事後処理の報告も星団連邦政府へ行われるべきはずのものなのだが、その殆どが極秘扱いとなり、形式上の報告書が提出されているだけである。","reset",function()
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
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"\n\nそもそも、U.M.N.とは何なのか？\nU.M.N.の基礎整備に関する記録や星団中に設置されている転移コラムの設置記録等、U.M.N.の開発に関する記録がまったく残されていない。\n星団の生命線とも言えるネットワークの記録が何も残されていないという事がありえるのだろうか？\nこれらの事象から推測するに、ヴェクターはその危険性を承知していながら、U.M.N.とグノーシスに関する重大な情報を故意に隠蔽していると言わざるを得ない。","add",function()
         {
            _root.mov8.txt3();
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
         _root.talk(this,50,"\n\nこの件に関してのヴェクターからの返答は一切無く、さらなる独自の調査が必要と思われる。","add",function()
         {
            _root.mov8.last();
         }
         );
         delete this.onEnterFrame;
      }
   };
}
function last()
{
   this.txtBox.scrollCheck();
   kaisetsu.gotoAndStop(2);
}
_root.makeWindow(this,20,55,360,170,1);
txt1();
