function txt1()
{
   timeOut = 1000;
   startTime = getTimer();
   this.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         _root.talk(this,50,"少女が連れ去られた直後、呆然とする私の前に現れた兄さん。","reset",function()
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
         _root.talk(this,50,"\n\n私を見つけ安堵する兄さんの顔を見た時、それまで心に重くのしかかっていた不安が消え去っていくのを感じていた。","add",function()
         {
            _root.mov10.txt3();
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
         _root.talk(this,50,"\n\nでも私はその感情を押し隠すように、いつもの調子で少女が連れ去られた事を兄さんに話そうとした時、私達の前にマクロファージの大群が出現した。","add",function()
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
   this.gotoAndPlay("end");
}
_root.makeWindow(this,26,21,220,234,1);
txt1();
