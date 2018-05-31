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