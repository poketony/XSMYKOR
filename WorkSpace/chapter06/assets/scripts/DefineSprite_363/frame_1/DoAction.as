function startBGM(num1, num2)
{
   var _loc1_ = this;
   delete _loc1_.onEnterFrame;
   if(num1 != _loc1_.sID)
   {
      _loc1_.sID = num1;
      _loc1_.stopBGM();
      _loc1_.setBgmVolume(num2);
      _loc1_["bgmSound" + sID].start(0,1000);
   }
}
function stopBGM()
{
   var _loc1_ = this;
   i = 1;
   while(i <= 9)
   {
      _loc1_["bgmSound" + i].stop();
      i++;
   }
}
function setBgmVolume(num)
{
   var _loc1_ = this;
   _loc1_.nowVolume = num;
   i = 1;
   while(i <= 9)
   {
      _loc1_["bgmSound" + i].setVolume(_loc1_.nowVolume);
      i++;
   }
}
function fadeOutBGM(num)
{
   var _loc1_ = this;
   _loc1_.fadeSpeed = num;
   _loc1_.onEnterFrame = function()
   {
      var _loc1_ = this;
      _loc1_.nowVolume -= fadeSpeed;
      trace("this.nowVolume=" + _loc1_.nowVolume);
      _loc1_.setBgmVolume(_loc1_.nowVolume);
      if(_loc1_.nowVolume <= 0)
      {
         _loc1_.stopBGM();
         delete _loc1_.onEnterFrame;
      }
   };
}
function fadeInBGM(num, num2)
{
   var _loc1_ = this;
   _loc1_.opVolume = num2;
   _loc1_.fadeSpeed = num;
   _loc1_.onEnterFrame = function()
   {
      var _loc1_ = this;
      _loc1_.nowVolume += fadeSpeed / 5;
      trace("this.nowVolume=" + _loc1_.nowVolume);
      _loc1_.setBgmVolume(_loc1_.nowVolume);
      if(_loc1_.nowVolume >= opVolume)
      {
         delete _loc1_.onEnterFrame;
      }
   };
}
this.createEmptyMovieClip("soundmc",98765);
bgmSound1 = new Sound(soundmc);
bgmSound1.attachSound("M00");
