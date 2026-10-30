function txt1()
{
   timeOut = 1000;
   startTime = getTimer();
   this.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"グリモアによって少女の内に取り込まれた断章は、少女の中に眠っていた断章と結合し、ついにレメゲトンが完成してしまった。そしてレメゲトンの覚醒により、少女はグノーシスへ取り込まれ始めたのだ。","reset",function()
         {
            _root.mov21.txt2();
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
         _root.talk(this,50,"\n\nこのまま少女を放置しておけば、彼女の発するその歌声は、やがてU.M.N.に広がり、全宇宙へと拡散していくだろう。そうなれば、この世界のすべてがグノーシスによって取り込まれてしまう。","add",function()
         {
            _root.mov21.txt3();
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
         _root.talk(this,50,"\n\nなぜこんな事になってしまったのだろう。","add",function()
         {
            _root.mov21.txt4();
         }
         );
         delete this.onEnterFrame;
      }
   };
}
function txt4()
{
   timeOut = 2000;
   startTime = getTimer();
   this.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"\n\n少女は思い出がほしかっただけだった。グリモアは自分の愛する娘を生き返らせたかっただけだった。二人ともただその望みをかなえたいと思っていただけなのに———","add",function()
         {
            _root.mov21.txt5();
         }
         );
         delete this.onEnterFrame;
      }
   };
}
function txt5()
{
   timeOut = 2000;
   startTime = getTimer();
   this.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"\n\nけれど現実は、その思いがお互いを傷つけ、そして他の人を不幸にしていったのだ。","add",function()
         {
            _root.mov21.last();
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
_root.makeWindow(this,20,55,360,190,1);
txt1();
