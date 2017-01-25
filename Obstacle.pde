//A possible class that holds inheritance over variance of obstacles

//after REWARD(GEM) IS PICKED UP, the level proceeds by having the player move from 
//the top right to bottom left where OBSTACLES ONLY POP OUT after top down camera panning
//(driver player = new location) is finished
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
    rect(loc.x, loc.y, size, size-50);
    
  }
  
}