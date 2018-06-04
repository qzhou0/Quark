class Ball {
  float xpos;
  float ypos;
  float xvel;
  float yvel;
  float radius;
  
  Ball(){
   xpos = 520;
   ypos = 50;
   xvel = 0;
   yvel = -1;
   radius = 7.5;
  }
  
  void move() {
    if (xvel > 15) xvel = 15; //Speed limits
    else if (xvel < -15) xvel = 15;
    if (yvel > 15) yvel = 15;
    else if (yvel < -15) yvel = -15;
    
    ellipse(xpos,ypos,radius*2,radius*2);
    fill(color(255,0,0));
    if (ypos + yvel + radius > 800 || ypos + yvel - radius < 0) {yvel = -3 * yvel / 4;}
    if (xpos + xvel - radius < 0 || xpos + xvel + radius > 600) {xvel = -xvel;}
    xpos += xvel;
    ypos += yvel;
    yvel += 4.905/60;
  }
}
