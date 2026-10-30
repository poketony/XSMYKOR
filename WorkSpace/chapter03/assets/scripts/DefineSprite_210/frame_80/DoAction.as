function txt1()
{
   var _loc1_ = this;
   timeOut = 1000;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"T.C.4669、メリス・オルタスという人物により、星団各所に点在していた反政府レジスタンスが統合され組織された反U.M.N.組織の名称。","reset",function()
         {
            _root.mov3.txt2();
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
         _root.talk(this,50,"\n\n現在の構成員は数千万とも言われ、星団最大規模のレジスタンス組織となっている。\nU.M.N.の使用とグノーシスの出現に関連性がある事を訴え続け、独自のネットワーク技術を駆使し、U.M.N.の管理者に対しゲリラ的活動を続けている。","add",function()
         {
            _root.mov3.last();
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
_root.makeWindow(this,20,50,200,170,1);
txt1();
