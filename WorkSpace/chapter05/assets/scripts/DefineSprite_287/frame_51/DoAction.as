function txt1()
{
   timeOut = 1000;
   startTime = getTimer();
   this.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"突然、私たちの援護に現れたドクトゥス。敵対していた彼女がなぜ？","reset",function()
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
   timeOut = 2000;
   startTime = getTimer();
   this.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"\n\n混乱する私に兄さんは、私達が囚われていた場所がU.M.N.内のヴェクターによって管理された、アルス・ノヴァという場所であり、グリモアによって私の意識が囚われていたこと、そして私を助けるために、スキエンティアと手を組んだことを説明してくれた。","add",function()
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
   timeOut = 2000;
   startTime = getTimer();
   this.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"\n\n少女を連れ去ったグリモアは、建物の奥に逃げ込んだようだった。私は兄さんと共にグリモアと少女の後を追った。","add",function()
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
}
_root.makeWindow(this,120,20,154,250,1);
txt1();
