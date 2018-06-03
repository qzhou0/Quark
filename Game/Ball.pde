class Ball {
  float xpos;
  float ypos;
  float xvel;
  float yvel;
  float radius;
  
  Ball(){
   xpos = 520;
   ypos = 700;
   xvel = 0;
   yvel = -5;
   radius = 7.5;
  }
  
  void move() {
    if (xvel > 30) xvel = 30; //Speed limits
    else if (xvel < -30) xvel = 30;
    if (yvel > 30) yvel = 30;
    else if (yvel < -30) yvel = -30;
    ellipse(xpos,ypos,radius*2,radius*2);
    fill(color(255,0,0));
    if (ypos + yvel + radius > 800 || ypos + yvel - radius < 0) {yvel = -3 * yvel / 4;}
    if (xpos + xvel - radius < 0 || xpos + xvel + radius > 600) {xvel = -xvel;}
    xpos += xvel;
    ypos += yvel;
    yvel += 4.905/60;
  }
}
