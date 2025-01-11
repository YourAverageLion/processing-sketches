/**
 * Mouse 2D. 
 * 
 * Moving the mouse changes the position and size of each box. 
 */
 
void setup() {
  size(640, 360); 
  noStroke();
  rectMode(CENTER);
  wow = random(255);
}
int newx = 0;
int newy = 0;
float time = 0;
float wow;
void draw() {
  
  
  
  if(keyPressed) {
    time += (1000/60)*0.01;
  } else {
    time += (1000/60)*0.001;
  }
  //newx = (int)(sin(time)*1.5*160.0)+width/2;
  //newy = (int)(cos(time)*160.0)+height/2;
  
  
  background(51); 
  //fill(180, 204);
  //rect(newx, height/2, newy/2, newy/2);
  //fill(255, 204);
  int inverseX = width-newx;
  int inverseY = height-newy;
  //rect(inverseX, height/2, (inverseY/2), (inverseY/2));
  
  for(int i = 0; i < 20; i++) {
    //newx = (int)(sin(time + (float) (i * 0.1))*1.5*160.0)+width/2;
    //newy = (int)(cos(time + (float) (i * 0.1))*160.0)+height/2;
    newx = mouseX + i*4;
    newy = mouseY + i*4;
     
    fill(wow, i*8);
    rect(newx, height/2, newy/2, newy/2);
    fill(256-wow, i*10);
    inverseX = width-newx;
    inverseY = height-newy;
    rect(inverseX, height/2, (inverseY/2), (inverseY/2));
  }
  
}
