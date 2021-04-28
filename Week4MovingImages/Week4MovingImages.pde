PImage img; 
PImage img1;
PFont helloFont;
PFont byeFont;
PImage img2;
PImage img3;
float x;  // (x, y) is the center
float y;  // of the ball
float a;
float b;
float c;
float d;
float e;
float f;
void setup() {
  helloFont=loadFont("ACaslonPro-BoldItalic-48.vlw");
  byeFont=loadFont("ACaslonPro-BoldItalic-48.vlw");
  img = loadImage("Avengers.jpg");
  size(600, 600);
  img1 = loadImage("Mark 1.jpg");
  img2 = loadImage("Mark 2.jpg");
  img3 = loadImage("C.A..jpg");
  x = 600; // start near the top middle
  y = 600;  // of the screen
  a = 0;
  b = 0;
  c = 0;
  d = 600;
  e = 0;
  f = 0;
}
void draw() {
  background(108, 237, 106);  // draw the background
  image(img,e,f);
  e += 0;
  f += 1;
  // draw the ball
  noStroke();
  textFont(helloFont);
  text("Iron Man Mark 1",x,y);
  image(img1,x,y);
  x += -1.5;  // add 0 to x
  y += -1.5;  // add 1 to y
  textFont(byeFont);
  text("Iron Man Mark 2",a,b);
  image(img2,a,b);
  a += 1;
  b += 1;
  image(img3,c,d);
  c += -1;
  d += -1;
}