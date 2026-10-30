function init()
{
   _visible = false;
   txtBox._width = W - W / 10 - 5;
   if(flg == 0)
   {
      txtBox._height = H - 10;
   }
   else
   {
      txtBox._height = H - 30;
   }
   b_up._x = W - 15;
   b_up._y = H - 12;
   b_down._x = W - 35;
   b_down._y = H - 12;
   b_up._visible = false;
   b_down._visible = false;
   base._width = W;
   base._height = H;
   base._x = W / 2;
   base._y = H / 2;
   k1._x = 0;
   k1._y = 0;
   k2._x = W;
   k2._y = 0;
   k3._x = W;
   k3._y = H;
   k4._x = 0;
   k4._y = H;
   enter();
}
function enter()
{
   var _loc1_ = this;
   base.defW = base._width;
   base.defH = base._height;
   base._width -= 30;
   base._height -= 30;
   base._alpha = 0;
   k1.defX = k1._x;
   k1.defY = k1._y;
   k1._x += 20;
   k1._y += 20;
   k2.defX = k2._x;
   k2.defY = k2._y;
   k2._x -= 20;
   k2._y += 20;
   k3.defX = k3._x;
   k3.defY = k3._y;
   k3._x -= 20;
   k3._y -= 20;
   k4.defX = k4._x;
   k4.defY = k4._y;
   k4._x += 20;
   k4._y -= 20;
   _visible = true;
   i = 1;
   while(i <= 4)
   {
      _loc1_["k" + i].onEnterFrame = function()
      {
         var _loc1_ = this;
         _loc1_._x += (_loc1_.defX - _loc1_._x) / 2;
         _loc1_._y += (_loc1_.defY - _loc1_._y) / 2;
         if(Math.abs(_loc1_.defX - _loc1_._x) < 1 && Math.abs(_loc1_.defY - _loc1_._y) < 1)
         {
            _loc1_._x = _loc1_.defX;
            _loc1_._y = _loc1_.defY;
            trace("this._x=" + _loc1_._x);
            trace("this._y=" + _loc1_._y);
            delete _loc1_.onEnterFrame;
         }
      };
      i++;
   }
   timeOut = 200;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      var _loc1_ = this;
      if(getTimer() > startTime + timeOut)
      {
         base.onEnterFrame = function()
         {
            var _loc1_ = this;
            _loc1_._width += (_loc1_.defW - _loc1_._width) / 2;
            _loc1_._height += (_loc1_.defH - _loc1_._height) / 2;
            _loc1_._alpha += (80 - _loc1_._alpha) / 3;
            if(Math.abs(_loc1_.defW - _loc1_._width) < 1 && Math.abs(_loc1_.defH - _loc1_._height) < 1)
            {
               _loc1_._width = _loc1_.defW;
               _loc1_._height = _loc1_.defH;
               _loc1_._alpha = 80;
               _loc1_.bk.gotoAndPlay(2);
               delete _loc1_.onEnterFrame;
            }
         };
         delete _loc1_.onEnterFrame;
      }
   };
}
function scrollCheck()
{
   var _loc1_ = this;
   if(flg != 0)
   {
      if(_loc1_.txtBox.scroll < _loc1_.txtBox.maxscroll)
      {
         b_down._visible = true;
      }
      else
      {
         b_down._visible = false;
         delete _loc1_.onEnterFrame;
      }
      if(_loc1_.txtBox.scroll > 1)
      {
         b_up._visible = true;
      }
      else
      {
         b_up._visible = false;
         delete _loc1_.onEnterFrame;
      }
   }
}
function scrollEngine(updown)
{
   var _loc1_ = this;
   if(updown == "up")
   {
      sSpeed = -1;
   }
   else
   {
      sSpeed = 1;
   }
   _loc1_.txtBox.scroll += sSpeed;
   scrollCheck();
   sSound.start();
   timeOut = 200;
   startTime = getTimer();
   _loc1_.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         this.txtBox.scroll += sSpeed;
         scrollCheck();
         sSound.start();
         startTime = getTimer();
      }
   };
}
function leave()
{
   var _loc1_ = this;
   b_up._visible = false;
   b_down._visible = false;
   _loc1_.txtBox.text = "";
   delete _loc1_.mcTalk.onEnterFrame;
   _loc1_.onEnterFrame = function()
   {
      _alpha = _alpha + (- _alpha) / 4;
      if(_alpha < 5)
      {
         this.removeMovieClip();
      }
   };
}
sSound = new Sound(this);
sSound.attachSound("scrollsound");
sSound.setVolume(5);
sSound.stop();
init();
