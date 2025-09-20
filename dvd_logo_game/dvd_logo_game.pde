PImage logo;
float x = 0;
float y = 0;
float xv = 160;
float yv = 160;

class Wall {

  float x;
  float y;
  float wallheight;
  float wallwidth;
  
  public Wall(float x, float y, float wallheight, float wallwidth){
    this.x=x;
    this.y=y;
    this.wallheight = wallheight;
    this.wallwidth = wallwidth;
  }
  
  public void draw() {
    rect(x,y,wallwidth,wallheight);
  }

}

void setup(){
  logo = loadImage("dvd_logo.png");
  size(1600,900);
  tint(0,255,255);
  

}

void draw(){
  background(0);
  image(logo, x,y, 126, 66);
  float delta = (1.0/60);
  y = y+yv*delta;
  x = x+xv*delta;
  if (x>=width-126){
    xv = -abs(xv);
    tint(random(255),random(255),random(255));
  }
  if (x<=0){
    xv = abs(xv);
    tint(random(255),random(255),random(255));
  }
  if (y>=height-66){
    yv = -abs(yv);
    tint(random(255),random(255),random(255));
  }
  if (y<=0){
    yv = abs(yv);
    tint(random(255),random(255),random(255));
  }
  
  //Wall w = new Wall(500,500,3,126);
  //w.draw();
  

}
