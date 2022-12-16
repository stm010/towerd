class Sniper {
  final int Placing=0;
  final int Placed=1;
  float x, y;
  int cooldown, threshold;
  int amode;
boolean collision;

  Sniper(float _x, float _y, int c, int th) {
    x=_x;
    y=_y;
    cooldown=c;
    threshold=th;
    amode=Placing;
  }


  void show() {
     color c =get(mouseX, mouseY);
    int i=0;
    while (aoe.size()>i) {
      if (dist(mouseX, mouseY, aoe.get(i).x, aoe.get(i).y)<15) {
        collision=true;
      } else {
        collision=false;
      }
      i++;
    }
    while (sniper.size()>i) {
      if (dist(mouseX, mouseY, sniper.get(i).x, sniper.get(i).y)<15) {
        collision=true;
      } else {
        collision=false;
      }
      i++;
    }
    while (towers.size()>i) {
      if (dist(mouseX, mouseY, towers.get(i).x, towers.get(i).y)<15 ) {
        collision=true;
      } else {
        collision=false;
      }
      i++;
    }
   

    strokeWeight(4);
    fill(white);
    if (amode==Placed) {
      image(snip, x, y, 80, 80);
    } else if (amode==Placing && mouseX<675  &&  c!=lblue && collision==false ) {
      image(snip, mouseX, mouseY, 100, 100);
      if (mousePressed) {
        amode=Placed;
        x=mouseX;
        y=mouseY;
      }
    }
  }
  void act() {

    cooldown++;
    if (cooldown==threshold) {
      cooldown=0;
      if (mobs.size()> 0) {
        fill(0);
        stroke(255, 0, 0);
        line(x, y, mobs.get(0).x, mobs.get(0).y);
        mobs.get(0).hp--;
      }
    }
  }
}
