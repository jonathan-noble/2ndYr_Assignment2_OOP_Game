class Guards {
  float guardX;
  float guardY;
  float size;
  PImage guard;

  Guards() {
    guardX = pl1.playerPos.x - 75;
    guardY = -100;
    size = 60;
    guard = loadImage("squad.png");
  }

  void run() {
    update();
    display();
  }

  void update() {

    if (pl1.playerPos.y > height - 90 ) {
      guardY += 100;
    }

    if (guardY > pl1.playerPos.y) {
      stateOfGame = 4;
    }
  }

  void display() {  

    image(guard, guardX, guardY, size, size + 35);
  }
}