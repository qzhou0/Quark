class Ball {
  float xpos;
  float ypos;
  float xvel;
  float yvel;
  float size;
  
  Ball(){
   xpos = 300;
   ypos = 400;
   xvel = yvel = 1;
   size = 20;
  }
  
  void move() {
    xpos += xvel;
    ypos += yvel;
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
