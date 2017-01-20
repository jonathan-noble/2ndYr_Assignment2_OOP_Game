Player pl1;
Vehicle cars[] = new Vehicle[5];

void setup() {
  size(850, 700);
  color(HSB);
  smooth();

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