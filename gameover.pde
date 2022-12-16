//This function draws the GAMEOVER screen.

void gameOver() {
  background (0);
   go.show();
  if(go.clicked){
    mode=INTRO;
    reset();
  }
}
