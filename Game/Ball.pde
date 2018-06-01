class Ball {
  float xpos;
  float ypos;
  float xvel;
  float yvel;
  float radius;
  
  Ball(){
   xpos = 300;
   ypos = 400;
   xvel = yvel = 1;
   radius = 7.5;
  }
  
  void move() {
    ellipse(xpos,ypos,radius*2,radius*2);
    fill(color(255,0,0));
    if (ypos + yvel > 800) {yvel = -3 * yvel / 4;}
    if (xpos + xvel < 0 || xpos + xvel > 600) {xvel = -xvel;}
    xpos += xvel;
    ypos += yvel;
    yvel += 4.905/60;
  }
}