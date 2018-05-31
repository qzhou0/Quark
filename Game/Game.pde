import java.util.ArrayList;
ArrayList<Bumper> bump  = new ArrayList<Bumper>();
ArrayList<Wall> wall = new ArrayList<Wall>();
Ball b;
int points;
int numBalls = 5;
Flipper left,right;

void setup() {
  frameRate(60);
  background(255,0,0);
  size(600,800);
  b = new Ball();
  left = new Flipper(280,750,280);
  right = new Flipper(320,750,50);
  designField();
}

void draw() {
    createField();
    left.move();
    right.move();
    b.move();
   for(Bumper temp:bump)
       temp.bounce(b);
   for(Wall temp:wall)
       temp.reflect(b);
}


void createField(){
   background(255,0,0);
   for(Bumper temp:bump)
       ellipse(temp.xpos,temp.ypos,temp.size*2,temp.size*2);
   for(Wall temp:wall)
       line(temp.xpos,temp.ypos,temp.xpoint2,temp.ypoint2);
   fill(color(0,255,0));
   strokeWeight(3);
}

void designField(){
   bump.add(new Bumper(500,600,20)); 
   wall.add(new Wall(400,600,450,600));
}
