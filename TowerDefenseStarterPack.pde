//Tower Defense Game
//Sidney
//Programming 12

// ================ GLOBAL VARIABLES =================

final int INTRO    = 0;
final int PLAY     = 1;
final int BUILD    = 2;
final int GAMEOVER = 3;
final int MAP = 4;

int mode, wave, lives, coins;
//int map;
int mapp;

//Pallette
color white  = #ffffff;
color black  = #000000;
color lpink = #EAB4A8;
color mpink = #BA7C9D;
color dpink = #AD6983;
color lviolet = #8B648B;
color dviolet  = #5B4A6F;
color lblue = #5860B5;
color mblue = #445967;
color dblue = #474F91;
color tan = #EFC8B4;


//Mouse & Keyboard interaction variables
boolean mouseReleased;
boolean wasPressed;

//Buttons
Button start, play, build, gun, tower, sn, ao, go, map1, map2;

//Collections of objects
Node[]nodes, m1n, m2n;
ArrayList<Mob>mobs; //<type>
ArrayList<Tower>towers; //<object> name of arraylist
ArrayList<Bullet>bullets;
ArrayList <AoE_Ring>aoe;
ArrayList <Sniper>sniper;

//Images and Gifs
PImage cake, cat1, cat2, cat3, dog1, dog2, snip, tow, aoee;
PImage background, background2, background3, background4;
PImage[] introgif;
int n; //numberOfFrames
int f; //frame

int s = 1;
//Fonts
PFont f1, f2, f3;

// ===================== SETUP =========================

void setup() {
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  size(1000, 800);

  initializeModes();
  initializeVariables();
  makeButtons();
  makeNodes();
  //introgif
  n = 14;
  introgif = new PImage [n];
  wave=0;
   coins = 100;
   lives=3;
  int i = 0;
  while (i<n) {
    //introgif [i] = loadImage("background2/frame_"+i+"_delay-0.04s.gif"); //folder /load gif
    introgif [i] = loadImage("background/frame_"+i+"_delay-0.1s.gif"); //folder /load gif
    i = i+1;
  }
}

void initializeModes() {
  //set up the default mode for things
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  mode = INTRO;
}

void initializeVariables() {
  //Load Images & Gifs
  cake = loadImage ("cake.png");
   // background = loadImage ("intro.jpg");
   //background2 = loadImage ("intro2.jpg");
   background3 = loadImage ("background3.png");
   background4 = loadImage ("background4.png");
  cat1 = loadImage ("cat1.png");
  cat2 = loadImage ("cat2.png");
  cat3 = loadImage ("cat3.png");
  dog1 = loadImage ("dog1.png");
  dog2 = loadImage ("dog2.png");
snip = loadImage ("sniper.png");
tow = loadImage ("tower.png");
aoee = loadImage ("aoe.png");
  //Load Fonts
  //f1 = createFont ("Pulang.ttf", 50);
  f2 = createFont ("coffee.ttf", 50);
  f3 = createFont ("BLOBBYCHUG.ttf", 50);

  //Create Collections of Objects
  mobs = new ArrayList <Mob>(); //<type> () constructor for array list - no size (starts w size 0)
  towers = new ArrayList <Tower>();
  bullets = new ArrayList <Bullet>();
  aoe = new ArrayList <AoE_Ring>();
  sniper = new ArrayList <Sniper>();
  //test towers
  //towers.add (new Tower(100, 100, 0, 100)); //x,y,cooldown,threshold
}

void makeButtons() {
  //INTRO - Start
  textFont(f3);
  start = new Button("START", width/2, height/2, 300, 100, white, lpink); //start button

  //PLAY - Next Wave, To Build Mode
  // fill (lpink);
  play= new Button("wave", 935, 100, 80, 50, dblue, white); //spawn button
  build = new Button ("build", 935, 200, 80, 50, dblue, white);
  gun = new Button ("tower", 935, 300, 80, 50, dblue, white);
  tower=new Button ("tower", 935, 400, 80, 50, dblue, white);
  sn = new Button ("sniper", 935, 400, 80, 50, dblue, white);
  ao =new Button ("aoe", 935, 500, 80, 50, dblue, white);
  map1=new Button("map 2", width/2-150, 500, 82, 50, dblue, white);
  map2=new Button("map 1", width/2+150, 500, 82, 50, dblue, white);
//  go=new Button("go", width/2, height/2, 82, 50, dblue, white);
  //BUILD - To play mode, Buy Sniper, Buy Gun, Buy AoE

  //GAMEOVER - Reset
}

void makeNodes() {
  //Plot the nodes on the map
  m1n=new Node[8];
  m1n[0]=new Node(150, 350, 0, -1);
  m1n[1]=new Node(150, 150, 1, 0);
  m1n[2]=new Node(350, 150, 0, 1);
  m1n[3]=new Node(350, 650, 1, 0);
  m1n[4]=new Node(600, 650, 0, -1);
  m1n[5]=new Node(600, 500, 1, 0);
  m1n[6]=new Node(800, 500, 0, -1);
  m1n[7]=new Node(800, 300, 1, 0);

  m2n = new Node[8];
  m2n[0]=new Node(150, 350, 0, -1);
  m2n[1]=new Node(150, 150, 1, 0);
  m2n[2]=new Node(350, 150, 0, 1);
  m2n[3]=new Node(350, 650, 1, 0);
  m2n[4]=new Node(600, 650, 0, -1);
  m2n[5]=new Node(600, 500, 1, 0);
  m2n[6]=new Node(800, 500, 0, -1);
  m2n[7]=new Node(800, 300, 1, 0);
}

// ===================== DRAW ===========================

void draw() {
  click();
  if (mode == INTRO) {
    intro();
  } else if (mode == PLAY) {
    play();
  } else if (mode == BUILD) {
    build();
  } else if (mode == GAMEOVER) {
    gameOver();
  } else if (mode == MAP) {
    mapp();
  }
}
  //textSize (50);
  //fill (255);
  //text (mouseX + " , " + mouseY, mouseX, mouseY-20);
