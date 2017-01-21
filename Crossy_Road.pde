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

  //Initialize reset function
}

void draw() {

  background(0);
  pl1.update();
  pl1.display();

  gem.update();
  gem.display();

  for (Vehicle car : cars) {
    car.update();
    car.display();
  }
}

void reset() {

  for (Vehicle car : cars) {

    float plyrX = pl1.loc.x;
    float plyrY = pl1.loc.y; 
    float carX = car.loc.x;
    float carY = car.loc.y;

    if (plyrX >= carX && plyrY >= carY)
    {
      game_over = true;
      return;
    }
  }

  while (game_over == true)
  {
    println("Game Over!");
  }
}