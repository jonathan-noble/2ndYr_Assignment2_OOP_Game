//key space is pressed to accelerate 
//BUT every time space(gear) is pressed, gear is changed sequentially to make the player
//accelerate in random speed and magnitude, G1-G6 then back to G1
class Player extends HUD implements Objects {
  PImage cars;  //PImage[] cars;
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
    //cars = new PImage[3];
    cars = loadImage("0.png");
    playerPos = new PVector(width/2.2, height/1.3);
    vel = new PVector(0, 0);
    speed = 2.5;
    gas = 0;
    gear = 0;
    angle = 0;
    size = 60;
    segSize = 50;
  }

  public void run() {
    display();
    update();
  }

  public void display() {
    image(cars, playerPos.x, playerPos.y, size, size + 35);
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

    if (gas >= 100 && gas <= 199) {
      speed = 3;
      acc.setMag(0.5);
      gear = 1;
      textFont(font2, 35);
      fill(#F7BB14);
      text("^G" + gear, playerPos.x - 35, playerPos.y - 20);
      println("You are now in Gear: " + gear + ", Gas: " + gas);
    } else if (gas >= 200 && gas <= 299) {
      speed = 4;
      acc.setMag(2);
      gear = 2;
      textFont(font2, 35);
      fill(#F7BB14);
      text("^G" + gear, playerPos.x - 35, playerPos.y - 20);
      println("You are now in Gear: " + gear + ", Gas: " + gas);
    } else if (gas >= 300 && gas <= 399) {
      speed = 6;
      acc.setMag(2.5);
      gear = 3;
      landY += 0.3;
      pl1.playerPos.y += 0.3;  
      textFont(font2, 35);
      fill(#F7BB14);
      text("^G" + gear, playerPos.x - 35, playerPos.y - 20);
      println("You are now in Gear: " + gear + ", Gas: " + gas);
    } else if (gas >= 400 && gas <= 499) {
      speed = 9;
      acc.setMag(3);
      gear = 4;
      textFont(font2, 35);
      fill(#F7BB14);
      text("^G" + gear, playerPos.x - 35, playerPos.y - 20);
      println("You are now in Gear: " + gear + ", Gas: " + gas);
    } else if (gas >= 500 && gas <= 599) {
      speed = 12;
      acc.setMag(4);
      gear = 5;
      landY += 0.5;
      pl1.playerPos.y += 0.5;  
      textFont(font2, 35);
      fill(#F7BB14);
      text("^G" + gear, playerPos.x - 35, playerPos.y - 20);
      println("You are now in Gear: " + gear + ", Gas: " + gas);
    } else if (gas >= 600 && gas <= 699) {
      speed = 2;
      acc.setMag(0.35);
      gear = 0;
      fill(#E33535);
      text("OVERHEAT!", playerPos.x - 35, playerPos.y - 20);
      println("You are now in Gear: " + gear + ", Gas: " + gas);
    } else if (gas >= 700 && gas <= 799) {
      speed = 2.5;
      acc.setMag(0.65);
      gear = 1;
      textFont(font2, 35);
      fill(#F7BB14);
      text("^G" + gear, playerPos.x - 35, playerPos.y - 20);
      println("You are now in Gear: " + gear + ", Gas: " + gas);
    } else if (gas >= 800 && gas <= 899) {
      speed = 3.5;
      acc.setMag(1.8);
      gear = 2;
      landY += 0.7;
      pl1.playerPos.y += 0.7; 
      textFont(font2, 35);
      fill(#F7BB14);
      text("^G" + gear, playerPos.x - 35, playerPos.y - 20);
      println("You are now in Gear: " + gear + ", Gas: " + gas);
    } else if (gas >= 900 && gas <= 999) {
      speed = 6;
      acc.setMag(2.5);
      gear = 3;
      landY += 1;
      pl1.playerPos.y += 1; 
      textFont(font2, 35);
      fill(#F7BB14);
      text("^G" + gear, playerPos.x - 35, playerPos.y - 20);
      println("You are now in Gear: " + gear + ", Gas: " + gas);
    } else if (gas >= 1000 && gas <= 1099) {
      speed = 8;
      acc.setMag(3);
      gear = 4;
      landY += 1.5;
      pl1.playerPos.y += 1.5; 
      textFont(font2, 35);
      fill(#F7BB14);
      text("^G" + gear, playerPos.x - 35, playerPos.y - 20);
      println("You are now in Gear: " + gear + ", Gas: " + gas);
    } else if (gas >= 1100 && gas <= 1199) {
      speed = 15;
      acc.setMag(5);
      gear = 5;
      landY += 2;
      pl1.playerPos.y += 2; 
      textFont(font2, 35);
      fill(#F7BB14);
      text("^G" + gear, playerPos.x - 35, playerPos.y - 20);
      println("You are now in Gear: " + gear + ", Gas: " + gas);
    } else if (gas == 1200) {
      gas = 0;
      gear = 0;
      println("You are now in Gear: " + gear + ", Gas: " + gas);
    }

  }
}