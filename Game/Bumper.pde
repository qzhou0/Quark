class Bumper extends Obstacle{
   Bumper(float xloc, float yloc, float r){
     xpos = xloc;
     ypos = yloc;
     size = r;
   }
   
   void bounce(Ball other){
     if(inContact(other)){
        float ang = PI - atan(other.yvel/other.xvel);
        float vel = tan(ang);
        other.xvel = vel * cos(ang);
        other.yvel = vel * sin(ang);
        points++;
     }
   }
  
}
