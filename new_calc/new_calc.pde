ArrayList<PVector>pointlist = new ArrayList<>();

float screenx = 0;
float screeny = 0;


void setup(){


//function (x^2)
//window
//points*window size
for (int i = 0; i<600*2; i++){
  PVector p = new PVector();
  p.x = i-600;
  p.y = (p.x*p.x)*0.1;
  pointlist.add(p);
}
  
  size(1600, 900);
}


void draw(){
  background(201,160,220);
  
  float lowest = dist(pointlist.get(0).x, pointlist.get(0).y, mouseX-screenx, mouseY-screeny);
  int lowest_index = 0;
  
  for(int i = 0; i<pointlist.size(); i++){
    float testlow = dist(pointlist.get(i).x, pointlist.get(i).y, mouseX-screenx, mouseY-screeny);
    if (testlow<lowest){
      lowest = testlow;
      lowest_index = i;
    }
  }
  for(int i = 0; i<pointlist.size(); i++){
    PVector p = pointlist.get(i);
    circle(p.x*2.5+screenx,p.y+screeny,4);
    if(i == lowest_index){
      circle(p.x*2.5+screenx,p.y+screeny,16);
      var p_copy = p;
      PVector p_plus_h = pointlist.get(i+1);
      var dir = (p_copy.sub(p_plus_h)).normalize();
      line(p.x,p.y,p.x+dir.x*100,p.y+dir.y*100);      
      
      
      
    }
    
  }
  if (keyPressed) {
    System.out.println("a");
    if (key == 'w'){
      screeny += 10;
    }
    if (key == 'a'){
      screenx += 10;
    }
    if (key == 's'){
      screeny -= 10;
    }
    if (key == 'd'){
      screenx -= 10;
    }
  }
}
