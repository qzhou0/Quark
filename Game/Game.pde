import java.util.ArrayList;
ArrayList<Obstacle> ob  = new ArrayList<Obstacle>();
Ball b;
int points;
int numBalls = 5;

void setup() {
  background(0);
  size(600,800);
  b = new Ball();
}

void draw() {
  createField();
  b.move();
  ellipse(b.xpos,b.ypos,b.size*2,b.size*2);
  fill(color(0,0,0,255));
}


void createField(){
   background(0);
   for(int i=0;i<ob.size();i++){
     Obstacle temp = ob.get(i);
     if(temp instanceof Bumper){
       ellipse(temp.xpos,temp.ypos,temp.size*2,temp.size*2);
     }
     else if(temp instanceof Kicker){
       rect(temp.xpos,temp.ypos,temp.size,temp.size*2);
     }
     else{
       
     }
   }
   fill(color(255,0,0,0));
}

void gravity(){
 
 
}