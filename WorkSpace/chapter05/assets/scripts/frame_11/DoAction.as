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
   target = trg;
   target.createEmptyMovieClip("mcTimer",target.getNextHighestDepth() + 9999);
   target.mcTimer.timeOut = sec;
   target.mcTimer.startTime = getTimer();
   target.mcTimer.onEnterFrame = function()
   {
      if(getTimer() > this.startTime + this.timeOut)
      {
         callback();
         this.removeMovieClip();
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
      if(getTimer() > this.startTime + this.timeOut)
      {
         this.mchara = this.msg.charAt(this.i);
         this._parent.txtBox.text += this.mchara;
         this._parent.txtBox.scroll = this._parent.txtBox.maxscroll;
         this.i = this.i + 1;
         if(this.i < this.msgleng)
         {
            this.timeOut = this.delay;
            this.startTime = getTimer();
         }
         else
         {
            callback();
            this.removeMovieClip();
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
   delete this.onEnterFrame;
   if(num1 != _root.sID)
   {
      _root.sID = num1;
      _root.stopBGM();
      _root.setBgmVolume(num2);
      _root["bgmSound" + sID].start(0,1000);
   }
}
function stopBGM()
{
   i = 1;
   while(i <= 7)
   {
      _root["bgmSound" + i].stop();
      i++;
   }
}
function setBgmVolume(num)
{
   _root.nowVolume = num;
   i = 1;
   while(i <= 7)
   {
      _root["bgmSound" + i].setVolume(_root.nowVolume);
      i++;
   }
}
function fadeOutBGM(num)
{
   _root.fadeSpeed = num;
   this.onEnterFrame = function()
   {
      _root.nowVolume -= fadeSpeed;
      trace("_root.nowVolume=" + _root.nowVolume);
      _root.setBgmVolume(_root.nowVolume);
      if(_root.nowVolume <= 0)
      {
         _root.stopBGM();
         delete this.onEnterFrame;
      }
   };
}
function fadeInBGM(num, num2)
{
   _root.opVolume = num2;
   _root.fadeSpeed = num;
   this.onEnterFrame = function()
   {
      _root.nowVolume += fadeSpeed / 5;
      trace("_root.nowVolume=" + _root.nowVolume);
      _root.setBgmVolume(_root.nowVolume);
      if(_root.nowVolume >= opVolume)
      {
         delete this.onEnterFrame;
      }
   };
}
stop();
_root.createEmptyMovieClip("soundmc",98765);
bgmSound1 = new Sound(soundmc);
bgmSound1.attachSound("M04");
bgmSound2 = new Sound(soundmc);
bgmSound2.attachSound("M08");
bgmSound3 = new Sound(soundmc);
bgmSound3.attachSound("M31");
bgmSound4 = new Sound(soundmc);
bgmSound4.attachSound("M47");
bgmSound5 = new Sound(soundmc);
bgmSound5.attachSound("M40");
bgmSound6 = new Sound(soundmc);
bgmSound6.attachSound("M30");
bgmSound7 = new Sound(soundmc);
bgmSound7.attachSound("M01");
bgmSound8 = new Sound(soundmc);
bgmSound8.attachSound("M33");
bgmSound9 = new Sound(soundmc);
bgmSound9.attachSound("M65");
