class Finisher {
  float finPosX= width/2.2;
  float finPosY = -4600;
  PShape gem;
  float size;
  int level;      
  Player pl1;

  Finisher(Player pl1) {
    size = 50;     
    level = 1;        // 0 means intro screen, 1-3 means the levels of the game
    this.pl1 = pl1;
  }

  void bonusUp() {
  }

  void display(float x, float y) {

    gem = createShape();
    gem.beginShape();
    gem.fill(random(237, 5), random(100, 230));
    gem.vertex(15, 15);
    gem.vertex(10, 0);
    gem.vertex(5, 15);
    gem.vertex(10, 20);
    gem.endShape(CLOSE);
    fill(255);
    shape(gem, x, y, size, size);

    //  right side of player                           right side of gem
    if (pl1.playerPos.x + 40 > x && pl1.playerPos.x < x + 40 &&
      //  bottom side of player                            bot side of gem
      pl1.playerPos.y + 90 > y && pl1.playerPos.y < y + 50 ) {

      // implement proper integer "level" incrementation
      level++;
      println("Good job! You're onto the bonus level!");
    }
  }
}