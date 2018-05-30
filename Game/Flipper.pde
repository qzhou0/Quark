class Flipper {
  
  int flipperState=1;
  //1 = normal; 2=up, 3=falling down
  int size = 70;//?
  
  int xpos,ypos;
  float angle;//original 210 and 330
  
  flipper(int x, int y, float th){
    angle = th;
    xpos = x;
    ypos = y;
  }

  void move(){
    if (flipperState
    line(xpos, ypos, xpos+size*cos(angle), ypos+size*sin(angle));
    
  }
  float getAngle(){
    return angle;
  }
  int getState(){
    return flipperState;
  }
  void setAngle(float a){
    angle = a;
  }
  
}