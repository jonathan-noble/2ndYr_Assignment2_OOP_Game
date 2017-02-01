class Reward {
  PVector loc;
  PImage statue;
  float size;

  Reward() {
    loc = new PVector((random(width)), (random(height)));
    size = 50;
    statue = loadImage("statue.png");
  }

  void display() {
    fill(255);
    //ellipse(loc.x, loc.y - 5, size, size);
    image(statue, loc.x, loc.y, size, size);
  }
}