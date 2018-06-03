abstract class Obstacle {
  float xpos;
  float ypos;
  float size;
  
  abstract boolean inContact(Ball other);//Returns true if Obstacle is in contact with ball
}
