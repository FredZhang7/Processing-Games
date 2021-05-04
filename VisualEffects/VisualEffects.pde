PImage img;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
void setup() {
  // load the image file from the "data" folder
  size(1000,1000);
  img = loadImage("earth.jpg");
  img1 = loadImage("sun.jpg");
  img2 = loadImage("space.jpg");
  img3 = loadImage("Venus.jpg");
  img4 = loadImage("Mars1.jpg");
  img5 = loadImage("jupiter.jpg");
  // set the window to be the same dimensions as the image
}
void draw() {
  background(3, 3, 25);
  image(img, 0, 0);
  img.filter(BLUR, 6);
  image(img1, 240, 0);
  img1.filter(ERODE);
  image(img3, 465, 0);
  img2.filter(DILATE);
  image(img2, 0, 220);
  img3.filter(POSTERIZE, 4);
  image(img4, 720, 0);
  img4.filter(INVERT);
  image(img5, 595, 258);
  img5.filter(ERODE);
  // set the image's tint
  // display the image so that its upper-left corner
  // is on the upper-left corner of the screen
}
 