//A possible class that holds inheritance over variance of pedestrians, officials 
//and even zombies(potential scoreUp/starWantedDown)

//3 stars wanted level = game over
class Footslogger extends HUD implements Objects {
  float[] fsX = {-50, -250, -350, 450, 650, 750};    // distance apart between pede
  //1      3    5      6     8     12    15      18      19    22      23
  float[] laneY1 = {120, -200, -525, -750, -1350, -2200, -2670, -3120, -3250, -3950, -4100};    //distance between lanes
  //2    4      9      10     13      16    17      20      24
  float[] laneY2 = {0, -400, -1490, -1650, -2350, -2900, -3000, -3600, -4210};
  //7      11     14     21       25
  float[] laneY3 = {-1000, -1910, -2550, -3800, -4370};

  PShape shape;
  float size;
  float speed;
  int wanted;

  Footslogger() {
    size = 30;
    speed = random(1, 10);
    wanted = 0;
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
      fill(#FABE62);
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


    //trump eyebrows
    if (type == "trump" && direction == "right") {
      fill(0);
      strokeWeight(2);
      stroke(2);
      line(x - 1, y + 10, x + 1, y + 3);
      line(x - 1, y - 10, x + 1, y - 3);
    }

    if (type == "trump" && direction == "left") {
      fill(0);
      strokeWeight(2);
      stroke(2);
      line(x + 3, y - 3, x + 5, y - 10);
      line(x + 3, y + 3, x + 5, y + 10);
    }

    //zombie blood and eyes
    if (type == "zombie") {
      fill(#ED1D24);
      ellipse(x - 5, y + 8, size - 26, size - 26);
      ellipse(x + 5, y + 8, size - 26, size - 26);
    }

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
    for (int i = 0; i <= 2; i++) {
      //If fs exceeds width then go back to starting point
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

    //  right side of player           right side of footslogger
    if (pl1.playerPos.x + 50  > x && pl1.playerPos.x < x + 15   
      //  bottom side of player              bot side of fs
      && pl1.playerPos.y + 110 > y && pl1.playerPos.y  < y + 15) { 
      if (type == "trump" || type == "pedestrian") {
        wanted++;
        //peds will then return a blood splat  
        fill(#ED1D24);
        ellipse(x, y, size, size);
        fill(0);
        strokeWeight(2);
        stroke(5);
        line(x - 6, y - 12, x + 6, y + 12);
        line(x + 6, y - 12, x - 6, y + 12);
      } 

      if (type == "zombie" && wanted != 0) {
        //Kill all zombies!
        wanted--;
        fill(#ED1D24);
        ellipse(x, y, size, size);
        fill(0);
        strokeWeight(2);
        stroke(5);
        line(x - 6, y - 12, x + 6, y + 12);
        line(x + 6, y - 12, x - 6, y + 12);
      }

      if (type == "gardai") {
        //Automatic lose when gardai is hit!
        fill(#ED1D24);
        ellipse(x, y, size, size);
        fill(0);
        strokeWeight(2);
        stroke(5);
        line(x - 6, y - 12, x + 6, y + 12);
        line(x + 6, y - 12, x - 6, y + 12);
        wanted += 3;
      }
    }
  }

  void display() {
   
    
    for (int i = 0; i < laneY1.length; i++) {
      lane1(0, landY + laneY1[i]);
      //landY is added so fs don't stay in the screen as game starts
      busted();
    }

    for (int i = 0; i < laneY2.length; i++) {
      fs.lane2(0, landY + laneY2[i]);
      busted();
    }


    for (int i = 0; i < laneY3.length; i++) {
      fs.lane3(0, landY + laneY3[i]);  
      busted();
    }
  }


  void lane1(float x, float y) {
    fill(#07F7E9);
    stroke(#5AABFF);
    strokeWeight(2);
    rect(x, y, width, 60);

    for ( x = 0; x < width; x += 65) {
      fill(#F0FAF9);
      rect(x, y + 10, 15, 40);
    }
    //the contents of FS, the positioning of the FS in lane, etc
    footslog(fsX[0], y + 30, "pedestrian", "right");
    footslog(fsX[1], y + 30, "trump", "right");
    footslog(fsX[2], y + 30, "zombie", "right");
  }

  void lane2(float x, float y) {

    fill(#07F7E9);
    stroke(#5AABFF);
    strokeWeight(2);
    rect(x, y, width, 80);

    for ( x = 0; x < width; x += 100) {
      fill(#F0FAF9);
      rect(x, y + 10, 15, 50);
    }

    //the contents of FS and starting point, the positioning of the FS in lane, etc
    footslog(fsX[0] + 35, y + 30, "pedestrian", "right");
    footslog(fsX[1] + 50, y + 30, "trump", "right");
    footslog(fsX[2] + 60, y + 30, "zombie", "right");
    footslog(fsX[3] - 20, y + 15, "pedestrian", "left");
    footslog(fsX[4] - 45, y + 60, "trump", "left");
    footslog(fsX[5] - 55, y + 60, "gardai", "left");
  }

  void lane3(float x, float y) {

    fill(#07F7E9);
    stroke(#5AABFF);
    strokeWeight(2);
    rect(x, y, width, 140);

    for (x = 0; x < width; x += 250) {
      fill(#F0FAF9); 
      rect(x, y, 50, 15);
    }

    for (x = 0; x < width; x += 185) {
      fill(#F0FAF9); //#1A1002);
      rect(x, y + 125, 70, 15);
    }
    //}


    //the contents of FS, the positioning of the FS in lane, etc
    footslog(fsX[0] - 25, y + 30, "gardai", "left");
    footslog(fsX[1] - 0, y + 30, "gardai", "left");
    footslog(fsX[2] - 10, y + 30, "trump", "right");
    footslog(fsX[3] - 10, y + 115, "pedestrian", "right");
    footslog(fsX[3] - 40, y + 90, "pedestrian", "right");
    footslog(fsX[4] - 50, y + 105, "zombie", "left");
    footslog(fsX[5] - 5, y + 80, "zombie", "left");
  }



  void star(float x, float y) {
    float theta = TWO_PI / 5;
    float halfTheta = theta/2.0;


    beginShape();
    stroke(0);
    for (float i = 1.05; i < TWO_PI; i += theta) {
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
    if (wanted >= 1 && wanted <= 29) {
      star(width - 110, 25);
    } else if ( wanted >= 30 && wanted <= 49) {
      star(width - 110, 25);
      star(width - 140, 25);
    } else if ( wanted >= 50) {
      star(width - 140, 25);
      star(width - 170, 25);
      stateOfGame = 4;
     // game_over = true;
    }

    if (wanted == 1) {
      sound_radio.pause();
      sound_radio.rewind();
      sound_radio.play();
    }
    // if wanted three times, game over and police arrives?
  }
}