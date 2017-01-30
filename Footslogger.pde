//A possible class that holds inheritance over variance of pedestrians, animals(chicken) and even zombies
class Footslogger {
  PShape shape;
  PVector loc;
  float size;
  PVector vel;
  PVector acc;
  PVector control;
  float speed;

  Footslogger() {
    //CREATE A FUNCTION TO CHECK AND ENSURE THAT FtSlogger WOULD NOT SPAWN NEAR THE PLAYER
    loc = new PVector(random(-width, 0), random(-height, 0));
    size = 35;
    vel = new PVector(0, 0);
    speed = random(1, 10);
    create();
  }

  void run() {
    update();
    display();
  }

  
  void create() {
    shape = createShape(); 
    shape.beginShape();
    shape.stroke(5);
    shape.fill(255);
    shape.strokeWeight(2);
    shape.vertex(0, 25);
    shape.vertex(35, 43);
    shape.vertex(-10, - 25);  
    shape.vertex(0, 0);
    shape.endShape(CLOSE);
  }


  void update() {

    control = new PVector(width, height);
    acc = PVector.sub(control, loc);

    //Set magnitude of acceleration
    acc.setMag(random(0.2, 0.5));
    //Velocity changes according to acceleration
    vel.add(acc);
    //Limit the velocity by speed
    vel.limit(speed);
    //Location changes by velocity
    loc.add(vel);

    //ensure that player bounces off the edge of the screen!
    if (loc.x > width) 
    {
      loc.x = 0;
    } else if (loc.y > height) 
    {
      loc.y = 0;
    }
  }


  void display() {
    //stroke(random(300, 45));
    //fill(random(50, 150));
    //rect(loc.x, loc.y, size, size);

    pushMatrix(); // Stores the current transform
    translate(loc.x, loc.y);
    stroke(random(20, 45));
    // Initialize the PShape();
    shape(shape, 0, 0);
    popMatrix();
  }
}