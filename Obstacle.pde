//A possible class that holds inheritance over variance of obstacles e.g. Log of trees, train, river

//after REWARD(GEM) IS PICKED UP, the level proceeds by having the player move from 
//the top right to bottom left where OBSTACLES ONLY POP OUT after top down camera panning
//(driver player = new location) is finished
class Obstacle {
  PShape shape;
  PVector loc;
  float size;

  Obstacle() {
    //CREATE A FUNCTION TO CHECK AND ENSURE THAT OBSTACLE WOULD NOT SPAWN NEAR THE PLAYER
    loc = new PVector((random(width)), (random(height)));
    size = 80;

    create();
  }

  void create() {
    //shape of tree - could be extended to a class (inheritance)
    shape = createShape(); 
    shape.beginShape();
    shape.stroke(5);
    shape.fill(255);
    shape.strokeWeight(2);
    shape.vertex(-35, 43);
    shape.vertex(35, 43);
    shape.vertex(-10 , - 25);  
    shape.vertex(0,0);
    //shape.vertex(15, - 23);
    //shape.vertex(30, -30);
    //shape.vertex(50, 50);
    //shape.vertex(-50, 50);
    shape.endShape(CLOSE);
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
    shape(shape, 0, 0);
    popMatrix();
  }
}