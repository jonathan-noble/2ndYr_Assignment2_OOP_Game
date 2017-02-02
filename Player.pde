//A possible class that holds inheritance over character selection of vehicles

//key space is pressed to accelerate 
//BUT every time space(gear) is pressed, gear is changed sequentially to make the player
//accelerate in random speed and magnitude, G1-G6 then back to G1
class Player {
  PImage speeder;
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
    speeder = loadImage("speeder.png");
  }

 
  public void run() {
    display();
    update();
  }
  
  public void levelUpdate() {
    playerPos = new PVector(width/30, height/1.05);
  }
  
    public void display() {

    image(speeder, playerPos.x, playerPos.y, size, size+35);
  }

  public void update() {
    // if spacebar is pressed, the acceleration of the vehicle is used
    // Check that key is only working on space bar OTHERWISE NULL POINTER EXCEPTION

    {
      if (checkKey(' '))
      {
        control = new PVector(mouseX, mouseY); 
        acc = PVector.sub(control, playerPos);
        //Set magnitude of acceleration
        acc.setMag(0.5);
        //VeplayerPosity changes according to acceleration
        vel.add(acc);
        //Limit the veplayerPosity by speed
        vel.limit(speed);
        //Location changes by veplayerPosity
        playerPos.add(vel);

        gas++;
      }
    }

    //Interface for gas and gear
    float ifaceX = 400;
    float ifaceY = 25;


    //An interface to show current gas and gear if gas == 40 then it is gear 2
    if (gas == 100) {
      speed = 3;
      acc.setMag(0.75);
      gear = 3;
      println("You are now in Gear: " + gear + ", Gas: " + gas);
    } else if (gas == 200) {
      speed = 7.5;
      acc.setMag(2);
      gear = 5;
      println("You are now in Gear: " + gear + ", Gas: " + gas);
    } else if (gas == 300) {
      speed = 4;
      acc.setMag(1);
      gear = 4;
      println("You are now in Gear: " + gear + ", Gas: " + gas);
    } else if (gas == 400) {
      speed = 10;
      acc.setMag(2.5);
      gear = 6;
      println("You are now in Gear: " + gear + ", Gas: " + gas);
    } else if (gas == 500) {
      speed = 1.5;
      acc.setMag(0.2);
      gear = 2;
      println("You are now in Gear: " + gear + ", Gas: " + gas);
    } else if (gas == 650) {
      gas = 1;
      gear = 1;
      println("You are now in Gear: " + gear + ", Gas: " + gas);
    }

    textAlign(LEFT, CENTER);
    text("Gas: " + gas, ifaceX - 75, ifaceY);
    text("Gear " + gear, ifaceX, ifaceY);
  }



  //Everything stops and "GAME OVER" text pops out + Back to Menu instead?
  //void reset() { 
  //  playerPos = new PVector(width/30, height/1.05);
  //}
}