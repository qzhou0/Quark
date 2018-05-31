import java.util.ArrayList;
ArrayList<Obstacle> ob  = new ArrayList<Obstacle>();
Ball b;
int points;
int numBalls = 5;
Flipper left,right;

void setup() {
  frameRate(60);
  background(255,0,0);
  size(600,800);
  b = new Ball();
  left = new Flipper(260,750,330);
  right = new Flipper(340,750,210);
}

void draw() {
  createField();
  
  left.move();right.move();
  b.move();
}


void createField(){
   background(0);
   for(int i=0;i<ob.size();i++){
     Obstacle temp = ob.get(i);
     if(temp instanceof Bumper){
       ellipse(temp.xpos,temp.ypos,temp.size*2,temp.size*2);
     }
     else if(temp instanceof Wall){
       rect(temp.xpos,temp.ypos,temp.size,temp.size*2);
     }
   }
   fill(color(0,255,0));
}