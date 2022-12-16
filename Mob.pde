//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

class Mob {
  float x, y, vx, vy, d;
  int hp, maxhp;
  int value;
  color fil, str;
  float speed;

  Mob(float _x, float _y, float _vx, float _vy) {

    //initialize
    x=_x;
    y=_y;
    vx=_vx;
    vy=_vy;
    d=15;
    hp=5;
    maxhp=5;
    speed=1;
  }


  void show() {
    // if (mapp == 1) image(cat1, x, y, 50, 50);
    //if (mapp == 2) image(cat1, x, y, 50,50);
 

    healthbar();
    if (hp==0)
      coins=coins+1;
    
  }

  void act() {
     if (mapp == 1) {
      x=x+vx*speed;
      y=y+vy*speed;
      image(dog1, x, y, 50, 50);
      int i=0;
      while (i<nodes.length) {

        if (dist(x, y, nodes[i].x, nodes[i].y)<4) {
          vx=nodes[i].dx;
          vy=nodes[i].dy;
        }

        i++;
      }
      if (x>700) {
        // hp=0;
        lives=lives-1;
        mobs.remove(this);
      }
      i=0;
      while (i<bullets.size()) {
        Bullet myBullet =bullets.get(i);
        if (dist(myBullet.x, myBullet.y, x, y)<d/2+myBullet.d/2) {
          hp=hp-1;
          myBullet.hp=myBullet.hp-1;
        }
        i++;
      }
    }
    if (mapp == 2) {
      x=x+vx*speed;
      y=y+vy*speed;
      image(cat1, x, y, 50, 50);
      int i=0;
      while (i<nodes.length) {

        if (dist(x, y, nodes[i].x, nodes[i].y)<4) {
          vx=nodes[i].dx;
          vy=nodes[i].dy;
        }

        i++;
      }
      if (x>700) {
        // hp=0;
        lives=lives-1;
        mobs.remove(this);
      }
      i=0;
      while (i<bullets.size()) {
        Bullet myBullet = bullets.get(i);
        if (dist(myBullet.x, myBullet.y, x, y)<d/2+myBullet.d/2) {
          hp=hp-1;
          myBullet.hp=myBullet.hp-1;
        }
        i++;
      }
    }
  }
   
  
  

  void healthbar() {
    rectMode(CORNER);
    noStroke();
    fill(black);
    rect(x-17, y-(d+15)-2, 34, 14);//background
    fill(lpink);
    rect(x-15, y-(d+15), 30, 10);
    fill(255, 0, 0);
    rect(x-15, y-(d+15), hp*30/maxhp, 10);
    rectMode(CENTER);
  }
}
