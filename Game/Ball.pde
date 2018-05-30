class Ball {
  float xpos;
  float ypos;
  float xvel;
  float yvel;
  
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