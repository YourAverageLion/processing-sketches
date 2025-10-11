PImage logo;


float[] speed = {160.0,-160.0};

float x = random(0, 1600-126);
float y = random(0,900-66);
float xv = speed[(int)random(0,2)];
float yv = speed[(int)random(0,2)];
//ArrayList<Wall> walls = new ArrayList<>();
Wall wall = new Wall(0,0, 150, 5);
int points = 0;




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
  
  public void isColliding(float cx, float cy) {
    
    // xforloop
    for (float ix = cx ; ix < cx+126 ; ix += 1.0) {
    }
    for (float ix = cy ; ix < cy+66 ; ix += 1.0) {
      
    }
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
  int inst = 0;
  
  
  if (x>=width-126){
    xv = -abs(xv);
    tint(random(255),random(255),random(255));
    inst ++;
  }
  if (x<=0){
    xv = abs(xv);
    tint(random(255),random(255),random(255));
    inst ++;
  }
  if (y>=height-66){
    yv = -abs(yv);
    tint(random(255),random(255),random(255));
    inst ++;
  }
  if (y<=0){
    yv = abs(yv);
    tint(random(255),random(255),random(255));
    inst ++;
  }
  
  if (inst > 1){
    points+=100;
  }
  
  
  
  
  
  
  
  wall.draw();
  text(points, 80, 80);
  float i = yv;
  float a = xv;
  if (wall.wallwidth>wall.wallheight && x>wall.x-wall.wallwidth/2-63 && x<wall.x+wall.wallwidth/2+63 && y>wall.y-wall.wallheight/2-55 && y<wall.y+wall.wallheight/2){
    if(i>=0){
      yv=-abs(yv);
    }
    if(i<=0){
      yv=abs(yv);
    }
    tint(random(255),random(255),random(255));
  }
  if (wall.wallheight>wall.wallwidth && x>wall.x-wall.wallwidth/2-115 && x<wall.x+wall.wallwidth/2-10 && y>wall.y-wall.wallheight/2 && y<wall.y+wall.wallheight/2+50){
    if(a>=0){
      xv=-abs(xv);
    }
    if(a<=0){
      xv=abs(xv);
    }
    tint(random(255),random(255),random(255));
  }
  

  
  //Wall w = new Wall(500,500,3,126);
  //w.draw();
  

}

void mousePressed() {
    if (mouseButton == LEFT){
      wall = new Wall(mouseX-2.5, mouseY-75, 150, 5);
    }
    if (mouseButton == RIGHT){
      wall = new Wall(mouseX-75, mouseY-2.5, 5, 150);
    }
  }
