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
      this["k" + i].onEnterFrame = function()
      {
         this._x += (this.defX - this._x) / 2;
         this._y += (this.defY - this._y) / 2;
         if(Math.abs(this.defX - this._x) < 1 && Math.abs(this.defY - this._y) < 1)
         {
            this._x = this.defX;
            this._y = this.defY;
            trace("this._x=" + this._x);
            trace("this._y=" + this._y);
            delete this.onEnterFrame;
         }
      };
      i++;
   }
   timeOut = 200;
   startTime = getTimer();
   this.onEnterFrame = function()
   {
      if(getTimer() > startTime + timeOut)
      {
         base.onEnterFrame = function()
         {
            this._width += (this.defW - this._width) / 2;
            this._height += (this.defH - this._height) / 2;
            this._alpha += (80 - this._alpha) / 3;
            if(Math.abs(this.defW - this._width) < 1 && Math.abs(this.defH - this._height) < 1)
            {
               this._width = this.defW;
               this._height = this.defH;
               this._alpha = 80;
               this.bk.gotoAndPlay(2);
               delete this.onEnterFrame;
            }
         };
         delete this.onEnterFrame;
      }
   };
}
function scrollCheck()
{
   if(flg != 0)
   {
      if(this.txtBox.scroll < this.txtBox.maxscroll)
      {
         b_down._visible = true;
      }
      else
      {
         b_down._visible = false;
         delete this.onEnterFrame;
      }
      if(this.txtBox.scroll > 1)
      {
         b_up._visible = true;
      }
      else
      {
         b_up._visible = false;
         delete this.onEnterFrame;
      }
   }
}
function scrollEngine(updown)
{
   if(updown == "up")
   {
      sSpeed = -1;
   }
   else
   {
      sSpeed = 1;
   }
   this.txtBox.scroll += sSpeed;
   scrollCheck();
   sSound.start();
   timeOut = 200;
   startTime = getTimer();
   this.onEnterFrame = function()
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
   b_up._visible = false;
   b_down._visible = false;
   this.txtBox.text = "";
   delete this.mcTalk.onEnterFrame;
   this.onEnterFrame = function()
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
