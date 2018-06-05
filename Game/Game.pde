import java.util.ArrayList;
ArrayList<Bumper> bump  = new ArrayList<Bumper>();
ArrayList<Wall> wall = new ArrayList<Wall>();
Ball b;
int points;
int numBalls = 5;
Flipper left,right;
boolean start = false;
boolean leftpress = false;
boolean rightpress = false;

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
    if(start)b.move();

   for(Bumper temp:bump)
       temp.bounce(b);
   for(Wall temp:wall)
       temp.reflect(b);
   /*strokeWeight(5);
   stroke(0, 0,0);
   line(left.xpos, left.ypos, left.xpos+left.size*cos(left.angle), left.ypos-left.size*sin(left.angle));
   line(right.xpos, right.ypos, right.xpos+right.size*cos(right.angle), right.ypos-right.size*sin(right.angle));
   */
   left.move();
   right.move();
   left.bounce(b);
   right.bounce(b);
}

void keyPressed(){
   if(key == 's'){
     leftpress = true;
     
   }
   if(key == 'k'){
     rightpress = true;
     
   }
   if(leftpress)
     left.flipperState = 2;
   if(rightpress)
     right.flipperState=2;

   /*if(rightpress && leftpress){
     for(int i=0;i<8;i++){
      left.move();
      right.move();
     }
   }
   else if(rightpress && !leftpress){
     for(int i=0;i<8;i++)
      right.move(); 
   }
   else{
     for(int i=0;i<8;i++)
      left.move(); 
   }*/
   if(key == ' '){
       start  = true;
       b = new Ball();
   }
}

void keyReleased(){
   if(key == 's')
     leftpress = false;
   if(key == 'k')
     rightpress = false;
   if(leftpress)
     left.flipperState = 2;
   if(rightpress)
     right.flipperState=2;
}


void createField(){
   background(255,255,255);
   strokeWeight(5);
   for(Bumper temp:bump)
       ellipse(temp.xpos,temp.ypos,temp.size*2,temp.size*2);
   for(Wall temp:wall)
       line(temp.xpos,temp.ypos,temp.xpoint2,temp.ypoint2);
   fill(color(0,255,0));
   strokeWeight(3);
   
   
    for (int i = 0; i < width; i+=25) {
      line (i, 0, i, height);
    }
    for (int i = 0; i < height; i+=25) {
      line (0, i, width, i);
    }
}

void designField(){
   wall.add(new Wall(0,675,220,750));
   wall.add(new Wall(380,750,600,675));
   wall.add(new Wall(0,675,0,0));
   wall.add(new Wall(600,675,600,0));
   
   wall.add(new Wall(75,650,75,525));
   wall.add(new Wall(525,650,525,525));
   wall.add(new Wall(75,650,200,700));
   wall.add(new Wall(525,650,400,700));
   wall.add(new Wall(75,525,200,700));
   wall.add(new Wall(525,525,400,700));
   
   wall.add(new Wall(75,400,0,175));
   wall.add(new Wall(100,325,50,150));
   wall.add(new Wall(0,125,25,75));
   wall.add(new Wall(100,325,200,350));
   
   wall.add(new Wall(525,350,575,300));
   wall.add(new Wall(575,300,600,250));
   wall.add(new Wall(600,200,575,150));
   wall.add(new Wall(575,150,525,100));
   wall.add(new Wall(525,100,450,75));
   
   wall.add(new Wall(450,325,500,300));
   wall.add(new Wall(500,300,525,250));
   wall.add(new Wall(525,200,500,150));
   wall.add(new Wall(500,150,450,125));
   wall.add(new Wall(525,250,525,200));
   
   wall.add(new Wall(75,25,275,0));
   wall.add(new Wall(275,0,600,25));
   
   wall.add(new Wall(150,200,300,100));
   wall.add(new Wall(150,200,125,150));
   wall.add(new Wall(300,100,225,75));
   wall.add(new Wall(125,150,225,75));
   
   bump.add(new Bumper(40,40,30));
   bump.add(new Bumper(575,350,30));
   bump.add(new Bumper(400,200,25));
   bump.add(new Bumper(275,225,25));
   bump.add(new Bumper(350,300,25));
   bump.add(new Bumper(550,65,35));
   bump.add(new Bumper(30,375,30));
}
