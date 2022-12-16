//This function draws the PLAY screen

void play() {
  drawMap();
  animateThings();
  drawPlayInterface();
  handlebc();
}

void drawMap() {
  if (mapp == 1) map1();
  else map2();
  int i=0;
  while (i<8) {
    nodes[i].show();
    i++;
  }
}

void drawPlayInterface() {
  fill(0);
  stroke(0);
  strokeWeight(5);
  rect(width, height/2, 250, height);
  textSize(20);
  fill (255);
  text("next wave: " + wave, width/2, 50);
  text("lives:" +lives, 935, 750);
  //text("money:"+coins, 935, 700);
  play.show();
  build.show();
}


void animateThings() {
  int i=0;
  while (i<mobs.size()) {
    Mob myMob=mobs.get(i);
    myMob.act();
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

void handlebc() {
  if (play.clicked) {
    if (mobs.size()<=0) {
      addWave();
    }
  }
  if (build.clicked) {
    mode=BUILD;
  }

  if (lives==0) {
    mode=GAMEOVER;
  }
}

void addWave() {

  int i=0;

  while (i<=wave) {
    mobs.add (new Mob(0+i*30, 350, 1, 0));
    i++;
  }
  wave++;
  if (wave % 3==0) {
    mobs.add (new Speedymob(0+i*30, 350, 1, 0));
  }
  if (wave % 5==0) {
    mobs.add (new Chonkymob(0+i*30, 350, 1, 0));
  }
}
