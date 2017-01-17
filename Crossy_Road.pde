Player pl1;

void setup() {
  size(700, 700);
  color(HSB);

  //Initialize Player class
  pl1 = new Player();
}

void draw() {

  background(0);
  pl1.update();
  pl1.display();
}