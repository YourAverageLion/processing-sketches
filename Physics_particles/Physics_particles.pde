void setup() {
  size(640, 360);
  
  for(int i = 0; i<particles.length; i++){
    particles[i] = new Particle();
  }
  
}

float particle_x = width/2;
float particle_y = height/2;
float velocity_x = 30;
float velocity_y = 30;
Particle[] particles = new Particle[100];

void draw() {
  background(150,200,255);
  float dt = 0.016;
 
  for(int i = 0; i<particles.length; i++){
    particles[i].step(dt);
    particles[i].show();
    var p1 = particles[i];
    for(int j = 0; j<particles.length; j++){
      var p2 = particles[j];
      
      if(j!=i){
        float dist_x = p1.particle_x - p2.particle_x;
        float dist_y = p1.particle_y - p2.particle_y;
        float dist = (float)Math.sqrt(dist_y*dist_y  + dist_x*dist_x);
        if(dist<5.0){
          
          float v1x = p1.velocity_x;
          float v1y = p1.velocity_y;
          float v2x = p2.velocity_x;
          float v2y = p2.velocity_y;
          
          p1.velocity_x = dist_x*40;
          p1.velocity_y = dist_y*40;
          p2.velocity_x = -dist_x*40;
          p2.velocity_y = -dist_x*40;
        }
      }
      
      // calc distance from p1 to p2
      
      
      // if dist is less than radius * 2, send both particles in opposing directions
      
      
    }
  }
  
  
  //fill(255,220,000);
  //circle(particle_x, particle_y, 5.0);
  
}

class Particle {
  float speed_range = 100;
  float particle_x = random(0,width);
  float particle_y = random(0,height);
  float velocity_x = random(-speed_range, speed_range);
  float velocity_y = random(-speed_range, speed_range);
  
  int r = (int)random(0,255);
  int g = (int)random(0,255);
  int b = (int)random(0,255);

  void show() {
    fill(r,g,b);
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
