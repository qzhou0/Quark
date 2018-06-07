class Bumper extends Obstacle{
   Bumper(float xloc, float yloc, float r){
     xpos = xloc;
     ypos = yloc;
     size = r;
   }
   
   boolean inContact(Ball other){
     return (Math.pow(Math.pow(other.xpos + other.xvel -xpos,2) + Math.pow(other.ypos + other.yvel -ypos,2),.5) <
            (other.radius + size)) ||
            (Math.pow(Math.pow(other.xpos -xpos,2) + Math.pow(other.ypos -ypos,2),.5) <
            (other.radius + size));
  }
   
   void bounce(Ball other){
     if(inContact(other)){
       //Reflection1 Example on Processing.org
       float speed = pow( pow(other.xvel,2) + pow(other.yvel,2) , .5 );
       PVector velocity = new PVector(other.xvel,other.yvel);
       PVector incidence = PVector.mult(velocity,-1);
       incidence.normalize();
         
       PVector normal = new PVector(-(ypos - other.ypos),xpos-other.xpos);
       normal.normalize();
         
       float dot = incidence.dot(normal);
       velocity.set(2*normal.x*dot - incidence.x, 2*normal.y*dot - incidence.y,0);
       velocity.mult(speed + 2);
         
       other.xvel = velocity.x;
       other.yvel = velocity.y;
         
       other.xpos += other.xvel;
       other.yvel += other.yvel;
     }
   }
  
}
