PVector[][] points = new PVector[5][4];

void setup(){
  points[0][0] = new PVector(600, 450);
  points[0][1] = new PVector(1000, 450);
  points[0][2] = new PVector(800, 250);
  points[0][3] = new PVector(800, 650);
  points[1][0] = new PVector(800,450);
  points[1][1] = new PVector(800,450);
  points[1][2] = new PVector(800,450);
  points[1][3] = new PVector(800,450);
  size(1600,900);
//mid: 800, 450

}

float t = 0.0;

void draw(){
  //for (int i = 0; i < points.length; i++){
  //  circle(points[i].x, points[i].y, 1);
  //}

  var p1 = points[1][0];
  p1.x = (float) Math.sin(t);
  

  stroke(0,255,0);
  line(points[0][0].x, points[0][0].y, points[0][2].x, points[0][2].y);
  line(points[0][0].x, points[0][0].y, points[0][3].x, points[0][3].y);
  line(points[0][1].x, points[0][1].y, points[0][2].x, points[0][2].y);
  line(points[0][1].x, points[0][1].y, points[0][3].x, points[0][3].y);
  stroke(255,0,0);
  line(points[0][0].x, points[0][0].y, points[1][0].x, points[1][0].y);
  line(points[0][2].x, points[0][2].y, points[1][2].x, points[1][2].y);
  line(points[0][1].x, points[0][1].y, points[1][1].x, points[1][1].y);
  line(points[0][3].x, points[0][3].y, points[1][3].x, points[1][3].y);


  t+=(1000/60)*0.01;
}
