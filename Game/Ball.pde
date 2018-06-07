class Ball {
  float xpos;
  float ypos;
  float xvel;
  float yvel;
  float radius;
  
  Ball(){
   xpos = 500;
   ypos = 50;
   xvel = 0;
   yvel = 0;
   radius = 7.5;
  }
  
  void move() {
    if (xvel > 10) xvel = 10; //Speed limits
    else if (xvel < -10) xvel = 10;
    if (yvel > 10) yvel = 10;
    else if (yvel < -10) yvel = -10;
    
    ellipse(xpos,ypos,radius*2,radius*2);
    fill(color(255,0,0));
    if (ypos + yvel - radius < 0) {yvel = -3 * yvel / 8;}
    if (xpos + xvel - radius < 0 || xpos + xvel + radius > 600) {xvel = -3 * xvel / 8;}
    xpos += xvel;
    ypos += yvel;
    yvel += 4.905/60;
  }
}
