//A possible class that holds inheritance over variance of obstacles e.g. Log of trees, train, river
class Obstacle {
  float[] obstacleX = {100, 200, 300, 400, 500, 600, 700, 600, 
    200, -50, 100, 450, 600
  };
  float[] obstacleY = { 570, 570, 570, 570, 570, 570, 570, 200, 
    200, 40, -100, -220, -390, -390
  };

  float size;
  Player pl1;


  Obstacle(Player pl1) {
    //CREATE A FUNCTION TO CHECK AND ENSURE THAT OBSTACLE WOULD NOT SPAWN NEAR THE PLAYER
    size = 55;
    this.pl1 = pl1;
  }

  public void tree(float x, float y, float radius1, float radius2, int npoints) {
    //shape of tree - could be extended to a class (inheritance)
    float theta = TWO_PI / npoints;
    float halfTheta = theta/2.0;
    color trunk = color(#BC7A33);
    color leaves = color(#7DC41C);
    color inter = lerpColor(trunk, leaves, .33);

    fill(#BC7A33);
    stroke(10);
    strokeWeight(0.8);
    ellipse(x, y, radius1 - 15, radius1 - 15);

    beginShape();
    stroke(50);
    strokeWeight(1.2);
    for (float i = 0; i < TWO_PI; i += theta) {
      float sx = x + cos(i) * radius2;
      float sy = y + sin(i) * radius2;
      fill(#7DC41C);
      vertex(sx, sy);
      sx = x + cos(i+halfTheta) * radius1;
      sy = y + sin(i+halfTheta) * radius1;
      vertex(sx, sy);
    }
    endShape(CLOSE);

    beginShape();
    stroke(3);
    strokeWeight(1);
    for (float i = 0; i < TWO_PI; i += theta) {
      fill(inter);
      float px = x + cos(i) * radius1;
      float py = y + sin(i) * radius1;
      vertex(px, py);
      px = x + cos(i+halfTheta + 3) * radius2;  // cool, intricate detail where
      py = y + sin(i+halfTheta + 3) * radius2;  // it shows a hexagram in the centre of the tree
      vertex(px, py);
    }
    endShape(CLOSE);
  }

  public void display(float x, float y) {

    tree(x, y, size, size - 45, 6);
    //  right side of player           right side of obstacle
    if (pl1.playerPos.x + 75  > x && pl1.playerPos.x < x + 15  
      //  bottom side of player  \            bot side of obst
      && pl1.playerPos.y + 110 > y && pl1.playerPos.y  < y + 15) { 
      game_over = true;
    }
  }
}