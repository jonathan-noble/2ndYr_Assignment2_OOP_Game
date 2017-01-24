//A game WHERE PLAYER IS THE Footslogger AND THE OBSTACLES ARE PEOPLE TO AVOID
//ADD TIMER SO EACH SCORE IS RECORDED IN THE LEADERBOARD
Player pl1;
Footslogger peds[] = new Footslogger[5];
Reward gem;
boolean game_over = false;

void setup() {
  size(850, 700);
  color(HSB);
  smooth();

  //Initialize Player class
  pl1 = new Player();

  //Initialize Reward class
  gem = new Reward(pl1);

  //Initialize Footslogger - ped class
  for (int i = 0; i < peds.length; i++) {
    peds[i] = new Footslogger();
  }
}

void draw() {

  background(0);
  resetUpdate();
  pl1.update();
  pl1.display();

  gem.update();
  gem.display();

  for (Footslogger ped : peds) {
    ped.update();
    ped.display();
  }
}

void resetUpdate() {

  for (Footslogger ped : peds) {
    float pedX = ped.loc.x;
    float pedY = ped.loc.y;
    float pedSize = ped.size;

    // It only executes after Footslogger has passed by width??
    if ( vehOver(pedX, pedY, pedSize, pedSize) ) {
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

boolean vehOver(float x, float y, float width, float height) {

  float plyrX = pl1.loc.x;
  float plyrY = pl1.loc.y;

  if (plyrX >= x && plyrX <= x + width && 
    plyrY >= y && plyrY <= y + height) {
    return true;
  } else {
    return false;
  }
}