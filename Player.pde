//A possible class that holds inheritance over character selection of vehicles

//key space is pressed to accelerate 
//BUT every time space(gear) is pressed, gear is changed sequentially to make the player
//accelerate in random speed and magnitude, G1-G6 then back to G1
class Player {
  PImage[] cars;
  PVector playerPos;
  PVector vel;
  PVector acc;
  PVector control;
  float speed;
  int gas;
  int gear;
  float radius;
  float size;

  Player() {
    playerPos = new PVector(width/2.2, height/1.3);
    vel = new PVector(0, 0);
    speed = 2;
    gas = 0;
    gear = 1;
    size = 60;
    cars = new PImage[3];
  }


  public void run() {
    display();
    update();
  }

  public void levelUpdate() {
    playerPos = new PVector(width/30, height/1.05);
  }

  //public void charSelect() {//PImage character) {
  //}

  public void display() {
    //if(! space pressed then
    //choose characters between 1, 2, and 3 
    for (int i = 0; i < cars.length; i++) {
      cars[i] = loadImage( i + ".png");
    }

    //universal x
    float ux = width - 140;
    //y of button for char
    float cy = height - 400;
    //y of button for bg
    float by = height - 300;

    //try mouseReleased or p5 controls
    if (mouseX  > ux && mouseX < ux + 85
      && mouseY > cy && mouseY < cy + 60) {
      fill(255);

      for (int i = 0; i < cars.length; i++) {
        if (!checkKey(' ')) {

          image(cars[i], playerPos.x, playerPos.y, size, size+35);
        } else {
          ux = 0;
          cy = 0;
          by = 0;
        }
      }
    } else {
      fill(#EDA41D);
    }
    stroke(0);
    rect(ux, cy, 85, 60);

    if (mousePressed && mouseX  > ux && mouseX < ux + 85
      && mouseY > by && mouseY < by + 60) {
      fill(255);
      //return mousePressed value to change bg pre-coded/hard coded bg; type
    } else {
      fill(#EDA41D);
    }
    stroke(0);
    rect(ux, by, 85, 60);
  }


  public void update() {
    // if spacebar is pressed, the acceleration of the vehicle is used
    if (checkKey(' '))
    {
      control = new PVector(mouseX, mouseY); 
      acc = PVector.sub(control, playerPos);
      //Set magnitude of acceleration
      acc.setMag(0.2);
      //VeplayerPosity changes according to acceleration
      vel.add(acc);
      //Limit the veplayerPosity by speed
      vel.limit(speed);
      //Location changes by veplayerPosity
      playerPos.add(vel);

      gas++;
    }

    //An interface to show current gas and gear if gas == 200 then it is gear 2
    if ( gas == 50) {
      game_start = true;
    } else if (gas == 100) {
      speed = 1.5;
      acc.setMag(0.5);
      gear = 1;
      println("You are now in Gear: " + gear + ", Gas: " + gas);
    } else if (gas == 200) {
      speed = 3;
      acc.setMag(2);
      gear = 2;
      println("You are now in Gear: " + gear + ", Gas: " + gas);
    } else if (gas == 300) {
      speed = 4;
      acc.setMag(2.5);
      gear = 3;
      println("You are now in Gear: " + gear + ", Gas: " + gas);
    } else if (gas == 400) {
      speed = 7.5;
      acc.setMag(3);
      gear = 4;
      println("You are now in Gear: " + gear + ", Gas: " + gas);
    } else if (gas == 500) {
      speed = 10;
      acc.setMag(4);
      gear = 5;
      println("You are now in Gear: " + gear + ", Gas: " + gas);
    } else if (gas == 650) {
      gas = 50;
      gear = 1;
      println("You are now in Gear: " + gear + ", Gas: " + gas);
    }

    //Interface for gas and gear
    float ifaceX = 400;
    float ifaceY = 25;


    textAlign(LEFT, CENTER);
    text("Gas: " + gas, ifaceX - 75, ifaceY);
    text("Gear " + gear, ifaceX, ifaceY);
  }



  //Everything stops and "GAME OVER" text pops out + Back to Menu instead?
  //void reset() { 
  //  playerPos = new PVector(width/30, height/1.05);
  //}
}