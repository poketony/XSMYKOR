function txt1()
{
   timeOut = 1000;
   startTime = getTimer();
   this.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"スキエンティアの言う、断章保持者（グランディ）。グノーシス事件の調査中に、私のパートナーであった百式をグノーシス化させた謎の少年も、その1人だった。","reset",function()
         {
            _root.mov16.txt2();
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
         _root.talk(this,50,"\n\nあの時も少女は怯えていた。","add",function()
         {
            _root.mov16.txt3();
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
         this.gotoAndPlay(30);
         _root.talk(this,50,"\n\nグノーシス化した自らをヒルベルトエフェクトで固着させた百式を、私は、斬るしかなかった。少女はその惨状を見て怯えていたのではなかった。私に、怯えていたのだ。","add",function()
         {
            _root.mov16.txt4();
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
         _root.talk(this,50,"\n\n少女は私から逃げ出そうとしていたのか？だとするなら、少女は私に助けられたくないかもしれない。","add",function()
         {
            _root.mov16.txt5();
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
         _root.talk(this,50,"\n\n私はそんな考えを強引に振り切り、二人を救出することだけに集中した。","add",function()
         {
            _root.mov16.txt6();
         }
         );
         delete this.onEnterFrame;
      }
   };
}
function txt6()
{
   timeOut = 2000;
   startTime = getTimer();
   this.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"\n\nヴェクターのセキュリティーガードを突破し、中枢へ潜入する為にはそれなりの装備と技術が必要である。","add",function()
         {
            _root.mov16.txt7();
         }
         );
         delete this.onEnterFrame;
      }
   };
}
function txt7()
{
   timeOut = 2000;
   startTime = getTimer();
   this.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         this.gotoAndPlay(50);
         _root.talk(this,50,"\n\n小委員会の協力が得られぬ以上、ある組織の手を借りる以外に方法はない。そう、ドクトゥス達ならばソレを可能にできる。","add",function()
         {
            _root.mov16.txt8();
         }
         );
         delete this.onEnterFrame;
      }
   };
}
function txt8()
{
   timeOut = 2000;
   startTime = getTimer();
   this.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"\n\nシオンが一緒なら、無謀だの無茶だの騒ぎ立てただろう。だがこの時、スキエンティアと私の目的は共通であり、共闘も可能なはずだった。","add",function()
         {
            _root.mov16.txt9();
         }
         );
         delete this.onEnterFrame;
      }
   };
}
function txt9()
{
   timeOut = 2000;
   startTime = getTimer();
   this.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"\n\nただあくまでドクトゥス達が、敵対していた私の提案を冷静に判断できるならば、の話であったが———。","add",function()
         {
            _root.mov16.last();
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
_root.makeWindow(this,-87,-125,180,220,1);
txt1();
