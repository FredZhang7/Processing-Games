
import java.util.Timer;
import java.util.TimerTask;
import java.util.Date;

float b=random(0,60);
float c=random(61,120);
float d=random(121, 180);
PImage snakeImg,foodImg;
PFont a;
snake snakeObj;
food foodObj;
int highScore;
color snake = color(96, 201, 185);
boolean bGameOver = false;

long startTime = System.currentTimeMillis();//nanoTime


void setup(){
  size(1000, 600);
  snakeImg = loadImage("snake.jpg");
  foodImg = loadImage("apple.jpg");
  frameRate(14);
  snakeObj = new snake();
  foodObj = new food();
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  
  highScore = 0;
   a=loadFont("AGaramondPro-Italic-48.vlw");
   TimerTask timerTask = new SnakeTimerTask();
   Timer timer = new Timer(true);
   timer.scheduleAtFixedRate(timerTask, 0, 60*1000);
}

    
void draw(){  
  long endTime = System.currentTimeMillis();
  long duration = (endTime - startTime);
  if(duration < 0.1)
  {        
    return;
  }
  startTime = endTime;

  if(bGameOver){
    return;
  }
  
  System.out.println("---" + duration);
  
  background(b,c,d);
  drawScoreboard();
  image(snakeImg,340,155);
  snakeObj.move();
  snakeObj.display();
  foodObj.display();
  
  
  if( dist(foodObj.xpos, foodObj.ypos, snakeObj.xpos.get(0), snakeObj.ypos.get(0)) < snakeObj.sidelen ){
    foodObj.reset();
    snakeObj.addLink();
    snakeObj.changeColor();
  }
  
  if(snakeObj.len > highScore){
    highScore= snakeObj.len;
  }
}


void keyPressed(){
  if(key == CODED){
    if(keyCode == LEFT){
      snakeObj.dir = "left";
    }
    if(keyCode == RIGHT){
      snakeObj.dir = "right";
    }
    if(keyCode == UP){
      snakeObj.dir = "up";
    }
    if(keyCode == DOWN){
      snakeObj.dir = "down";
    }
    if(keyCode == CONTROL){
      if(bGameOver)
      {
        snakeObj.reset();
        foodObj.reset();
        bGameOver=false;
      }
    }
  }
}


void drawScoreboard(){
  // All of the scode for code and title
  
  fill(77, 232, 30);
  textSize(65);
  textFont(a);
  text( "Snake Game", width/2, 80);
  fill(0,0,0);
  textSize(20);
  text( "By: Fred", width/2, 140);
  
  
  // draw scoreboard
  stroke(179, 140, 198);
 fill(255, 0 ,255);
  rect(90, 70, 160, 80);
fill(0,0,0);
  textSize(17);
  text( "Score: " + snakeObj.len, 70, 40);
  fill(0,0,0);
  textSize(17);
  text( "High Score: " + highScore, 70, 70);
}


void drawGameOver(){
  // All of the scode for code and title
  
  fill(77, 232, 30);
  textSize(100);
  textFont(a);
  text( "Game Over", width/2, height/2+150);    
}


class food{
  // define varibles
  float xpos, ypos;
  
  
  
  //constructor
  food(){
    xpos = random(100, width - 100);
    ypos = random(100, height - 100);
  }
  
  
  // functions
 void display(){
   
   fill(100,0,100);
   //ellipse(xpos, ypos,17,17);
   image(foodImg,xpos,ypos);
 }
 
 
 void reset(){
    xpos = random(100, width - 100);
    ypos = random(100, height - 100);
    snake = color(random(15,99),50,80);
 }   
}


class SnakeTimerTask extends TimerTask {
    @Override
    public void run() {
        System.out.println("Timer task started at:"+new Date());
        
        System.out.println("Timer task finished at:"+new Date());
    }
}
class snake{
    
  //define varibles
  int len;
  float sidelen;
  String dir; 
  ArrayList <Float> xpos, ypos;
  
  // constructor
  snake(){
    
    len = 1;
    sidelen = 17;
    dir = "right";
    xpos = new ArrayList();
    ypos = new ArrayList();
    xpos.add( 17+random(width-17) );
    ypos.add( 17+random(height -17) );
  }
  
  void reset () {
    len = 1;
    xpos.set(0, random(width) );
    ypos.set(0, random(height) );    
    changeColor();
  }
  
  // functions
  
  
  void move(){
   for(int i = len - 1; i > 0; i = i -1 ){
    xpos.set(i, xpos.get(i - 1));
    ypos.set(i, ypos.get(i - 1));  
   } 
   if(dir == "left"){
     xpos.set(0, xpos.get(0) - sidelen);
   }
   if(dir == "right"){
     xpos.set(0, xpos.get(0) + sidelen);
   }
   
   if(dir == "up"){
     ypos.set(0, ypos.get(0) - sidelen);
  
   }
   
   if(dir == "down"){
     ypos.set(0, ypos.get(0) + sidelen);
   }
   
    System.out.println("xpos " + xpos.get(0) + " --" + width);
    if(xpos.get(0) > width - 17 || xpos.get(0) <= 17 || ypos.get(0) > height - 17 || ypos.get(0) < 17) {
      bGameOver = true;
      drawGameOver();
      return;
    }
    
   xpos.set(0, (xpos.get(0) + width) % width);
   ypos.set(0, (ypos.get(0) + height) % height);
   
    // check if hit itself and if so cut off the tail
    if( checkHit() == true){
      len = 1;
      float xtemp = xpos.get(0);
      float ytemp = ypos.get(0);
      xpos.clear();
      ypos.clear();
      xpos.add(xtemp);
      ypos.add(ytemp);
    }
  }
  
  
  void changeColor(){
  snake = color(random(100,225),0,100);
  }
  
  
  void display(){
    for(int i = 0; i <len; i++){
      stroke(179, 140, 198);
   //   fill(100,0,100,map(i-1, 0, len-1, 250, 50));
   fill(snake);
      rect(xpos.get(i), ypos.get(i), sidelen, sidelen);
    }  
  }
  
  
  void addLink(){
    snake = color(random(100,225),random(10,99));
    xpos.add( xpos.get(len-1) + sidelen);
    ypos.add( ypos.get(len-1) + sidelen);
    len++;
    
    
  }
  
   boolean checkHit(){
    for(int i = 1; i < len; i++){
     if( dist(xpos.get(0), ypos.get(0), xpos.get(i), ypos.get(i)) < sidelen){
       return true;
     } 
    } 
    return false;
   } 
}