function txt1()
{
   timeOut = 1000;
   startTime = getTimer();
   this.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"スキエンティアの艦の中でグリモアの少女の暴走を止めようとした私は、そのまま気を失ってしまった。そして、気が付いた時には少女と共に見知らぬ場所にいたのだった。","reset",function()
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
   timeOut = 2000;
   startTime = getTimer();
   this.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"\n\nいったいどこなのか？\n誰によって運ばれたのか？","add",function()
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
   timeOut = 2000;
   startTime = getTimer();
   this.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"\n\n古びた教会のような場所に、手がかりとなるようなものはなく、私はただ傍らにいる、おびえた少女を抱きしめ、励ましながら、自らの不安を払うのが精一杯だった。","add",function()
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
   timeOut = 2000;
   startTime = getTimer();
   this.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"\n\nだから私はあの時の少女の変化に気づけなかった。そう、ジン・ウヅキの名を聞いた少女の表情の変化を———","add",function()
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
_root.makeWindow(this,26,21,220,234,1);
txt1();
