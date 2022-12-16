void mapp() {
  image(cat1, width/2,height/2, width, height);
   //image(background3, 200, 200, 100, 75);
 // image(background4, width/2, 200, 100, 75);
  image(background3, width/2-150, 350, 180, 130);
  image(background4, width/2+150, 350, 180, 130);
  map1.show();
  map2.show();
  if (map1.clicked) {
    mapp=1;
    nodes=m1n;
    mode=PLAY;
  }
  if (map2.clicked) {
    mapp=2;
    nodes=m2n;
    mode=PLAY;
  }
}
void map1() {
background (0);
 image(background3, width/2, height/2-50, width+100, height+100);
  fill(lblue);
  text(mouseX+","+ mouseY, mouseX, mouseY-20);
  //path
  stroke(lblue);
  strokeWeight(50);
  line(0, 350, 150, 350);
  line(150, 350, 150, 150);
  line(150, 150, 350, 150);
  line(350, 150, 350, 650);
  line(350, 650, 600, 650);
  line(600, 650, 600, 500);
  line(600, 500, 800, 500);
  line(800, 500, 800, 300);
  line(800, 300, 1000, 300);
}

void map2() {
  background (0);
  image(background4, width/2, height/2, width, height);

  fill(lblue);
  text(mouseX+","+ mouseY, mouseX, mouseY-20);
  //path
  stroke(lblue);
  strokeWeight(50);
  line(0, 350, 150, 350);
  line(150, 350, 150, 150);
  line(150, 150, 350, 150);
  line(350, 150, 350, 650);
  line(350, 650, 600, 650);
  line(600, 650, 600, 500);
  line(600, 500, 800, 500);
  line(800, 500, 800, 300);
  line(800, 300, 1000, 300);
}
