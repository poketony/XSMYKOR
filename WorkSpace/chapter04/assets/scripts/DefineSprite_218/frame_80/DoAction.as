function txt1()
{
   timeOut = 1000;
   startTime = getTimer();
   this.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"「グリモアの少女」の覚醒によって、少女は我らの目の前から消え去り、彼女を救おうとしたシオンは意識不明の状態に陥ってしまった。小委員会の報告では、グリモアの少女はU.M.N.への転移が確認され、おそらくシオンは意識だけ強制的にU.M.N.内部に取り込まれたものと考えられた。","reset",function()
         {
            _root.mov2.txt2();
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
         _root.talk(this,50,"\n\n私は急ぎミズラヒ女史と共に、シオンの意識のサルベージを試みようとしたが、広大なU.M.N.の海で、何の手がかりもなくシオンの意識を探し出す事は不可能であった。","add",function()
         {
            _root.mov2.txt3();
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
         _root.talk(this,50,"\n\n何一つ打つ手がなく、ただ時間だけが過ぎていった。私は14年前と同様に己の無能さを悔やむことしかできなかった。","add",function()
         {
            _root.mov2.last();
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
_root.makeWindow(this,20,20,230,230,1);
txt1();
