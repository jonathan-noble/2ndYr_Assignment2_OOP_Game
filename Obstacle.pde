//A possible class that holds inheritance over variance of obstacles e.g. Log of trees, train, river

//after REWARD(GEM) IS PICKED UP, the level proceeds by having the player move from 
//the top right to bottom left where OBSTACLES ONLY POP OUT after top down camera panning
//(driver player = new location) is finished

class Obstacle {
  float[] obstacleX = {width - 20, width - 100, width - 200, width - 300, 
                       width - 400, width - 500, width - 600, width - 700, 
                       width - 780, -50, 100, 450, 600
                      };
  float[] obstacleY = { height - 40, height- 40, height -40, height - 40, 
                       height - 40, height - 40, height - 40, height - 40, 
                       height - 40, 320, 210, 90, 10
                       };

  float size;
  Player pl1;


  Obstacle(Player pl1) {
    //CREATE A FUNCTION TO CHECK AND ENSURE THAT OBSTACLE WOULD NOT SPAWN NEAR THE PLAYER
    size = 55;
    this.pl1 = pl1;
  }

  public void create(float x, float y, float radius1, float radius2, int npoints) {
    //shape of tree - could be extended to a class (inheritance)
    float theta = TWO_PI / npoints;
    float halfTheta = theta/2.0;
    beginShape();
    stroke(5);
    strokeWeight(1);

    for (float i = 0; i < TWO_PI; i += theta) {
      float sx = x + cos(i) * radius2;
      float sy = y + sin(i) * radius2;
      fill(#7DC41C);
      vertex(sx, sy);
      sx = x + cos(i+halfTheta) * radius1;
      sy = y + sin(i+halfTheta) * radius1;
      vertex(sx, sy);

      //fill(#61BF1F);
      //float px = x + cos(i) * radius2;
      //float py = y + sin(i) * radius2;
      //vertex(px - 10, py - 10);
      //px = x + cos(i+halfTheta) * radius1;
      //py = y + sin(i+halfTheta) * radius1;
      //vertex(px - 10, py - 10);
    }
    endShape(CLOSE);
  }

  public void display() {

    fill(300, 230, 100);
    pushMatrix(); // Stores the current transform
    //translate(obstacleX, obstacleY);
    stroke(random(20, 45));
    // Initialize the PShape();
    for (int i = 0; i < obstacleX.length; i++) {
      create(obstacleX[i], obstacleY[i], size, size - 45, 6);
    }
    popMatrix();
  }

  public void gameoverUpdate() {
    for (int i = 0; i < obstacleX.length; i++) {

    

      if (overObst(obstacleX[i], obstacleY[i], size)) {
        game_over = true;
      }
    }
  }


  boolean overObst(float x, float y, float size) {

    float disX = x - pl1.playerPos.x;
    float disY = y - pl1.playerPos.y;

    if (sqrt(sq(disX) + sq(disY)) < size/2) {
      return true;
    } else {
      return false;
    }
  }
}