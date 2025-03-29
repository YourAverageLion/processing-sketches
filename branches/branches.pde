class Branch{
  //initial conditions
  float angle;
  float coordx;
  float coordy;
  float blength;
  ArrayList<Branch> connections = new ArrayList<>();
  
  public Branch(float angle, float x, float y, float blength){
    //restatement
    this.angle = angle;
    this.coordx = x;
    this.coordy = y;
    this.blength = blength;
  }
  void draw(float ang) {
    
    //endpoint calculations
    float x2 = get_x2(ang);
    float y2 = get_y2(ang);
    //drawing self line
    line(coordx, coordy, x2, y2);
    
    //drawing all children
    for (int i = 0; i<connections.size(); i++){
      float new_angle = ((180 / connections.size()) * (1+i));
      //recursion
      connections.get(i).draw(new_angle);
    }
    
  }
  //calculating endpoint vals
  float get_x2(float a) {
    float a1 = (float)Math.toRadians(a + angle);
    return ((float)Math.cos(a1)*blength) + coordx;
  }
  float get_y2(float a) {
    float a1 = (float)Math.toRadians(a + angle);
    return ((float)Math.sin(a1)*blength)+ coordy;
  }
  
  void add_child() {
    connections.add(new Branch(0,50,50,20));
    //drawing all children
    for (int i = 0; i<connections.size(); i++){
      float new_angle = ((180 / connections.size()) * (1+i));
      //recursion
      connections.get(i).coordx = get_x2(0);
      connections.get(i).coordy = get_y2(0);
    }
  }
  
}




void setup() {
  size(1200,900);
}

void draw() {
  Branch b1 = new Branch(90,200,200,20);
  b1.add_child();
  b1.add_child();
  b1.add_child();
  //b1.connections.add(new Branch(0,b1.get_x2()));
  b1.draw(0);
}
