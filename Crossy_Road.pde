//A game WHERE PLAYER IS THE Footslogger AND THE OBSTACLES ARE PEOPLE TO AVOID
//ADD TIMER SO EACH SCORE IS RECORDED IN THE LEADERBOARD
Player pl1;
Reward gem;
//int size = 5;
//Footslogger FS[] = new Footslogger[size];
//Obstacle obst[] = new Obstacle[3];
ArrayList<Footslogger> FS;
ArrayList<Obstacle> obst;
boolean game_over = false;

void setup() {
  size(850, 700);
  colorMode(HSB);
  smooth();

  //Initialize Player class
  pl1 = new Player();

  //Initialize Reward class
  gem = new Reward(pl1);

  //Initialize Footslogger - pedestrian object
  FS = new ArrayList<Footslogger>();
  
  //HERE
  //Footslogger ped = new Footslogger();
  //FS.add(ped);

  //for (int i = 0; i < FS.length; i++) {
  //  FS[i] = new Footslogger();
  //}

  //Initialize Obstacle - tree object
  obst = new ArrayList<Obstacle>();
  for (int i = 0; i < 3; i++) {
    obst.add(new Obstacle());
  }
  //for (int i = 0; i < obst.length; i++) {
  //  obst[i] = new Obstacle();
  //}
}

void draw() {

  background(0);
  resetUpdate();

  pl1.update();
  pl1.display();

  gem.levelUp();
  gem.display();

  //OR HERE
  //Footslogger ped = new Footslogger();
  //FS.add(ped);

  for (int i = 0; i < FS.size(); i++) {
    Footslogger footS = (Footslogger) FS.get(i);
    footS.run();
  }

  //for (Footslogger ped : FS) {
  //  ped.run();
  //}

  // JUST TO REMOVE ELEMENTS FROM THE ARRAY - FREES UP MEMORY
  //for(int i = 0; i < FS.size(); i++) {
  //FS.get(i);
  //if (FS.size() > 15) { 
  //  FS.remove(0);
  //}
  // }

  for (Obstacle obs : obst) {
    obs.update();
    obs.display();
  }
}


void resetUpdate() {

  for (Footslogger ped : FS) {
    for (Obstacle obs : obst) {
      float pedX = ped.loc.x;
      float pedY = ped.loc.y;
      float FSSize = ped.size;

      float obsX = obs.loc.x;
      float obsY = obs.loc.y;
      float obstize = obs.size;

      // It only executes after Footslogger has passed by width??
      if ( overFS(pedX, pedY, FSSize, FSSize) ) {
        game_over = true;
        println("Game Over!");
      } else if (overObst(obsX, obsY, obstize, obstize)) {
        game_over = true;
        println("Game Over!");
      } else {
        game_over = false;
      }

      while (game_over == true)
      {
        pl1.reset();
      }
    }
  }
}

//THIS BOOLEAN FUNCTION ONLY DETECTS THE X AND Y COORDINATE OF THE OBJECT
//NOT ITS LINES IN THE EDGES!!! MEANING ONLY BOTTOM OF RECT IS DETECTED
boolean overFS(float x, float y, float width, float height) {

  float plyrX = pl1.loc.x;
  float plyrY = pl1.loc.y;

  if (plyrX >= x && plyrX <= x + width && 
    plyrY >= y && plyrY <= y + height) {
    return true;
  } else {
    return false;
  }
}

boolean overObst(float x, float y, float width, float height) {

  float plyrX = pl1.loc.x;
  float plyrY = pl1.loc.y;

  if (plyrX >= x && plyrX <= x + width && 
    plyrY >= y && plyrY <= y + height) {
    return true;
  } else {
    return false;
  }
}

void levelUpCheck() {
  int lvl = gem.level;

  if (lvl == 2) { 
    //ArrayList <Footslogger> footie = new ArrayList<Footslogger>(FS.size()*2);
    //for(int i = 0; i<FS.size(); i++) {
    //  footie[i] = FS[i];
    //}


    //for (Footslogger ped : FS) {
    //  ped.size += 10;
    //}
  }
  //  //Obstacle obst[] = new Obstacle[3];

  //if (lvl == 3) {
  //}
}

//error-check if keys are pressed correctly by user
boolean[] keys = new boolean[1000];

void keyPressed()
{ 
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

boolean checkKey(int k)
{
  if (keys.length >= k) 
  {
    return keys[k] || keys[Character.toUpperCase(k)];
  }
  return false;
}