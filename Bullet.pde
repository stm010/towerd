//Some towers shoot bullets! If a mob is hit by a bullet,
//it does damage.

class Bullet {
  float x, y, vx, vy, d;
  int hp; //hitpoint

  Bullet(float _x, float _y, float _vx, float _vy, float _d) { //constructor (take these parameters)
    x=_x; //determine bullet position and velocity from external source by sending those values as parameters , can aim bullet at different places/no pre-defined direction
    y=_y;
    vx=_vx;
    vy=_vy;
    d= _d;
    hp = 1;
  }
  
  void act() {
    x=x+vx;
    y=y+vy;
    int i = 0;
    while (i < mobs.size()) {
      if(dist(x, y, mobs.get(i).x, mobs.get(i).y)<d/2+mobs.get(i).d/2+30) {
    hp = 0;
    mobs.get(i).hp=mobs.get(i).hp-1;
  }
  i++;
  }
      if(x < 0 && x > width && y < 0 && y > height) hp = 0;
  }

  void show() {
    strokeWeight(2);
    fill(white);
    circle(x, y, d);
  }
}
