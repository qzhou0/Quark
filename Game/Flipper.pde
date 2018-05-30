class Flipper {
  
  int flipperState=1;
  //1 = normal; 2=up, 3=top, 4=falling down, 
  //3 might be needed to prevent it from falling down if the user does not let go of key?
  int size = 70;//?
  
  int xpos,ypos;
  float angle;//original 210 and 330
  boolean orientation; //true = left, false = left; to faciliate angle addition/subtraction
  
  flipper(int x, int y, float th){
    angle = th;
    xpos = x;
    ypos = y;
  }

  void move(){
    if (flipperState==3){//maybe allow user to keep pressing signifyer for up? 
      flipperState = 4;//change state if at top to falling
    }
    else if (flipperState==2||flipperState ==4){
      
      if ((angle >330||angle < 30)||(angle < 210&&angle>180)){//make new angle
        line(xpos, ypos, xpos+size*cos(angle), ypos+size*sin(angle));
      }
      //flipperState update
      else if (angle ==30||angle == 150) flipperState=3;
      else if(angle == 330 || angle == 210) flipperState = 1;
      //angle increments
      if (flipperState==2) {
        if (orientation){angle-=15;}//subject to change?
        else{angle+=15;}
      }
      else if (flipperState==4){
        if (orientation){angle +=15;}
        else{angle -=15;}
      }
      
    }
    
    
  }
  //accessors
  float getAngle(){
    return angle;
  }
  int getState(){
    return flipperState;
  }
  //mutators
  void setState(int s){
    flipperState = s;
  }

  
}
