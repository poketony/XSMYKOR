function txt1()
{
   timeOut = 1000;
   startTime = getTimer();
   this.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"ミズラヒ女史はヴェクターへの干渉はするべきではないといった。それは彼女の立場からすれば当然の判断であり、彼女を責めることなどできはしない。だが、私もあきらめるわけにはいかなかった。残された可能性にかけるため、私は決心した。","reset",function()
         {
            _root.mov10.txt2();
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
         this.gotoAndPlay(50);
         _root.talk(this,50,"\n\nシオンと少女を助けるという私の気持ちに迷いはなかった。ただ一つ気がかりなのが、あの時の少女の怯えであった。少女は、確かに私を見つめていた。あの日初めて出会った時と同じ表情で———。","add",function()
         {
            _root.mov10.last();
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
_root.makeWindow(this,-92,-120,180,230,1);
txt1();
