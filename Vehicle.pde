class Vehicle {
  PVector loc;
  PVector vel;
  float speed;

  Vehicle() {
    loc = new PVector(random(width/2), random(height/2));
    vel = new PVector(0, 0);
    speed = 5;
  }

  void update() {

    PVector mouse = new PVector(20, 20);
    PVector acc = PVector.sub(mouse, loc);
    
    //Set magnitute of acceleration
    acc.setMag(0.2);
    //Velocity changes according to acceleration
    vel.add(acc);
    //Limit the velocity by speed
   // vel.limit(speed);
    //Location changes by velocity
    loc.add(vel);
  }

  void display() {
    stroke(random(300, 45));
    fill(random(50, 150));
    rect(loc.x, loc.y, 50, 50);
  }
}