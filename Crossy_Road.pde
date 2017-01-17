Player pl1;

void setup() {
  size(700, 700);
  color(HSB);
  pl1 = new Player();
}
  
void draw() {
 pl1.update();
 pl1.display();
}