class Point {
  float x, y;
  float target_y = 0.0;
  Point(float x, float y){
    this.x = x;
    this.y = y;
  }
  void draw(){
    fill(250, 30, 30);
    circle(x , y, 1);
  }
  void step(float delta){
    float new_y = y;
    //new_y += target_y;
    //new_y /= 2.0;
    
    if (new_y > target_y){
      new_y -= delta;
    }
    if (new_y < target_y){
      new_y += delta;
    }
    
    y = new_y;
  }
}

void setup(){
  size(800, 600);
  for (int i = 0; i < width; i++){
    points.add(new Point(i, 0));
  }
}

float graphfunction(Point p){
  return (float)Math.sin(p.x/100.0)*100.0+(height/2);
}

ArrayList<Point> points = new ArrayList<>();

void draw(){
  background(230);
  noFill();
  
  //beginShape();
  for (int i = 0; i < points.size()-1; i++){
    //points.get(i).draw();
    Point p = points.get(i);
    Point p2 = points.get(i+1);
    stroke(p.y+100.0, p.x/5 , 30);
    //vertex(p.x,p.y);
    line(p.x, p.y, p2.x, p2.y);
    
    
    points.get(i).step(50.0/frameRate);
    points.get(i).target_y = graphfunction(points.get(i));
  }
  //endShape();
}
