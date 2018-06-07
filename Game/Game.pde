import java.util.ArrayList;
ArrayList<Bumper> bump  = new ArrayList<Bumper>();
ArrayList<Wall> wall = new ArrayList<Wall>();
Ball b;
int points;
int numBalls = 6;
Flipper left,right;
boolean start = false;
boolean leftpress = false;
boolean rightpress = false;
PShape rectangle;

void setup() {
  frameRate(60);
  background(255,0,0);
  size(600,800);
  b = new Ball();
  left = new Flipper(220,750,11*PI/6);
  //left.setState(2);
  right = new Flipper(380,750,7*PI/6);
  designField();
}

void draw() {
   createField();
   scoreBoard();
   if(start)b.move();
   for(Bumper temp:bump)
       temp.bounce(b);
   for(Wall temp:wall)
       temp.reflect(b);
   if(leftpress)
     left.flipperState = 2;
   if(rightpress)
     right.flipperState=2;
   left.move();
   right.move();
   left.bounce(b);
   right.bounce(b);
   if(b.ypos>800)
     start = false;
   if(numBalls-1==0 && start==false){//exit if no balls are left
     background(255,255,255);
     textSize(75);
     text("GAME OVER",90,400);
     noLoop();
   }
}

void scoreBoard(){//creates and displays score board
     rectangle = createShape(RECT,175,400,250,150);
     rectangle.setFill(color(0,0,0));
     shape(rectangle);
     textSize(32);
     text("Balls Left: " + (numBalls-1),200,450);
     text("Points: " + points,200,500);
}


void keyPressed(){
   if(key == 's') //read for left flipper command
     leftpress = true;
   if(key == 'k') //read for right flipper command
     rightpress = true;
   if(leftpress){// change state : separate from previous if statements in order for simultaneous flipper movement
     left.flipperState = 2;
        if(left.flipperState ==1){
     left.F=32;  }
   }
   if(rightpress){
     right.flipperState=2;
     if(right.flipperState ==1){
     right.F=32;}
   }
   if(key == ' ' && start == false && numBalls>0){//place ball on field
       start  = true;
       numBalls--;
       b = new Ball();
   }
}

void keyReleased(){//change flippers back after key press is done
   if(key == 's')
     leftpress = false;
   if(key == 'k')
     rightpress = false;
   if(leftpress){
     left.flipperState = 2;
  
   }
   if(rightpress){
     right.flipperState=2;
 
   }
}


void createField(){//sets up the field with obstacles
   background(255,255,255);
   strokeWeight(5);
   for(Bumper temp:bump)
       ellipse(temp.xpos,temp.ypos,temp.size*2,temp.size*2);
   for(Wall temp:wall)
       line(temp.xpos,temp.ypos,temp.xpoint2,temp.ypoint2);
   fill(color(0,255,0));
   strokeWeight(3);
   
   /* for (int i = 0; i < width; i+=25) {// used for obstacle placement/creates grid
      line (i, 0, i, height);
    }
    for (int i = 0; i < height; i+=25) {
      line (0, i, width, i);
    }*/
}

void designField(){//placement of obstacles
  //bottom walls and side walls
   wall.add(new Wall(0,675,220,750));
   wall.add(new Wall(380,750,600,675));
   wall.add(new Wall(0,675,0,0));
   wall.add(new Wall(600,675,600,0));
   
   //two triangles
   //vertical lines
   wall.add(new Wall(75,650,75,525));
   wall.add(new Wall(525,650,525,525));
  //bottom lines   
   wall.add(new Wall(75,650,200,700));
   wall.add(new Wall(525,650,400,700));
   //upper lines
   wall.add(new Wall(75,525,200,700));
   wall.add(new Wall(525,525,400,700));
   
   //upper left walls
   wall.add(new Wall(75,400,0,175));
   wall.add(new Wall(100,325,50,150));
   wall.add(new Wall(0,125,25,75));
   wall.add(new Wall(100,325,200,350));
   
   //upper most-right walls
   wall.add(new Wall(525,350,575,300));
   wall.add(new Wall(575,300,600,250));
   wall.add(new Wall(600,200,575,150));
   wall.add(new Wall(575,150,525,100));
   wall.add(new Wall(525,100,450,75));
   
   //upper less-right walls
   wall.add(new Wall(450,325,500,300));
   wall.add(new Wall(500,300,525,250));
   wall.add(new Wall(525,200,500,150));
   wall.add(new Wall(500,150,450,125));
   wall.add(new Wall(525,250,525,200));
   
   //walls at top
   wall.add(new Wall(75,25,275,0));
   wall.add(new Wall(275,0,600,25));
   
   //middle left walls
   wall.add(new Wall(150,200,300,100));
   wall.add(new Wall(150,200,125,150));
  wall.add(new Wall(300,100,225,75));
   wall.add(new Wall(125,150,225,75));
   
   //upper left
   bump.add(new Bumper(40,40,35));
   //middle right
   bump.add(new Bumper(575,350,32));
   //middle up-right
   bump.add(new Bumper(400,200,25));
   //middle upleft
   bump.add(new Bumper(275,225,25));
   //middle downward
   bump.add(new Bumper(350,300,25));
   //up right
   bump.add(new Bumper(550,65,40));
   //middle left
   bump.add(new Bumper(30,375,32));
}
