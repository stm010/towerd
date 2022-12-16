//A Tower is the player's main defense against the mobs.
//Towers are placed on the maps and then automatically
//act. There are 3 kinds of towers (but you can make more!)

//Gun Tower: These towers shoot bullets that fly across
//           the screen and do damage to mobs.

//AoE Tower: These towers place AoE_Rings that deal damage
//           to all mobs in the ring.

//Sniper Tower: These towers automatically target the first
//              mob no matter where they are on the scren.

class Tower {
  final int Placing=0;
  final int Placed=1;
  float x, y;
  int cooldown, threshold, tmode;
  boolean collision;
  Tower(float _x, float _y, int c, int th) { //parameters to assign to instance variables
    //constructor
    x=_x;
    y=_y;
    cooldown=c; //"countdown" counts up to threshold
    threshold=th; //the smaller the threshold, the faster the shooting
    tmode = Placing;
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
    fill(black);
    if (tmode==Placed) {
      image(tow, x, y, 80, 80);
    } else if (tmode==Placing && mouseX<675  &&  c!=lblue && collision==false) {
  
      image(tow, mouseX, mouseY, 100, 100);
      if (mousePressed) {
        tmode=Placed;
        x=mouseX;
        y=mouseY;
       
      }
   
    }
  }
  void act() {
    cooldown++;
    if (cooldown >= threshold) {
      cooldown=0; //reset cooldown
      if (mobs.size() > 0) {
        bullets.add(new Bullet(x, y, 0, -10, 10)); //in this class, x and y are tower's x and y
        bullets.add(new Bullet(x, y, 0, 10, 10));
        bullets.add(new Bullet(x, y, -10, 0, 10));
        bullets.add(new Bullet(x, y, 10, 0, 10));
      }
    }
 int i=0;
    while (i<aoe.size() && i<sniper.size() && i<towers.size()) {
      if (dist(mouseX, mouseY, aoe.get(i).x, aoe.get(i).y)<15 && dist(mouseX, mouseY, sniper.get(i).x, sniper.get(i).y)<15 && dist(mouseX, mouseY, towers.get(i).x, towers.get(i).y)<15 ) {
        collision=true;
      } else {
        collision=false;
      }
      i++;
    }
  }
}
