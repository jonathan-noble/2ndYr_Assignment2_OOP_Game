//A possible class that holds inheritance over variance of pedestrians, animalofficials and even zombies
class Footslogger {
  //x
  float[] fsX = {-50, -250, -350, 450, 650, 750};    // distance apart between pede
  float[] laneY1 = {100, 25, -650, -750, -900, -1550, -1725};
  float[] laneY2 = {-50, -400, -1200, -1325, -1500, -1650, -1800, -1875};
  float[] laneY3 = {-600, -1100, -2125};

  PShape shape;
  float size;
  float speed;
  Player pl1;

  Footslogger(Player pl1) {
    //CREATE A FUNCTION TO CHECK AND ENSURE THAT FtSlogger WOULD NOT SPAWN NEAR THE PLAYER
    size = 35;
    speed = random(1, 10);
    this.pl1 = pl1;
  }

  void footslog(float x, float y, String type, String direction) {
    noStroke();

    if (type == "pedestrian") {
      fill(#F2BC07);
    } else if (type == "zombie") {
      fill(#7FC142);
    } else if (type == "gardai" ) {
      fill(#021F05);
    } else if (type == "trump") {
      fill(#F5EE0F);
    }
    ellipse(x, y, size, size);

    if (type == "pedestrian") {
      fill(#2227A7);
    } else if (type == "zombie") {
      fill(#7FC142);
    } else if (type == "gardai" ) {
      fill(#21F013);
    } else if (type == "trump") {
      fill(#1F1601);
    } 
    rect(x, y + 5, 45, 10);

    //arms
    rect(x + 5, y + 20, 12, 2);
    rect(x + 28, y + 20, 12, 2);

    //legs determining direction of FS
    if (direction == "right") {
      rect(x + 10, y + 6, 5, 8);
    }

    if (direction == "left") {
      rect(x + 25, y + 6, 5, 8);
    }

    for (int i = 0; i <= 2; i++) {
      if (fsX[i] > width) {
        fsX[i] = -75;
      }
    }

    for (int i = 3; i <= 5; i++) {
      if (fsX[i] < -50) {
        fsX[i] = width;
      }
    }

    if (pl1.playerPos.x + 25 > x && pl1.playerPos.x < x + 45 
      && pl1.playerPos.y + 25 > y && pl1.playerPos.y  < y + 20) {
      game_over = true;
    }
  }


  void lane1(float x, float y) {
    fill(75);
    rect(x, y, width, 25);

    footslog(fsX[0], y + 2, "pedestrian", "right");
    footslog(fsX[1], y + 2, "trump", "right");
    footslog(fsX[2], y + 2, "zombie", "right");
  }

  void road2(float x, float y) {

    fill(75);
    rect(x, y, width, 50);

    for ( x = 20; x < 400; x += 65) {
      fill(100);
      rect(x, y + 22, 35, 5);
    }
    
    
    //x
    footslog(fsX[0], y + 2, "pedestrian", "right");
    footslog(fsX[1], y + 2, "trump", "right");
    footslog(fsX[2], y + 2, "zombie", "right");
    footslog(fsX[3], y + 2, "pedestrian", "right");
    footslog(fsX[4], y + 2, "trump", "right");
    footslog(fsX[5], y + 2, "zombie", "right");
  }
  
  
}