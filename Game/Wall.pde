class Wall extends Obstacle{
    float xpoint2;
    float ypoint2;
  
    Wall(float xloc1, float yloc1, float xloc2, float yloc2){
      xpos = xloc1;
      ypos = yloc1;
      xpoint2 = xloc2;
      ypoint2 = yloc2;
    }
    
   void reflect(Ball other){
       if(other.xpos>=600 ||other.xpos<=0||this.inContact(other)){
        float ang = PI - atan((other.ypos - ypos)/(other.xpos - xpos));
        if (other.xpos > xpos) ang = PI - ang;
        if (other.ypos > ypos) ang = -ang;
        float vel = pow( pow(other.xvel,2) + pow(other.yvel,2) , .5 ) + 3;
        other.xvel = vel * cos(ang);
        other.yvel = vel * sin(ang);
       }
   }
   
  boolean inContact(Ball o){
    float m = (ypoint2 - ypos)/(xpoint2-xpos);
    float b = ypos - m*xpos;
    return abs(m*o.xpos + b-o.ypos)/Math.pow(Math.pow(m,2)+1,.5)<3*o.radius||
           abs(m*(o.xpos + o.xvel) + b-o.ypos-o.yvel)/Math.pow(Math.pow(m,2)+1,.5)<2*o.radius;       
   
  }
  
}
