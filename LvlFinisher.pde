class Finisher {
  PVector pos;
  float size;
  int level;      
  Player pl1;

  Finisher(Player pl1) {
    pos = new PVector (width - 50, 25);
    size = 50;
    level = 1;        // 0 means intro screen, 1-3 means the levels of the game
    this.pl1 = pl1;
  }

  void levelUp() {

    float plyrX = pl1.playerPos.x;
    float plyrY = pl1.playerPos.y;

    if (plyrX >= pos.x && plyrY >= pos.y)
    {
      // implement proper integer "level" incrementation
      level++;
       println("Good job! You're onto level " + level);
      pl1.levelUpdate();
    }
  }

  void display() {
    fill(255);
    ellipse(pos.x, pos.y, size, size);
  }
}