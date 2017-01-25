//A game WHERE PLAYER IS THE Footslogger AND THE OBSTACLES ARE PEOPLE TO AVOID
//ADD TIMER SO EACH SCORE IS RECORDED IN THE LEADERBOARD
Player pl1;
Reward gem;
Footslogger peds[] = new Footslogger[5];
Obstacle trees[] = new Obstacle[3];
boolean game_over = false;

void setup() {
  size(850, 700);
  colorMode(HSB);
  smooth();

  //Initialize Player class
  pl1 = new Player();

  //Initialize Reward class
  gem = new Reward(pl1);

  //Initialize Footslogger - ped class
  for (int i = 0; i < peds.length; i++) {
    peds[i] = new Footslogger();
  }

  for (int i = 0; i < trees.length; i++) {
    trees[i] = new Obstacle();
  }
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

  for (Obstacle tree : trees) {
    tree.update();
    tree.display();
  }
}

void resetUpdate() {

  for (Footslogger ped : peds) {
    for (Obstacle tree : trees) {
      float pedX = ped.loc.x;
      float pedY = ped.loc.y;
      float pedSize = ped.size;

      float treeX = tree.loc.x;
      float treeY = tree.loc.y;
      float treeSize = tree.size;

      // It only executes after Footslogger has passed by width??
      if ( overPed(pedX, pedY, pedSize, pedSize) ) {
        game_over = true;
        println("Game Over!");
      } else if (overObst(treeX, treeY, treeSize, treeSize)) {
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

//void levelUpCheck() {
//  int lvl = gem.level;

//  if (lvl == 2) { 
//    for (int i = 0; i < peds.length; i++) {
//      peds.length * 2;
//    }

//    Obstacle trees[] = new Obstacle[3];

//    if (lvl == 3) {
//    }
//  }
//}