class Guards {
  float guardX;
  float guardY;
  float size;
  PImage guard;

  Guards() {
    guardX = pl1.playerPos.x - 100;
    guardY = -100;
    size = 60;
    guard = loadImage("squad.png");
  }

  void run() {
    update();
    display();
  }

  void update() {

    //for (int i = 0; i < fs.fsX.length; i++) {  
    //  if (pl1.playerPos.x + 50  > fs.fsX[i] && pl1.playerPos.x < fs.fsX[i] + 15   
    //    //  bottom side of player              bot side of fs
    //    && pl1.playerPos.y + 110 > fs.fsX[i] && pl1.playerPos.y  < fs.fsX[i]+ 15) { 
    if (pl1.playerPos.y > 2000 ) {
      guardY += 60;
    }


    if (guardY > pl1.playerPos.y) {
      stateOfGame = 4;
    }
  }

  void display() {  

    image(guard, guardX, guardY, size, size + 35);
  }
}