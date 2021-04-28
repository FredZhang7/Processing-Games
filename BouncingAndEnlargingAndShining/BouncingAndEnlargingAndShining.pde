class Sprite {
float x,y,dx,dy;
}
PFont Fred;
color white = color(255);
color orange = color(255, 165, 0);
color color1 = color(255, 165, 0);
color color2 = color(132, 105, 80);
color color3 = color(71, 39, 11);
color color4 = color(38, 18, 1);
Sprite ball = new Sprite();
Sprite ball2 = new Sprite();
Sprite ball3 = new Sprite();
Sprite ball4 = new Sprite();
float diam;
float diam2,diam3,diam4;
void setup(){
  size(500,500);
  Fred=loadFont("AGaramondPro-Italic-48.vlw");
  ball.x = 100;
  ball.y = 100;
  ball.dx = 1;
  ball.dy = 2;
  diam = 70;
  ball2.x = 55;
  ball2.y = 55;
  ball2.dx = 2;
  ball2.dy = 3;
  diam2 = 50;
  ball3.x = 159;
  ball3.y = 159;
  ball3.dx = random(-5,5);
  ball3.dy = 4;
  diam3 = 90;
  ball4.x = 219;
  ball4.y = 219;
  ball4.dx = random(0,10);
  ball4.dy = 5;
  diam4 = 110;
}
void draw(){
  float b = random(0,600); 
  println(b);
  background(50,b,200,b);
  textFont(Fred);
  text("Fred",220,250);
  float a = random(0, 100);  
  println(a);
  ellipse(50,50,a,a);
  fill(62, 71, 86);
  ellipse(ball.x, ball.y, diam, diam);
  ball.x += ball.dx;
  ball.y += ball.dy;
  fill(color2);
  ellipse(ball2.x,ball2.y,diam2,diam2);
  ball2.x += ball2.dx;
  ball2.y += ball2.dy;
  fill(color3);
  ellipse(ball3.x,ball3.y,diam3,diam3);
  ball3.x += ball3.dx;
  ball3.y += ball3.dy;
  fill(color4);
  ellipse(ball4.x,ball4.y,diam4,diam4);
  ball4.x += ball4.dx;
  ball4.y += ball4.dy;
  // hit the left edge?
 // hit the left edge?
 if (ball.x - diam / 2 <= 0) {//ball
     color1 = color(45, 29, 226);
    ball.dx = -ball.dx;
    ball.x = diam / 2;
  }
    // hit the right edge?
  if (ball.x + diam / 2 >= 499) {//ball
    color1 = color(29, 242, 188);
    ball.dx = -ball.dx;
    ball.x = 499 - diam / 2;
  }
  
    // hit the top edge?
  if (ball.y - diam / 2 <= 0) {//ball
   color1 = color(33, 89, 38);
    ball.dy = -ball.dy;
    diam += 10;
    ball.y = diam / 2;
 }
   // hit the bottom edge?
  if (ball.y + diam / 2 >= 499) {//ball
    color1 = color(232, 44, 11);
    ball.dy = -ball.dy;
    ball.y = 499 - diam / 2;
 }

   if (ball2.x - diam2 / 2 <= 0) {//ball2
     color1 = color(45, 29, 226);
    ball2.dx = -ball.dx;
    ball2.x = diam2 / 2;
  }

    if (ball2.x + diam2 / 2 >= 499) {//ball2
    color2 = color(29, 242, 188);
    ball2.dx = -ball.dx;
    ball2.x = 499 - diam2 / 2;
  }

    if (ball2.y - diam2 / 2 <= 0) {//ball2
   color2 = color(33, 89, 38);
    ball2.dy= -ball.dy;
    diam2 += 10;
    ball2.y = diam2 / 2;
 }

  if (ball2.y + diam2 / 2 >= 499) {//ball2
    color2 = color(232, 44, 11);
    ball2.dy = -ball.dy;
    ball2.y = 499 - diam2 / 2;
 }
  if (ball3.x - diam3 / 2 <= 0) {//ball3
     color3 = color(45, 29, 226);
    ball3.dx = -ball3.dx;
    ball3.x = diam3 / 2;
  }

    if (ball3.x + diam3 / 2 >= 499) {//ball3
    color3 = color(29, 242, 188);
    ball3.dx = -ball3.dx;
    ball3.x = 499 - diam3 / 2;
  }

    if (ball3.y - diam3 / 2 <= 0) {//ball3
   color3 = color(33, 89, 38);
    ball3.dy= -ball3.dy;
    diam3 += 10;
    ball3.y = diam3 / 2;
 }

  if (ball3.y + diam3 / 2 >= 499) {//ball3
    color3 = color(232, 44, 11);
    ball3.dy = -ball3.dy;
    ball3.y = 499 - diam3 / 2;
 }
 if (ball4.x - (diam4 / 2 )<= 0) {//ball4
     color4 = color(45, 29, 226);
    ball4.dx = -ball4.dx;
    ball4.x = diam4 / 2;
  }

    if (ball4.x + diam4 / 2 >= 499) {//ball4
    color4 = color(29, 242, 188);
    ball4.dx = -ball4.dx;
    ball4.x = 499 - diam4 / 2;
  }

    if (ball4.y - diam4 / 2 <= 0) {//ball4
   color4 = color(33, 89, 38);
    ball4.dy= -ball4.dy;
    diam4 += 10;
    ball4.y = diam4 / 2;
 }

  if (ball4.y + diam4 / 2 >= 499) {//ball4
    color4 = color(232, 44, 11);
    ball4.dy = -ball4.dy;
    ball4.y = 499 - diam4 / 2;
 }
}