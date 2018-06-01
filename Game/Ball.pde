<<<<<<< HEAD
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
   radius = 5;
  }
  
  void move() {
    ellipse(xpos,ypos,radius*2,radius*2);
    fill(color(255,0,0));
    if (ypos + yvel + radius > 800) {yvel = -3 * yvel / 4;}
    if (xpos + xvel - radius < 0 || xpos + xvel + radius > 600) {xvel = -xvel;}
    xpos += xvel;
    ypos += yvel;
    yvel += 4.905/60;
  }
  
  boolean contact(Object other) {
    if (other instanceof Flipper) {
      
    }
    else if (other instanceof Obstacle) {
      
    }
    return false;
  }
  
  void bump(Object other) {
    if (other instanceof Flipper) {
      
    }
    else if (other instanceof Obstacle) {
      
    }
  }
}
=======
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
>>>>>>> 9b1cf84ba995064591bcf8b672425a0a2432918d
