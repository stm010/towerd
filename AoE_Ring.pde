//Some classes place AoE rings on the map. The AoE ring
//hurts all mobs in the ring. The ring only lasts for a
//short period of time.

class AoE_Ring {
  final int Placing=0;
  final int Placed=1;
  float x, y;
  int cooldown, threshold;
  int amode;
  int countdown;
  boolean collide;
  AoE_Ring(float _x, float _y, int c, int th, int d) {
    x=_x;
    y=_y;
    cooldown=c;
    threshold=th;
    amode=Placing;
    countdown=d;
  }

  void show() {
     color c =get(mouseX, mouseY);
    int i=0;
    while (aoe.size()>i) {
      if (dist(mouseX, mouseY, aoe.get(i).x, aoe.get(i).y)<15) {
        collide=true;
      } else {
        collide=false;
      }
      i++;
    }
    while (sniper.size()>i) {
      if (dist(mouseX, mouseY, sniper.get(i).x, sniper.get(i).y)<15) {
        collide=true;
      } else {
        collide=false;
      }
      i++;
    }
    while (towers.size()>i) {
      if (dist(mouseX, mouseY, towers.get(i).x, towers.get(i).y)<15 ) {
        collide=true;
      } else {
        collide=false;
      }
      i++;
    }
    strokeWeight(4);
    fill(white);
    if (amode==Placed) {
      image(aoee, x, y, 30, 30);
    } else if (amode==Placing && mouseX<675  &&  c!=lblue && collide==false) {
      image(aoee, mouseX, mouseY, 50, 50);
      if (mousePressed) {
        
        amode=Placed;
        x=mouseX;
        y=mouseY;
      }
    }
  }

  void act() {
    int i=0;
    countdown--;
    cooldown++;
    if (cooldown>=threshold) {
      cooldown=0;
      if (mobs.size() > 0) {
        fill(100, 100, 100, 100);
        ellipse(x, y, 200, 200);
        if (dist(x, y, mobs.get(i).x, mobs.get(i).y)<100) {
          mobs.get(i).hp--;
        }
        i++;
      }
    }

    countdown=10;
  }
}
