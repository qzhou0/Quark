class Bumper extends Obstacle{
   Bumper(float xloc, float yloc, float r){
     xpos = xloc;
     ypos = yloc;
     size = r;
   }
   
   boolean inContact(Ball other){
     return (Math.pow(Math.pow(other.xpos-xpos,2) + Math.pow(other.ypos-ypos,2),.5) <
            (other.radius + size));
  }
   
   void bounce(Ball other){
     if(inContact(other)){
        float ang = PI - atan((other.ypos - ypos)/(other.xpos - xpos));
        if (other.xpos > xpos) ang = PI - ang;
        if (other.ypos > ypos) ang = -ang;
        float vel = pow( pow(other.xvel,2) + pow(other.yvel,2) , .5 ) + 3;
        other.xvel = vel * cos(ang);
        other.yvel = vel * sin(ang);
        points++;
     }
   }
  
}
