//A possible class that holds inheritance over variance of pedestrians, officials 
//and even zombies(potential scoreUp/starWantedDown)
class Footslogger {
  //x
  float[] fsX = {-50, -250, -350, 450, 650, 750};    // distance apart between pede
  float[] laneY1 = {100, 25, -650, -750, -900, -1550, -1725};    //distance between lanes
  float[] laneY2 = {-120, -400, -1200, -1325, -1500, -1650, -1800, -1875};
  float[] laneY3 = {-600, -1100, -2125};

  PShape shape;
  float size;
  float speed;
  Player pl1;

  Footslogger(Player pl1) {
    //CREATE A FUNCTION TO CHECK AND ENSURE THAT FtSlogger WOULD NOT SPAWN NEAR THE PLAYER
    size = 30;
    speed = random(1, 10);
    this.pl1 = pl1;
  }

  void footslog(float x, float y, String type, String direction) {
    noStroke();

    if (type == "pedestrian") {
      fill(#2227A7);
    } else if (type == "zombie") {
      fill(#FFFAF0);
    } else if (type == "gardai" ) {
      fill(#21F013);
    } else if (type == "trump") {
      fill(#1F1601);
    } 
    rect(x-17, y-17, size, size);


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

    //arms
    fill(0);
    rect(x - 2, y - 24, 4, 7.5);
    rect(x - 2, y + 17, 4, 7.5);

    //face determining direction of FS
    if (direction == "right") {
      rect(x + 5, y + 3, 4, 6);
      rect(x + 5, y - 12, 4, 6);
    }

    if (direction == "left") {
      rect(x - 5, y + 3, 4, 6);
      rect(x - 5, y - 12, 4, 6);
    }


    for (int i = 1; i <= 3; i++) {
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
    noStroke();
    fill(#07F7E9);
    rect(x, y, width, 60);

    for ( x = 20; x < 800; x += 65) {
      fill(#F0FAF9);
      rect(x, y + 10, 15, 40);
    }

    footslog(fsX[0], y + 30, "pedestrian", "right");
    footslog(fsX[1], y + 30, "trump", "right");
    footslog(fsX[2], y + 30, "zombie", "right");
  }

  void lane2(float x, float y) {

    fill(#07F7E9);
    rect(x, y, width, 75);

    for ( x = 20; x < 800; x += 65) {
      fill(#F0FAF9);
      rect(x, y + 10, 15, 50);
    }


    //x
    footslog(fsX[0], y + 30, "pedestrian", "right");
    footslog(fsX[1], y + 30, "trump", "right");
    footslog(fsX[2], y + 30, "zombie", "right");
    footslog(fsX[3], y + 15, "pedestrian", "left");
    footslog(fsX[4], y + 60, "trump", "left");
    footslog(fsX[5], y + 60, "zombie", "left");
  }
}