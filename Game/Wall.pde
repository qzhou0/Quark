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
         float m1 = other.yvel/other.xvel;
         float m2 = (ypos-ypoint2)/(xpos-xpoint2);
         System.out.println("Collide" + coll);
         coll++;
         float ang;
         if (other.xvel == 0) {
           ang = PI / 2;
         }
         else if (m1 > 0 && m2 < 0) ang = -atan(m1) + atan(m2);
         else if (m1 < 0 && m2 < 0) ang = -PI + atan(m2) - atan(m1);
         else if (m1 < 0 && m2 > 0) ang = -PI -atan(m1) + atan(m2);
         else ang = atan(m2) - atan(m1);
         //else ang = atan(m1) + atan(m2);
         float vel = pow( pow(other.xvel,2) + pow(other.yvel,2) , .5 );
         System.out.println((ang/PI * 180) + " " + vel);
         other.xvel = vel * cos(ang);
         other.yvel = vel * sin(ang);
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
