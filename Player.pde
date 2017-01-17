class Player {
  PVector loc;
  PVector vel;
  
  Player() {
    loc = new PVector(width/15, height/1.2);
    vel = new PVector(0, 0);
  }
  
  void update() {
   vel.add(loc);
  }
  
  void display() {
    stroke(random(20,45));
    rect(loc.x, loc.y, 50, 50);
    
  }
}