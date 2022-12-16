//Nodes are invisible objects that we place on the map
//to direct the flow of mobs. When a mob collides with
//a node object, it will change direction according to
//the node's instructions.

class Node {

  float x, y, dx, dy; //direction

  Node(float _x, float _y, float _dx, float _dy) { //constructor takes in these parameters
    x=_x;
    y=_y;
    dx=_dx;
    dy=_dy;
  }

  void show() {
    fill(0);
    strokeWeight(5);
    circle(x, y, 10);
    stroke(0);
    line(x, y, x+dx*10, y+dy*10);
   
  }
}
