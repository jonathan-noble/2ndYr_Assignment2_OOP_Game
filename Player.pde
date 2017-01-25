//A possible class that holds inheritance over character selection of vehicles

//key space is pressed to accelerate 
//BUT every time space is pressed, gear is changed sequentially to make the player
//accelerate faster, G1-G4 then back to G1
class Player {
  // float x, y, z;          //Declaration of variables for 3-D shape of Character
  PVector loc;
  PVector vel;
  PVector acc;
  PVector control;
  float speed;
  int gear;

  Player() {
    loc = new PVector(width/15, height/1.2);
    vel = new PVector(0, 0);
    speed = 2;
    gear = 1;
  }

  void levelUpdate() {
    loc = new PVector(width/15, height/1.2);
    // loc.sub(width/15, height/1.2);
  }

  void update() {
    // if spacebar is pressed, the acceleration of the vehicle is used
    if (keyPressed)    
    {
      if (key == ' ')
        control = new PVector(mouseX, mouseY);
      acc = PVector.sub(control, loc);
      //Set magnitude of acceleration
      acc.setMag(0.5);
      //Velocity changes according to acceleration
      vel.add(acc);
      //Limit the velocity by speed
      vel.limit(speed);
      //Location changes by velocity
      loc.add(vel);
      
      gear++;
    }
    
    //try "if keyReleased" to implement proper gear incrementation
    
    //An interface to show current gear
    if (gear == 2) {
      speed = 3.5;
      acc.setMag(1);
      println("%d", gear);
    }   
    else if (gear == 3) {
      speed = 5;
      acc.setMag(1.5);
      println("%d", gear);
    } else if (gear == 4) {
      speed = 8;
      acc.setMag(2);
      println("%d", gear);
    }
    //else {
    //gear = 1;
    //}
  }


  void display() {
    stroke(random(20, 45));
    fill(255, 500, 100);
    rect(loc.x, loc.y, 50, 50);
  }

  void reset() { 
    loc = new PVector(width/15, height/1.2);
  }


  //void keyPressed() {
  //  if (keyPressed)    
  //  {
  //    if (key == ' ')
  //    {
  //      gear++;
  //    }
  //  }
  //}
}