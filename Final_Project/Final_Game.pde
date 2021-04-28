//float health = 100;
float MAX_HEALTH = 100;
float rectWidth = 200;
float speed = 10; 
float speed1 = 3; // enemies speed 
float speed2 = 20; 
float speed3 = 30; 
float speed4 = 40; 
float speed5 = 50; 
boolean DEAD = false;
int score = 0;
class Sprite {
  float x;
  float y;
  float dx;
  float dy;
  float health=100;
  PImage heroImg;
  void draw() {
    x = x+ dx;
    image(heroImg, x, y);
  }
  void die() {
    DEAD = true;
  }
  boolean collision(Enemy other) {
    if ((abs(x-other.a)<70)&&  (abs(y-other.b)<70)) {
      return true;
    }
    return false;
  }
  boolean collision(heart other) {
    if ((abs(x-other.a)<70)&&  (abs(y-other.b)<70)) {
      return true;
    }
    return false;
  }

  boolean collisionCoin(Coin other) {
    if ((abs(x-other.a)<70)&&  (abs(y-other.b)<70)) {
      return true;
    }
    return false;
  }
}  

class Enemy {
  float a;
  float b;
  float ax;
  float by;
  PImage enemyImg;

  Enemy(float x, float y, float dy, PImage img) {
    this.a = x;
    this.b = y;
    this.by = dy;
    this.enemyImg= img;
  }

  void draw() {

    image(enemyImg, a, b);
  }

  void update() {
    b+=by;
    if (hero.collision(this)) {
      if (hero.health>0) {
        hero.health = hero.health-1;
      } else {
        hero.die();
      }
    }
  }
}
class Coin {
  float a;
  float b;
  float ax;
  float by;
  PImage coinImg;

  Coin(float x, float y, float dy, PImage img) {
    this.a = x;
    this.b = y;
    this.by = dy;
    this.coinImg= img;
  }

  void draw() {

    image(coinImg, a, b);
  }

  void update() {
    b+=by;

    if (hero.collisionCoin(this)) {
      score= score+1;
    }
  }
}
class heart {
  float a;
  float b;
  float ax;
  float by;
  PImage heartImg;

  heart(float x, float y, float dy, PImage img) {
    this.a = x;
    this.b = y;
    this.by = dy;
    this.heartImg= img;
  }

  void draw() {
    image(heartImg, a, b);
  }

  void update() {
    b+=by;

    if (hero.collision(this)) {
      if (hero.health>0 && hero.health<100) {
        hero.health= hero.health+1;
      }
    }
  }
}
class fallingObject {
  float x;
  float y;
  float dx;
  float dy;
  PImage fallingObjectImg;
  PImage fallingObjectImg2;

  void draw() {
    x = x+ dx;
    image(fallingObjectImg, x, y);
    image(fallingObjectImg2, x, y);
  }

  void update() {
    y=y+dy;
  }
}

PFont beat;
PImage img, img2, img3, img4; 
Sprite hero = new Sprite();
//Enemy enemy = new Enemy();

ArrayList <Enemy> enemies;
ArrayList <Coin> coins;
ArrayList <heart> hearts;


