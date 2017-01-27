//A possible class that holds inheritance over character selection of vehicles

//key space is pressed to accelerate 
//BUT every time space is pressed, gear is changed sequentially to make the player
//accelerate faster, G1-G4 then back to G1
class Player {
  // float x, y, z;          //Declaration of variables for 3-D shape of Character
  PShape shape;
  PVector loc;
  PVector vel;
  PVector acc;
  PVector control;
  float speed;
  int gear;
  float radius;
  float size;

  Player() {
    loc = new PVector(width/15, height/1.2);
    vel = new PVector(0, 0);
    speed = 2;
    gear = 1;
    radius = size / 2;
    size = 50;
    radius = size / 2;

    create();
  }

  void create()
  {
    shape = createShape();
    shape.beginShape();
    shape.stroke(255);
    shape.noFill();
    shape.strokeWeight(2);
    shape.vertex(-radius, radius);
    shape.vertex(0, - radius);
    shape.vertex(radius, radius);
    shape.vertex(0, 0);
    shape.endShape(CLOSE);
  }

  void display() {
    fill(255, 500, 100);
   // rect(loc.x, loc.y, 50, 50);
    
    pushMatrix(); // Stores the current transform
    translate(loc.x, loc.y);
    stroke(random(20, 45));
    // Initialize the PShape();
    shape(shape, 0, 0);
    popMatrix();
  }
  void levelUpdate() {
    loc = new PVector(width/15, height/1.2);
    // loc.sub(width/15, height/1.2);
  }

  void update() {
    // if spacebar is pressed, the acceleration of the vehicle is used
    // Check that key is only working on space bar OTHERWISE NULL POINTER EXCEPTION
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
    } else if (gear == 3) {
      speed = 5;
      acc.setMag(1.5);
      println("%d", gear);
    } else if (gear == 4) {
      speed = 8;
      acc.setMag(2);
      println("%d", gear);
    }

    //GEAR SHOULD RESTART TO 1 ONCE A LEVEL IS FINISHED
    //else {
    //gear = 1;
    //}
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