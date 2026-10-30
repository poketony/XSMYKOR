function randomInt(maxNum)
{
   var _loc1_ = Math.random() * maxNum;
   if(_loc1_ == 0)
   {
      _loc1_ = 1;
   }
   else
   {
      _loc1_ = Math.ceil(_loc1_);
   }
   return _loc1_;
}
function stopTimer(trg, sec, callback)
{
   var _loc1_ = this;
   target = trg;
   target.createEmptyMovieClip("mcTimer",target.getNextHighestDepth() + 9999);
   target.mcTimer.timeOut = sec;
   target.mcTimer.startTime = getTimer();
   target.mcTimer.onEnterFrame = function()
   {
      var _loc1_ = this;
      if(getTimer() > _loc1_.startTime + _loc1_.timeOut)
      {
         callback();
         _loc1_.removeMovieClip();
      }
   };
}
function makeWindow(trg, X, Y, wnum, hnum, sflg)
{
   w = wnum;
   h = hnum;
   flg = sflg;
   target = trg;
   mc = target.attachMovie("txtBox","txtBox",target.getNextHighestDepth());
   mc._x = X;
   mc._y = Y;
   mc.W = wnum;
   mc.H = hnum;
   mc.flg = sflg;
}
function hideWindow(trg)
{
   trace("test");
   target = trg;
   target.txtBox.leave();
}
function talk(trg, delay, msg, stype, callback)
{
   var _loc1_ = this;
   trace("トーク");
   trace("msg=" + msg);
   target = trg.txtBox;
   if(stype == "reset")
   {
      target.txtBox.text = "";
   }
   mcTalk = target.createEmptyMovieClip("mcTalk",target.getNextHighestDepth());
   mcTalk.msg = msg;
   mcTalk.msgleng = target.mcTalk.msg.length;
   mcTalk.i = 0;
   mcTalk.delay = delay;
   mcTalk.timeOut = 0;
   mcTalk.startTime = getTimer();
   mcTalk.onEnterFrame = function()
   {
      var _loc1_ = this;
      if(getTimer() > _loc1_.startTime + _loc1_.timeOut)
      {
         _loc1_.mchara = _loc1_.msg.charAt(_loc1_.i);
         _loc1_._parent.txtBox.text += _loc1_.mchara;
         _loc1_._parent.txtBox.scroll = _loc1_._parent.txtBox.maxscroll;
         _loc1_.i = _loc1_.i + 1;
         if(_loc1_.i < _loc1_.msgleng)
         {
            _loc1_.timeOut = _loc1_.delay;
            _loc1_.startTime = getTimer();
         }
         else
         {
            callback();
            _loc1_.removeMovieClip();
         }
      }
   };
}
function replace(sSource, sSearch, sReplace)
{
   return sSource.split(sSearch).join(sReplace);
}
function XmlToHtml(sSource)
{
   txt = sSource;
   txt = replace(txt,"[","<");
   txt = replace(txt,"]",">");
   return txt;
}
function startBGM(num1, num2)
{
   var _loc1_ = _root;
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
   var _loc1_ = _root;
   i = 1;
   while(i <= 7)
   {
      _loc1_["bgmSound" + i].stop();
      i++;
   }
}
function setBgmVolume(num)
{
   var _loc1_ = _root;
   _loc1_.nowVolume = num;
   i = 1;
   while(i <= 7)
   {
      _loc1_["bgmSound" + i].setVolume(_loc1_.nowVolume);
      i++;
   }
}
function fadeOutBGM(num)
{
   var _loc1_ = _root;
   _loc1_.fadeSpeed = num;
   this.onEnterFrame = function()
   {
      var _loc1_ = _root;
      _loc1_.nowVolume -= fadeSpeed;
      trace("_root.nowVolume=" + _loc1_.nowVolume);
      _loc1_.setBgmVolume(_loc1_.nowVolume);
      if(_loc1_.nowVolume <= 0)
      {
         _loc1_.stopBGM();
         delete this.onEnterFrame;
      }
   };
}
stop();
_root.createEmptyMovieClip("soundmc",98765);
bgmSound1 = new Sound(soundmc);
bgmSound1.attachSound("M22");
bgmSound2 = new Sound(soundmc);
bgmSound2.attachSound("M08");
bgmSound3 = new Sound(soundmc);
bgmSound3.attachSound("M64");
bgmSound4 = new Sound(soundmc);
bgmSound4.attachSound("M06");
bgmSound5 = new Sound(soundmc);
bgmSound5.attachSound("M15");
bgmSound6 = new Sound(soundmc);
bgmSound6.attachSound("M42B");
bgmSound7 = new Sound(soundmc);
bgmSound7.attachSound("M29");
