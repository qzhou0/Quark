class Flipper {
  
  int flipperState=1;
  //1 = normal; 2=up, 3=top, 4=falling down, 
  //3 might be needed to prevent it from falling down if the user does not let go of key?
  int size = 70;//?
  
  int xpos,ypos;
  float angle;//original 210 and 330
  boolean orientation; //true = left, false = left; to faciliate angle addition/subtraction
  
  Flipper(int x, int y, float th){
    angle = th;
    xpos = x;
    ypos = y;
    if (th == 330){orientation = false;}
    else if (th ==210){orientation = true;}
  }

  void move(){
    
    fill(color(0,255,0));
    line(xpos, ypos, xpos+size*cos(angle), ypos+size*sin(angle));
    //triangle(xpos+5*cos(angle), ypos+5*cos(angle),
    //         xpos-5*cos(angle), ypos-5*cos(angle),
      //       xpos+size*cos(angle), ypos+size*sin(angle));
    if (flipperState==3){//maybe allow user to keep pressing signifyer for up? 
      flipperState = 4;//change state if at top to falling
    }
    else if (flipperState==2||flipperState ==4){
      //flipperState update
      if (angle ==30||angle == 150) flipperState=3;
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