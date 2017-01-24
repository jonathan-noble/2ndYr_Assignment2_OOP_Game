class Obstacle {
  PVector loc;
  float size;
  
  Obstacle() {
    loc = new PVector((random(width)), (random(height)));
    size = 80;
  }
  
  void update() {
  }
  
  void display() {
    ellipse(loc.x, loc.y, size, size-50);
    
  }
  
}