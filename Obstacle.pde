//A possible class that holds inheritance over variance of obstacles e.g. Log of trees, train, river

//after REWARD(GEM) IS PICKED UP, the level proceeds by having the player move from 
//the top right to bottom left where OBSTACLES ONLY POP OUT after top down camera panning
//(driver player = new location) is finished
class Obstacle {
  PVector loc;
  float size;

  Obstacle() {
    //CREATE A FUNCTION TO CHECK AND ENSURE THAT OBSTACLE WOULD NOT SPAWN NEAR THE PLAYER
    loc = new PVector((random(width)), (random(height)));
    size = 55;

  }

  void create(float x, float y, float radius1, float radius2, int npoints) {
    //shape of tree - could be extended to a class (inheritance)
    float theta = TWO_PI / npoints;
    float halfTheta = theta/2.0;
    beginShape();
    stroke(5);
    fill(#61BF1F);
    strokeWeight(1);

    for (float i = 0; i < TWO_PI; i += theta) {
      float sx = x + cos(i) * radius2;
      float sy = y + sin(i) * radius2;
      vertex(sx, sy);
      sx = x + cos(i+halfTheta) * radius1;
      sy = y + sin(i+halfTheta) * radius1;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }

  void update() {
  }

  void display() {
    //  rect(loc.x, loc.y, size, size-50);
    fill(300, 230, 100);
    pushMatrix(); // Stores the current transform
    translate(loc.x, loc.y);
    stroke(random(20, 45));
    // Initialize the PShape();
    create(0, 0, size, size - 45, 6);
    popMatrix();
  }
}