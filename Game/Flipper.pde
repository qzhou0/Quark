class Flipper {
  
  int flipperState=1;
  //1 = normal; 2=up, 3=top, 4=falling down, 
  //3 might be needed to prevent it from falling down if the user does not let go of key?
  int size = 70;//?
  
  int xpos,ypos;
  float angle;//original 210, 7*PI/6 and 330 11PI/6
  boolean orientation; //true = left, false = left; to faciliate angle addition/subtraction
  float F;//force??? maybe?
  Flipper(int x, int y, float th){
    angle = th;
    xpos = x;
    ypos = y;
    if (th == 11*PI/6){orientation = true;}
    else if (th == 7*PI/6){orientation = false;}
  }

  void move(){
    strokeWeight(5);
    //fill(color(0,255,0));
    stroke(0, 255,0);
   
    line(xpos, ypos, xpos+size*cos(angle), ypos-size*sin(angle));
 
    stroke(0);
    strokeWeight(1);
    //triangle(xpos+5*cos(angle), ypos+5*cos(angle),
    //         xpos-5*cos(angle), ypos-5*cos(angle),
      //       xpos+size*cos(angle), ypos+size*sin(angle));
    if (flipperState==3){//maybe allow user to keep pressing signifyer for up? 
      flipperState = 4;//change state if at top to falling
    }
    else if (flipperState==2){
      if(orientation){
        if(angle % (2*PI) >=PI/6 && angle%(2*PI)<PI/4){
          flipperState=3;
          F=0;
        }
        else{
          F-=5;  
          angle+=PI/18;
      }
      }
      else{
        if(angle <=5*PI/6){
          flipperState=3;
          F=0;
        }
        else{
          F-=5;
          angle-=PI/18;
      }
      }
        /*
      //flipperState update
      if (angle >=PI/6||angle == 5*PI/6) flipperState=3;
      //angle change
      if (orientation){angle-=PI/18;}//subject to change?
      else{angle+=PI/18;}*/
    }
    else if (flipperState ==4){
      if(orientation){
        if(angle % 360 <=11*PI/6 &&angle%2*PI>3*PI/4){
          flipperState=1;
          F=0;
        }
        else{angle-=PI/18;}
      }
      else{
        if(angle >=7*PI/6){
          flipperState=1;
          F=0;
        }
        else{angle+=PI/18;}
      }
    
      /*//flipperState update
      if(angle == 11*PI/6 || angle == 7*PI/6) flipperState = 1;
      //angle increments
      if (orientation){angle +=PI/18;}
      else{angle -=PI/18;}
      }*/
    }
    //else if(flipperState == 1){flipperState = 2;F=30;}
  }
  //contact mechanism
  boolean inContact(Ball o){
    float dist = (float)Math.pow(Math.pow(o.xpos-xpos,2)+
                                 Math.pow(o.ypos-ypos,2)  ,.5);
    if((dist<size&&
        atan((ypos-o.ypos)/(xpos-o.xpos))<=angle%(2*PI)+(PI/9)&&
        atan((ypos-o.ypos)/(xpos-o.xpos))>=angle%(2*PI)-(PI/9))||
       dist<size*.2)
       //atan((xpos-o.xpos)/(ypos-o.ypos))-(PI/36))<=angle)
       return true;
    return false;
  }
  void bounce(Ball o){
  
    if(inContact(o)){
        //reflect algo from wall
        float ang = angle - atan(o.yvel/o.xvel);//angle of incidence
        float vel = tan(ang) ;
        
        float normal;
        float distance = (float)Math.pow( 
                                        Math.pow((o.ypos-ypos),2)+
                                        Math.pow((o.ypos-xpos),2)  ,.5);
        
        if (orientation)
          normal = angle+90;
        else normal = angle-90;
        o.xvel = cos(ang)*vel+F*cos(normal)*distance;
        o.yvel = sin(ang)*vel+F*sin(normal)*distance;
        points++;
        
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
