//A possible class that holds inheritance over variance of vehicles
class Vehicle {
  PVector loc;
  float size;
  PVector vel;
  PVector acc;
  PVector control;
  float speed;

  Vehicle() {
    loc = new PVector(0, 0);
    // loc = new PVector(-width, -height);  //slower outcome since it's position is further
    size = 35;
    vel = new PVector(0, 0);
    speed = random(1, 10);
  }

  void update() {

    control = new PVector(width, height);
    acc = PVector.sub(control, loc);

    //Set magnitutd of acceleration
    acc.setMag(random(0.2, 0.5));
    //Velocity changes according to acceleration
    vel.add(acc);
    //Limit the velocity by speed
    vel.limit(speed);
    //Location changes by velocity
    loc.add(vel);


    if (loc.x > width) 
    {
      loc.x = 0;
    } else if (loc.y > height) 
    {
      loc.y = 0;
    }
  }


  void display() {
    stroke(random(300, 45));
    fill(random(50, 150));
    rect(loc.x, loc.y, size, size);
  }
}