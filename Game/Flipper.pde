class Flipper {
  
  int flipperState=1;
  //1 = normal; 2=up, 3=top, 4=falling down, 
  //3 might be needed to prevent it from falling down if the user does not let go of key?
  int size = 70;//?
  int col=0;
  int xpos,ypos;
  float xpos2,ypos2;
  float angle;//original 210, 7*PI/6 and 330 11PI/6
  boolean orientation; //true = left, false = left; to faciliate angle addition/subtraction
  float F;//force??? maybe?
  
  Flipper(int x, int y, float th){
    angle = th;
    xpos = x;
    ypos = y;
    xpos2 = xpos+size*cos(angle);
    ypos2 = ypos-size*sin(angle);
    if (th == 11*PI/6){orientation = true;}
    else if (th == 7*PI/6){orientation = false;}
  }

  void move(){
    strokeWeight(5);
    stroke(0, 0,0);
    xpos2=xpos+size*cos(angle);
    ypos2=ypos-size*sin(angle);
    line(xpos, ypos, xpos2,ypos2);
    stroke(0);
    strokeWeight(1);
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
    }
  }
  
  //contact mechanism
  boolean inContact(Ball o){
    if(orientation){
      if(o.xpos>xpos2||o.xpos<xpos)return false;
    }
    else{if (o.xpos<xpos2||o.xpos>xpos)return false;}
    
    float m,b;
    m=(ypos-ypos2)/(xpos-xpos2);
    b=ypos-m*xpos;
    strokeWeight(3);

    line(xpos,ypos, xpos2,xpos2*m+b);
    strokeWeight(1);
    return abs(m*o.xpos+b-o.ypos)/Math.pow(Math.pow(m,2)+1,.5)<o.radius;
  }
  
  void bounce(Ball o){  
    if(inContact(o)){
        //reflect algo from wall
        System.out.println("Collide "+col+" " + o.xpos+","+o.ypos);
        col++;

        float ang = angle+PI/2-(atan(o.yvel/o.xvel)-(angle+PI/2));

        float g =4.905/60;//acceleration due to gravity
        float betha = PI + angle;
        float norm=g*cos(betha);
        strokeWeight(3);

    
        strokeWeight(1);
        float normal;
        int distance = (int)Math.pow(Math.pow((o.ypos-ypos),2)+Math.pow((o.ypos-xpos),2),.5)/10;
       
        if (orientation)
          normal = (angle+PI/2)%(2*PI);//(angle+PI/2)%(2*PI);
        else normal = (angle-PI/2)%(2*PI);
        
        if(leftpress || rightpress){
          strokeWeight(10);
          line((xpos+xpos2)/2,(ypos+ypos2)/2, (xpos2+xpos)/2+100*cos(normal),(ypos2+ypos)/2-100*sin(normal));
          stroke(0,255,0);
          line((xpos+xpos2)/2,(ypos+ypos2)/2, (xpos2+xpos)/2+100*cos(normal),(ypos2+ypos)/2);
          stroke(255,0,0);
          line((xpos+xpos2)/2,(ypos+ypos2)/2, (xpos2+xpos)/2,(ypos2+ypos)/2-100*sin(normal));
          System.out.print((normal*180)%(360));
        }
        
        float vel = (float)Math.pow(Math.pow(o.xvel,2)+Math.pow(o.yvel,2),.5);
        float x = o.xvel-tan(angle)/abs(tan(angle))*F*sin(normal)*distance;
        o.xvel =tan(angle)/abs(tan(angle))*o.yvel+tan(angle)/abs(tan(angle))*F*cos(normal)*distance;
        o.yvel = -abs(x);
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