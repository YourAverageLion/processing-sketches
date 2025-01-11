void setup() {
  size(640, 360);
  
  //for ()
  
}

float particle_x = width/2;
float particle_y = height/2;
float velocity_x = 30;
float velocity_y = 30;
Particle[] a = new Particle[10];

void draw() {
  background(150,200,255);
  float dt = 0.016;
  
  
  
  //fill(255,220,000);
  //circle(particle_x, particle_y, 5.0);
  
}

class Particle {
  float particle_x = width/2;
  float particle_y = height/2;
  float velocity_x = 30;
  float velocity_y = 30;

  void show() {
    fill(255,220,000);
    circle(particle_x, particle_y, 5.0);
  }
  
  void step(float dt) {
    particle_x += velocity_x * dt;
    particle_y += velocity_y * dt;
    
    if(particle_x>=width || particle_x<=0){
      velocity_x*=-1;
    }
    if(particle_y>=height || particle_y<=0){
      velocity_y*=-1;
    }
  }

}
