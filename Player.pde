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
  float angle;
  float size;
  float segSize;

  Player() {
    cars = new PImage[3];
    playerPos = new PVector(width/2.2, height/1.3);
    vel = new PVector(0, 0);
    speed = 2;
    gas = 0;
    gear = 1;
    angle = 0;
    size = 60;
    segSize = 50;
  }

  public void run() {
    display();
    update();
  }

  public void levelUpdate() {
    playerPos = new PVector(width/30, height/1.05);
  }

  public void display() {
    //if(! space pressed then
    //choose characters between 1, 2, and 3 
    for (int i = 0; i < cars.length; i++) {
      cars[i] = loadImage( i + ".png");
    }

    image(cars[0], playerPos.x, playerPos.y, size, size + 35);
  }
  
  //ATTEMPT3 ON MAKING VEHICLE IMAGE FOLLOW MOUSE POINTER
   //public void segment(float x, float y, float a) {
   // pushMatrix();
   // translate(x, y);
   // rotate(a);    
   // image(cars[0], 0, 0, size, size - 35);
   // popMatrix();
  //}//

  //public void display() {
   // //if(! space pressed then
   // //choose characters between 1, 2, and 3 
   // for (int i = 0; i < cars.length; i++) {
   //   cars[i] = loadImage( i + ".png");
   // }

   // float dx = mouseX - playerPos.x;
   // float dy = mouseY - playerPos.y;

   // angle = atan2(dy, dx);    
   // playerPos.x = mouseX - (cos(angle) * segSize );
   // playerPos.y = mouseY -(sin(angle) * segSize );

   // segment(playerPos.x, playerPos.y, angle);
  //}////

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