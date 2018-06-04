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
    else if(flipperState == 1){flipperState = 2;F=30;}
  }
  //contact mechanism
  boolean inContact(Ball o){
    /*float dist = (float)Math.pow(Math.pow(o.xpos-xpos,2)+
                                 Math.pow(o.ypos-ypos,2)  ,.5);
    float x1x0=atan((ypos-o.ypos)/(xpos-o.xpos));
    if((dist<size&&
        x1x0<=angle%(2*PI)+(PI/9)&&
        x1x0>=angle%(2*PI)-(PI/9))||
       dist<size*.2)
       //atan((xpos-o.xpos)/(ypos-o.ypos))-(PI/36))<=angle)
       return true;*/
   
    if (o.ypos<720||o.ypos>785) return false;
    if (orientation&&o.xpos<xpos||
        !orientation&&o.xpos>xpos) return false;
    float m,b;
    m=atan(angle);
    b=ypos-m*xpos;
    
    return abs(m*o.xpos+b-o.ypos)/Math.pow(Math.pow(m,2)+1,.5)<3*o.radius||
           abs(m*(o.xpos+o.xvel)+b-o.ypos-o.yvel)/Math.pow(Math.pow(m,2)+1,.5)<2*o.radius;
    /*float dist = (float)Math.pow(Math.pow(o.xpos-xpos,2)+
                                 Math.pow(o.ypos-ypos,2)  ,.5);
    float x1x0=atan((ypos-o.ypos)/(xpos-o.xpos));

    if(dist<size){
        if(orientation && (angle+(PI/9))%2*PI>0){
          return x1x0<=(angle+(PI/9))%2*PI||x1x0>=(angle-(PI/9))%2*PI;
        }
        else if(dist<size*.2){return true;}
        else{
          return (x1x0<=(angle+(PI/9))%2*PI&&x1x0>=(angle-(PI/9))%2*PI);
        }
       //dist<size*.2)
    }
       //atan((xpos-o.xpos)/(ypos-o.ypos))-(PI/36))<=angle)
       //return true;
    return false;*/
  }
  void bounce(Ball o){
  
    if(inContact(o)){
        //reflect algo from wall
        float ang = (angle - atan(o.yvel/o.xvel));//angle of incidence
        float vel = tan(ang) ;
        
        float g =4.905/60;//acceleration due to gravity
        float betha = PI + angle;
        float norm=g*cos(betha);
        
        float normal;
        int distance = (int)Math.pow( 
                                        Math.pow((o.ypos-ypos),2)+
                                        Math.pow((o.ypos-xpos),2)  ,.5)/10;
       
        if (orientation)
          normal = angle+90;
        else normal = angle-90;
        /*o.xvel = cos(ang)*vel+F*cos(normal)*distance;
        o.yvel = sin(ang)*vel+F*sin(normal)*distance;
        */
        /*o.xvel = -o.xvel+cos(-angle)*norm+F*cos(normal)*distance;
        o.yvel = (-3 * o.yvel / 4)+sin(-angle)*norm+F*sin(normal)*distance;
        */
        
        o.xvel = -o.xvel+norm*F*cos(normal)*distance;
        o.yvel=(-3*o.yvel/4)-norm*F*sin(normal)*distance;
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
