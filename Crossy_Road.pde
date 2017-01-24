//POSSIBLE OPTION WHERE PLAYER IS THE VEHICLE AND THE OBSTACLES ARE PEOPLE TO AVOID
// MORE OR LESS LIKE GTA 
//ADD TIMER SO EACH SCORE IS RECORDED IN THE LEADERBOARD
Player pl1;
Vehicle cars[] = new Vehicle[5];
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

  //Initialize Vehicle - car class
  for (int i = 0; i < cars.length; i++) {
    cars[i] = new Vehicle();
  }
}

void draw() {

  background(0);
  resetUpdate();
  pl1.update();
  pl1.display();

  gem.update();
  gem.display();

  for (Vehicle car : cars) {
    car.update();
    car.display();
  }
}

void resetUpdate() {

  for (Vehicle car : cars) {
    float carX = car.loc.x;
    float carY = car.loc.y;
    float carSize = car.size;

    // It only executes after vehicle has passed by width??
    if ( vehOver(carX, carY, carSize, carSize) ) {
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