class Road {
  PVector loc;
  float speed;

  Road() {
    loc = new PVector(random(-width/30, width/30), 
      random(-height/1.05, height/1.05), 
      random(width/30));
    speed = 0;
  }

  void run() {
    update();
    display();
  }

  void update() {
    loc.z = loc.z - speed;

    if (loc.z < 1) {
      loc.z = random(width/30);
      loc.x = random(-width/30, width/30);
      loc.y = random(-height/1.05, height/1.05);
    }
  }

  void display() {
    speed = map(mouseX, 0, height, -0.1, 0.5);

    float sx = map(loc.x / loc.z, 0, 1, 0, width - 15);
    float sy = map(loc.y / loc.z, 0, 1, 0, 25);   
    float size = map(loc.z, 0, width/2, 16, 0);

    pushMatrix();
    translate(width/30, height/1.05);
    fill(#0AE9FF);
    noStroke();
    rect(sx, sy, size, size);
    //fill(255);
    //rect(sx + 9, sy + 9, size - 20, size - 20);
    popMatrix();
  }
}