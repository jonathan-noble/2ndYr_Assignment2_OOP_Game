class Reward {
  PVector loc;
  float size;

  Reward() {
    loc = new PVector((random(width)), (random(height)));
    size = 25;
  }

  void display() {
    fill(255);
    ellipse(loc.x, loc.y, size, size);
  }
}