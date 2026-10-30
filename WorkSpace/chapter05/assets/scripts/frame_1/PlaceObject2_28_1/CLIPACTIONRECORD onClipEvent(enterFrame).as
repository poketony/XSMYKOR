onClipEvent(enterFrame){
   par = parseInt(_root.getBytesLoaded() / _root.getBytesTotal() * 100);
   if(par == 0)
   {
      par = 1;
   }
   else if(par >= 100)
   {
      par = 100;
      _root.gotoAndPlay("start");
   }
   bar._xscale = par;
}
