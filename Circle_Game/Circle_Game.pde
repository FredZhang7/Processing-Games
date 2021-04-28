void setup(){
  size(500,500);
  smooth();
}

void draw(){
  if(mousePressed){
    fill(1);
  } else{
    fill(250);
  }
  ellipse(mouseX, mouseY, 90, 90);
}