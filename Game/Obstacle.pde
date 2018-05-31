abstract class Obstacle {
  float xpos;
  float ypos;
  float size;
  
  boolean inContact(Ball other){
     return (Math.pow(Math.pow(other.xpos-xpos,2) + Math.pow(other.ypos-ypos,2),.5) <
            (other.size + size) / 2);
  }
}
