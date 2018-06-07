class Wall extends Obstacle{
  float coll;
    float xpoint2;
    float ypoint2;
  
    Wall(float xloc1, float yloc1, float xloc2, float yloc2){
      coll = 0;
      xpos = xloc1;
      ypos = yloc1;
      xpoint2 = xloc2;
      ypoint2 = yloc2;
    }
    
   void reflect(Ball other){
       if(this.inContact(other)){
         //Reflection1 Example on Processing.org
         float speed = pow( pow(other.xvel,2) + pow(other.yvel,2) , .5 );
         PVector velocity = new PVector(other.xvel,other.yvel);
         PVector incidence = PVector.mult(velocity,-1);
         incidence.normalize();
         
         PVector normal = new PVector(-(ypos - ypoint2),xpos-xpoint2);
         normal.normalize();
         
         float dot = incidence.dot(normal);
         velocity.set(2*normal.x*dot - incidence.x, 2*normal.y*dot - incidence.y,0); //Normalized reflection vector
         velocity.mult(speed);
         
         other.xvel = velocity.x;
         other.yvel = velocity.y;
       }
   }
   
  boolean inContact(Ball o) {
    float smallX;
    float smallY;
    float bigX;
    float bigY;
    float m = -(xpoint2-xpos)/(ypoint2 - ypos);
    if (ypoint2 < ypos) { smallY = ypoint2; smallX = xpoint2; bigX = xpos; bigY = ypos; }
    else { smallY = ypos; smallX = xpos; bigX = xpoint2; bigY = ypoint2;}
    if (o.ypos + o.yvel < m*(o.xpos + o.xvel - smallX) + smallY) {
      return pow(o.ypos + o.yvel - smallY,2) + pow(o.xpos + o.xvel - smallX,2) < pow(o.radius,2);
    }
    else if (o.ypos + o.yvel > m*(o.xpos + o.xvel - bigX) + bigY) {
      return pow(o.ypos + o.yvel - bigY,2) + pow(o.xpos + o.xvel - bigX,2) < pow(o.radius,2);
    }
    if (xpos == xpoint2) return (abs(o.xpos - xpos) < o.radius);
    m = -1/m;
    float a = -m;
    float b = 1;
    float c = - (ypos - m*xpos);
    //float b = ypos - m*xpos;
    return abs(a * (o.xpos + o.xvel) + b * (o.ypos + o.yvel) + c) / pow(pow(a,2) + pow(b,2),.5) < o.radius;
    //return abs(m*o.xpos + b-o.ypos)/Math.pow(Math.pow(m,2)+1,.5)<o.radius||
    //       abs(m*(o.xpos + o.xvel) + b-o.ypos-o.yvel)/Math.pow(Math.pow(m,2)+1,.5)<o.radius;       
   
  }
  
}
