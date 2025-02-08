void setup() {
  size(640, 360); //<>//
  
  for(int i = 0; i<particles.size(); i++){
    //particles[i] = new Particle();
  }
  
}

void mousePressed() {
    Particle p = new Particle();
    p.particle_x = mouseX;
    p.particle_y = mouseY;
    particles.add(p);
}

ArrayList<Particle> particles = new ArrayList<Particle>();

float particle_x = width/2;
float particle_y = height/2;
float velocity_x = 30;
float velocity_y = 30;
//Particle[] particles = new Particle[100];

void draw() {
  background(150,200,255);
  float dt = 0.016;
 
  for(int i = 0; i<particles.size(); i++){
    
    
    particles.get(i).show();
    var p1 = particles.get(i);
    for(int j = 0; j<particles.size(); j++){
      var p2 = particles.get(j);
      
//particle collisions
      if(j!=i){
        float dist_x = p1.particle_x - p2.particle_x;
        float dist_y = p1.particle_y - p2.particle_y;
        float dist = (float)Math.sqrt(dist_y*dist_y  + dist_x*dist_x);
        if(dist<5.0){
          
          float v1x = p1.velocity_x;
          float v1y = p1.velocity_y;
          float v2x = p2.velocity_x;
          float v2y = p2.velocity_y;
          float totp1 =(float)Math.sqrt(p1.velocity_x*p1.velocity_x+p1.velocity_y*p1.velocity_y);
          float totp2 =(float)Math.sqrt(p2.velocity_x*p2.velocity_x+p2.velocity_y*p2.velocity_y);
          
          if(totp1+totp2>170) {
            p1.velocity_x = dist_x*40;
            p1.velocity_y = dist_y*40;
            p2.velocity_x = -dist_x*40;
            p2.velocity_y = -dist_x*40;
          } else {
            if (totp1+totp2<170) {
              if(v1x/2+v2x/2 != 0 && v1y/2+v2y/2 != 0){
              float v_avg_x = v1x/2+v2x/2;
              float v_avg_y = v1y/2+v2y/2;
              p1.velocity_x = v_avg_x;
              p2.velocity_x = v_avg_x;
              p2.velocity_y = v_avg_y;
              p1.velocity_y = v_avg_y;
              if(v1x/2+v2x/2 == 0 || (p1.particle_x >= width || p1.particle_x <= 0)){
                p2.velocity_x = p1.velocity_x;
              }
              if(v1x/2+v2x/2 == 0 || (p1.particle_y >= height || p1.particle_y <= 0)){
                p2.velocity_y = p1.velocity_y;
              }
              if(v1x/2+v2x/2 == 0 || (p2.particle_x >= width || p2.particle_x <= 0)){
                p1.velocity_x = p2.velocity_x;
              }
              if(v1x/2+v2x/2 == 0 || (p2.particle_y >= height || p2.particle_y <= 0)){
                p1.velocity_y = p2.velocity_y;
              }
            }
          }
          }
          
        }
      }
      
      // calc distance from p1 to p2
      
      
      // if dist is less than radius * 2, send both particles in opposing directions
      
      
    }
    particles.get(i).step(dt);
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
  
  float velocity(){
    return (float)Math.sqrt(velocity_y*velocity_y + velocity_x*velocity_x);
  }
  
  void step(float dt) {
    
    particle_x += velocity_x * dt;
    particle_y += velocity_y * dt;
    
    float dirx = mouseX - particle_x;
    float diry = mouseY - particle_y;
    
    float dirlen = (float)Math.sqrt(dirx*dirx + diry*diry);
    dirx/=dirlen;
    diry/=dirlen;
    
    velocity_x += (dirx*dt*1000)/dirlen;
    velocity_y += (diry*dt*1000)/dirlen;
    
    
    //particles bouncing off of walls
    if(particle_x>=width || particle_x<=0){
      velocity_x*=-1;
    }
    if(particle_y>=height || particle_y<=0){
      velocity_y*=-1;

    }
  }

}
