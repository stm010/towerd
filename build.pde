//This function draws the BUILD screen

void build() {
   drawbMap();
  animatebThings();
  drawbPlayInterface();
  handleb2c();

}
void drawbMap() {

  if(mapp == 1) map1();
  else map2();
  int i=0;
  while (i<8) {
    nodes[i].show();
    i++;
  }
}


void drawbPlayInterface() {
 fill(0);
  stroke(0);
  strokeWeight(5);
  rect(width, height/2, 250, height);
  textSize(20);
  fill (255);
   text("next wave: " + wave, width/2, 50);
   text("lives:" +lives, 935, 750);
  text("money:"+coins, 935, 700);
  build.show();
   sn.show();
  gun.show();
  ao.show();
 
}


void animatebThings() {
  int i=0;
  while (i<mobs.size()) {
    Mob myMob=mobs.get(i);
   // myMob.act();
    myMob.show();
    if (myMob.hp<=0) {
      mobs.remove(i);
    } else {

      i++;
    }
  }
  i=0;
  while (i<towers.size()) {
    Tower myTower =towers.get(i);
    myTower.act();
    myTower.show();
    i++;
  }
   i=0;
  while (i<aoe.size()) {
    AoE_Ring myAoe =aoe.get(i);
    myAoe.act();
    myAoe.show();
    i++;
  }
   i=0;
  while (i<sniper.size()) {
    Sniper mySnip =sniper.get(i);
    mySnip.act();
    mySnip.show();
    i++;
  }
  
  
  i=0;
  while (i<bullets.size()) {
    Bullet myBullet =bullets.get(i);
    myBullet.act();
    myBullet.show();
    if (myBullet.hp<=0) {
      bullets.remove(i);
    } else {
      i++;
    }
  }
}

void handleb2c() {
   if (gun.clicked && coins>=5) {

    towers.add(new Tower(0, 0, 0, 30));
    coins=coins-5;
  }
  
     if (tower.clicked && coins>=25){
    sniper.add(new Sniper(0,0,0,30));
    coins=coins-10;
  }
  
  if(ao.clicked && coins>=10){
    aoe.add(new AoE_Ring(0,0,0,30,5));
    coins=coins-20;
    
  }

 
  if (build.clicked) {
    mode=PLAY;
  }
}
