//A game WHERE PLAYER IS THE Footslogger AND THE OBSTACLES ARE PEOPLE TO AVOID
//ADD TIMER SO EACH SCORE IS RECORDED IN THE LEADERBOARD
Player pl1;
Reward gem;
//int size = 5;
//Footslogger peds[] = new Footslogger[size];
//Obstacle obst[] = new Obstacle[3];
ArrayList<Footslogger> peds;
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
  peds = new ArrayList<Footslogger>();
  for (int i = 0; i < 5; i++) {
    peds.add(new Footslogger());
  }
  //for (int i = 0; i < peds.length; i++) {
  //  peds[i] = new Footslogger();
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

  for (Footslogger ped : peds) {
    ped.update();
    ped.display();
  }

// JUST TO REMOVE ELEMENTS FROM THE ARRAY - FREES UP MEMORY
   //for(int i = 0; i < peds.size(); i++) {
   //peds.get(i);
  //if (peds.size() > 15) { 
  //  peds.remove(0);
  //}
  // }

  for (Obstacle obs : obst) {
    obs.update();
    obs.display();
  }
}

void resetUpdate() {

  for (Footslogger ped : peds) {
    for (Obstacle obs : obst) {
      float pedX = ped.loc.x;
      float pedY = ped.loc.y;
      float pedSize = ped.size;

      float obsX = obs.loc.x;
      float obsY = obs.loc.y;
      float obstize = obs.size;

      // It only executes after Footslogger has passed by width??
      if ( overPed(pedX, pedY, pedSize, pedSize) ) {
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
boolean overPed(float x, float y, float width, float height) {

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



  if (lvl <= 5) { 
    for (Footslogger ped : peds) {
      ped.size += 4;
    }
  }
  //Obstacle obst[] = new Obstacle[3];

  //if (lvl == 3) {
  //}
}