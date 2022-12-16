//This function draws the INTRO screen.

void intro() {
  // image(background2, width/2, height/2, width, height);
  background (0);
  image (introgif[f], width/2, height/2, width, height);
  f = f + 1;
  if (f == n) f = 0;

  //ellipse(width/3, height-155,177,145);
  start.show(); //start button
  if (start.clicked) {
    mode=MAP;
  }
}
