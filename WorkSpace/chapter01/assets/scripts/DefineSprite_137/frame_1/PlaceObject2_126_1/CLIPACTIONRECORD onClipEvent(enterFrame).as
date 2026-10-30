onClipEvent(enterFrame){
   this._x += (xPos[a] - this._x) / 7;
   this._y += (yPos[a] - this._y) / 7;
   var nCurrentTime = getTimer();
   if(nCurrentTime >= nStart + nDuration)
   {
      _parent.nextFrame();
   }
}
