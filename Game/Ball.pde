class Ball {
  float xpos;
  float ypos;
  float xvel;
  float yvel;
  float radius;
  
  Ball(){
   xpos = 300;
   ypos = 400;
   xvel = 0;
   yvel = 0;
   radius = 7.5;
  }
  
  void move() {
    if (xvel > 14) xvel = 14; //Speed limits
    else if (xvel < -14) xvel = 14;
    if (yvel > 14) yvel = 14;
    else if (yvel < -14) yvel = -14;
    
    ellipse(xpos,ypos,radius*2,radius*2);
    fill(color(255,0,0));
    if (ypos + yvel - radius < 0) {yvel = -3 * yvel / 8;}
    if (xpos + xvel - radius < 0 || xpos + xvel + radius > 600) {xvel = -3 * xvel / 8;}
    xpos += xvel;
    ypos += yvel;
    yvel += 4.905/60;
  }
}