void setup() {
  size(800, 600);

  img2 = loadImage("walking.gif");
  beat = loadFont("AngsanaUPC-BoldItalic-48.vlw");
  img3 = loadImage("coin.png");
  img4 = loadImage("heart.gif");
  //enemy.enemyImg  = loadImage("giants.png"); 
  hero. x= 300;
  hero. y= 490;
  hero.dx= 3;
  hero.dy= 2;
  hero.heroImg = img2;
  //enemy.a = 100;
  //  enemy.ax= 0;
  //enemy.b = 0;
  //enemy.by = 2;
  enemies = new ArrayList<Enemy>();
  enemies.add(new Enemy(random(0, 780), random(-100, -30), random(5, 7), loadImage("giants.png")));
  enemies.add(new Enemy(random(0, 780), random(-100, -30), random(5, 7), loadImage("giants.png")));
  enemies.add(new Enemy(random(0, 780), random(-100, -30), random(5, 7), loadImage("giants.png")));
  enemies.add(new Enemy(random(0, 780), random(-100, -30), random(5, 7), loadImage("giants.png")));
  enemies.add(new Enemy(random(0, 780), random(-100, -30), random(5, 7), loadImage("giants.png")));
  enemies.add(new Enemy(random(0, 780), random(-100, -30), random(5, 7), loadImage("giants.png")));
  enemies.add(new Enemy(random(0, 780), random(-100, -30), random(5, 7), loadImage("giants.png")));
  enemies.add(new Enemy(random(0, 780), random(-100, -30), random(5, 7), loadImage("giants.png")));
  enemies.add(new Enemy(random(0, 780), random(-100, -30), random(5, 7), loadImage("giants.png")));
  enemies.add(new Enemy(random(0, 780), random(-100, -30), random(5, 7), loadImage("giants.png")));

  coins = new ArrayList<Coin>();
  coins.add(new Coin(random(0, 780), random(-100, -30), random(3, 5), loadImage("coin.png")));
  coins.add(new Coin(random(0, 780), random(-100, -30), random(3, 5), loadImage("coin.png")));
  coins.add(new Coin(random(0, 780), random(-100, -30), random(3, 5), loadImage("coin.png")));
  coins.add(new Coin(random(0, 780), random(-100, -30), random(3, 5), loadImage("coin.png")));
  coins.add(new Coin(random(0, 780), random(-100, -30), random(3, 5), loadImage("coin.png")));
  hearts = new ArrayList<heart>();
  hearts.add(new heart(random(0, 780), random(-100, -30), random(3, 5), loadImage("heart.gif")));
  hearts.add(new heart(random(0, 780), random(-100, -30), random(3, 5), loadImage("heart.gif")));
  hearts.add(new heart(random(0, 780), random(-100, -30), random(3, 5), loadImage("heart.gif")));
  hearts.add(new heart(random(0, 780), random(-100, -30), random(3, 5), loadImage("heart.gif")));
}

void walls() {
  if (hero.x<0) {
    hero.x=1;
  }

  if (hero.x>730) {
    hero.x=729;
  }
}
void ShowHealth() {
  fill(0);
  rect(600, 100, 100, 30);
  fill(0, 219, 25);
  rect(600, 100, 10*hero.health, 30);
}


void draw() {
  background(194, 215, 249);
  textFont(beat);
  text("Beat me if u can!", 301, 50);
  fill(0, 219, 25);
  rect(0, 570, 800, 100);
  //image(img3,120,550);
  walls();
  //image(img2, 300, 450);;
  hero.draw();
  // enemy.draw();
  for (int i = 0; i<enemies.size(); i++) {
    enemies.get(i).draw();
    enemies.get(i).update();
    if (enemies.get(i).b>500) {
      enemies.remove(i);
      enemies.add(new Enemy(random(0, 780), random(-100, -30), random(1, 3), loadImage("giants.png")));
    }
  }
  for (int i = 0; i<coins.size(); i++) {
    coins.get(i).draw();
    coins.get(i).update();

    if (coins.get(i).b>500) {
      coins.remove(i);
      coins.add(new Coin(random(0, 780), random(-100, -30), random(1, 3), loadImage("coin.png")));
    }

    if (hero.collisionCoin(coins.get(i))) {
      coins.remove(i);
      coins.add(new Coin(random(0, 780), random(-100, -30), random(1, 3), loadImage("coin.png")));
    }
  }
  for (int i = 0; i<hearts.size(); i++) {
    hearts.get(i).draw();
    hearts.get(i).update();

    if (hearts.get(i).b>500) {
      hearts.remove(i);
      hearts.add(new heart(random(0, 780), random(-100, -30), random(1, 3), loadImage("heart.gif")));
    }
  }


  // Draw bar
  noStroke();
  // Get fraction 0->1 and multiply it by width of bar
  float drawWidth = (hero.health / MAX_HEALTH) * rectWidth;
  rect(100, 100, drawWidth, 50);

  // Outline
  stroke(0);
  noFill();
  rect(100, 100, rectWidth, 50);

  text(score, 700, 50);

  if (DEAD == true) {
    for (int i = 0; i<enemies.size(); i++) {

      enemies.remove(i);
    }
    for (int i = 0; i<coins.size(); i++) {

      coins.remove(i);
    }

    for (int i = 0; i<hearts.size(); i++) {

      hearts.remove(i);
    }
  }
  //void mousePressed()
  //{
  //  if (health > 0 && mouseButton == LEFT)
  //  {
  //    health -= 5;
  //  }
  //  if (health < 100 && mouseButton == RIGHT)
  //  {
  //    health += 5;
  //  }
  //}{

  if (key==CODED) {
    if (keyPressed==true) {
      if (keyCode ==RIGHT ) {
        hero.dx= 3;
      } else {
        if (keyCode == LEFT) {

          hero.dx= -3;
        }
      }
    } else {
      hero.dx=0;
      ;
    }
  }
}