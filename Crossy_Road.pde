Player pl1;
Vehicle cars[] = new Vehicle[3];

void setup() {
  size(700, 700);
  color(HSB);

  //Initialize Player class
  pl1 = new Player();

  //Initialize Vehicle - car class
  for (int i = 0; i < cars.length; i++) {
    cars[i] = new Vehicle();
  }
}

void draw() {

  background(0);
  pl1.update();
  pl1.display();


  for (Vehicle car : cars) {
    car.update();
    car.display();
  }
}