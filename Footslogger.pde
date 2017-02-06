//A possible class that holds inheritance over variance of pedestrians, officials 
//and even zombies(potential scoreUp/starWantedDown)

//3 stars wanted level = game over
class Footslogger {
  //x
  float[] fsX = {-50, -250, -350, 450, 650, 750};    // distance apart between pede
  float[] laneY1 = {100, 25, -650, -750, -900, -1550, -1725};    //distance between lanes
  float[] laneY2 = {-120, -400, -1200, -1325, -1500, -1650, -1800, -1875};
  float[] laneY3 = {-600, -1100, -2125};

  PShape shape;
  float size;
  float speed;
  int wanted;
  Player pl1;

  Footslogger(Player pl1) {
    size = 30;
    speed = random(1, 10);
    wanted = 0;
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
      rect(x - 16, y - 12, 5, 23);
    } else if (type == "trump") {
      fill(#FF8A0D);
    }
    ellipse(x, y, size, size);

    //arms
    fill(0);
    rect(x - 2, y - 24, 4, 7.5);
    rect(x - 2, y + 15, 4, 7.5);

    //face determining direction of FS
    if (direction == "right" && type != "gardai") {
      rect(x + 5, y + 3, 4, 6);
      rect(x + 5, y - 12, 4, 6);
    }

    if (direction == "left" && type != "gardai") {
      rect(x - 5, y + 3, 4, 6);
      rect(x - 5, y - 12, 4, 6);
    }

    // linked to the index of the ternary operator ( i > 2)
    //True since index produced is more than 2
    for (int i = 1; i <= 3; i++) {
      if (fsX[i] > width) {
        //The starting point of the FS
        fsX[i] = -75;
      }
    }
    //False
    for (int i = 3; i <= 5; i++) {
      if (fsX[i] < -50) {
        fsX[i] = width;
      }
    }
    
     //for (int i = 0; i <= 3; i++) {
     // if (fsX[i] > width ) {
     //   //The starting point of the FS
     //   fsX[i] = -90;
     // }
   // }//

    //  right side of player           right side of footslogger
    if (pl1.playerPos.x + 50  > x && pl1.playerPos.x < x + 15   
      //  bottom side of player              bot side of fs
      && pl1.playerPos.y + 110 > y && pl1.playerPos.y  < y + 15) { 
      if (type == "trump" || type == "pedestrian") {
        wanted++;
        //peds will then return a blood splat  
        fill(#ED1D24);
        ellipse(x, y, size, size);
      } 

      if (type == "zombie" && wanted != 0) {
        //Kill all zombies!
        wanted--;
        fill(#ED1D24);
        ellipse(x, y, size, size);
      }

      if (type == "gardai") {
        //Automatic lose when gardai is hit!
        fill(#ED1D24);
        ellipse(x, y, size, size);
        game_over = true;
      }
    }
  }


  void lane1(float x, float y) {
    fill(#07F7E9);
    stroke(#5AABFF);
    strokeWeight(2);
    rect(x, y, width, 60);

    for ( x = 20; x < 800; x += 65) {
      fill(#F0FAF9);
      rect(x, y + 10, 15, 40);
    }

    footslog(fsX[0], y + 30, "pedestrian", "right");
    footslog(fsX[1], y + 30, "trump", "right");
    footslog(fsX[2], y + 30, "zombie", "right");

    busted();
  }

  void lane2(float x, float y) {

    fill(#07F7E9);
    stroke(#5AABFF);
    strokeWeight(2);
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
    footslog(fsX[5], y + 60, "gardai", "left");

    busted();
  }

  void star(float x, float y) {
    float theta = TWO_PI / 5;
    float halfTheta = theta/2.0;


    beginShape();
    stroke(0);
    for (float i = 0; i < TWO_PI; i += theta) {
      float sx = x + cos(i) * 14;
      float sy = y + sin(i) * 14;
      fill(255);
      vertex(sx, sy);
      sx = x + cos(i+halfTheta) * 5;
      sy = y + sin(i+halfTheta) * 5;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }

  void busted() {
    //if wanted incremented, one star is lit up 
    if (wanted >= 1 && wanted <= 9) {
      star(width - 110, 25);
      // background(0);
    } else if ( wanted >= 10 && wanted <= 24) {
      star(width - 110, 25);
      star(width - 145, 25);
    } else if ( wanted == 25) {
      star(width - 145, 25);
      star(width - 170, 25);
      game_over = true;
    }
    // if wanted three times, game over and police arrives?

    //println(wanted);
  }
}