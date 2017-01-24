//A possible class that holds inheritance over character selection of vehicles
class Player {
  // float x, y, z;          //Declaration of variables for 3-D shape of Character
  PVector loc;
  PVector vel;
  PVector acc;
  PVector control;
  float speed;

  Player() {
    loc = new PVector(width/15, height/1.2);
    vel = new PVector(0, 0);
    speed = 3.5;
  }

  void update() {
    // if spacebar is pressed, the acceleration of the vehicle is used
    //if (keyPressed)    
    //{
    //  if (key == CODED)
    //  {
    //    if (key == SPACEBAR)
    //    {
    control = new PVector(mouseX, mouseY);
    acc = PVector.sub(control, loc);
    //Set magnitute of acceleration
    acc.setMag(0.5);
    //Velocity changes according to acceleration
    vel.add(acc);
    //Limit the velocity by speed
    vel.limit(speed);
    //Location changes by velocity
    loc.add(vel);
    //  }
    //  }
    //  }
  }

  void display() {
    stroke(random(20, 45));
    fill(255, 500, 100);
    rect(loc.x, loc.y, 50, 50);
  }

  void reset() {
    loc = new PVector(width/15, height/1.2);
  }
}