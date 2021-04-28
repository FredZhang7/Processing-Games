PFont hello;
PImage img; 
PImage img1;
float x,y, a,b,c,d,e,f;
float dx, dy, dc,dd,de,df; // up/down velocity
float z;
void setup() {
  size(1000, 900);
  hello=loadFont("Algerian-48.vlw");
  x = 380; // start near the top middle
  y = 0;// of the screen

  dx = 0; // initialize the velocity so
  dy = 2; // its moving downwards only
  dc = -4;
  dd = 2.5;
  
  img = loadImage("Avengers.jpg");
  img1 = loadImage("DrStrange.jpg");
  a=410;
  b=450;
  c=1000;
  d=0;
  e=1000;
  f=450;
  z=450;
}

void draw() {
  background(154, 226, 59);// draw the background

  // draw the ball
  noStroke();
  textFont(hello);
  text("Avengers", a, b);
  image(img, x, y);
  image(img1, c, d);
  ellipse(e, f, 55, 55);
  x += dx;// add dx to x
  y += dy;// add dy to y
  c += dc;
  d += dd;
  e += dc;
  f += dd;
  z += dx;
  if (y > 800) {// if y is greater than 499, then
    dy = -dy;// set y to be 0
  }
  if (x < 1){
    dx = -dx;
  }
  if (d >800) {
    dd = -dd;
    //dc = -dc;
  }
  if (c <1) {
    dc = -dc;
    //dc = -dc;
  }
  if(e >1000){
    dc = -dc;
  }
  if(f <150){
    dd = -dd;
  }
}