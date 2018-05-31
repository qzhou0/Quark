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
     if(this.inContact(other)){
        float ang = PI - atan(other.yvel/other.xvel);
        float vel = tan(ang) + 0.1;
        other.xvel = vel * cos(ang);
        other.yvel = vel * sin(ang);
        points++;
     }
   }
   
  boolean inContact(Ball other){
    float a = ypoint2 - ypos;
    float b = xpoint2 - xpos;
    float c = xpoint2*ypos + ypoint2*xpos;
    return (((a*other.xpos)+(b*other.ypos)+c)
           /(Math.pow(Math.pow(a,2)+Math.pow(b,2),0.5)))< other.radius;
  }
  
}
