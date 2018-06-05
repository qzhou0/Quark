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
         else if (m1 > 0 && m2 > 0) ang = -atan(m1) + atan(m2);
         else ang = atan(m1) + atan(m2);
         //else ang = atan(m1) + atan(m2);
         float vel = pow( pow(other.xvel,2) + pow(other.yvel,2) , .5 );
         System.out.println((ang/PI * 180) + " " + vel);
         other.xvel = vel * cos(ang);
         other.yvel = vel * sin(ang);
       }
   }
   
  boolean inContact(Ball o){
    if (xpos == xpoint2) return (abs(o.xpos - xpos) < o.radius);
    float m = (ypoint2 - ypos)/(xpoint2-xpos);
    float a = -m;
    float b = 1;
    float c = - (ypos - m*xpos);
    //float b = ypos - m*xpos;
    return abs(a * (o.xpos + o.xvel) + b * (o.ypos + o.yvel) + c) / pow(pow(a,2) + pow(b,2),.5) < o.radius;
    //return abs(m*o.xpos + b-o.ypos)/Math.pow(Math.pow(m,2)+1,.5)<o.radius||
    //       abs(m*(o.xpos + o.xvel) + b-o.ypos-o.yvel)/Math.pow(Math.pow(m,2)+1,.5)<o.radius;       
   
  }
  
}
