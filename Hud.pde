// This is the base class for text design and game background! 
// Everything in the scene will extend GameObject
// An abstract class means that:
// You can't instantiate it
// You must make a subclass and instantiate that
// Some of the methods can be abstract. That means they have no body
// If the subclass doesn't implement the abstract methods, then it too is abstract
// You can use abstract classes to ensure that a class has an implementation of the abstract methods

abstract class HUD {

  void gameBG() {

    background(#FF5AF4);  

    //for loop indicates a shaded rect is incrementing to the distance of -4000 from landY
    //y < 600 meaning keep looping until 600
    //y+= 100 meaning the distance between each rects
    for (float y = -4370; y < 600; y += 100) {
      fill(#FF05EF); //#DE12D0);
      rect(0, landY + y, width, 30);
    }

    fill(50, 50, 50, 150);
    rect(0, height-25, width, 25);
    rect(0, 0, 45, height);
    rect(width-45, 0, 45, height);
  }  // end gameBG method

  void textMenu() {

    textFont(font1, 50);
    fill(150, random(50, 100), 255, random(200, 255));
    text("HOLD the Spacebar to PLAY!", 65, 50);


    float x1Pos = 95;
    float x2Pos = 90;
    float xSpeed1 = 5;
    float xSpeed2 = -5;

    x1Pos += xSpeed1;
    x2Pos += xSpeed2;

    //if (x1Pos > width) {
    //  x1Pos = 0;
    //}

    //if (x2Pos > 0) {
    //  x2Pos = width;
    //}

    textFont(font1, 110);
    fill(255, 255, 255, 220);
    text("Grand Theft", x1Pos, 370);
    fill(255, 220);
    text("Crossy Road", x2Pos, 450);




    //hud for credit
    textFont(font2, 35);
    fill(255, 230);
    text("Credit: " + 1, 50, height - 50);
  }

  void textDesign() {

    textAlign(LEFT, CENTER);

    //hud for credit
    textFont(font2, 35);
    fill(255, 230);
    text("Credit: " + 0, 50, height - 50);

    //hud for player's gas and gear
    textFont(font2, 35);
    fill(255, 255);
    text("Gas: " + pl1.gas, ifaceX - 200, ifaceY); 
    text("Gear " + pl1.gear, ifaceX, ifaceY);

    // hud for score
    textFont(font2, 35);
    fill(255, 255);
    text("Quid: €" + score, ifaceX - 400, ifaceY);

    textFont(font2, 25);
    fill(255, 255);
    text("Speed: " + int(pl1.speed*10) + "km/h", ifaceX + 50, ifaceY + 625);

    textFont(font2, 15);
    fill(255, 255);
    text("FPS: " + int(frameRate), 50, height - 70);
  }
}