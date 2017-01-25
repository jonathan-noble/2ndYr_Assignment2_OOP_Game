class Reward {
  PVector pos;
  float size;
  int level;
  Player pl1;

  Reward(Player pl1) {
    pos = new PVector (width -50, 25);
    size = 50;
    level = 1;
    this.pl1 = pl1;
  }

  void levelUp() {

    float plyrX = pl1.loc.x;
    float plyrY = pl1.loc.y;

    if (plyrX >= pos.x && plyrY >= pos.y)
    {
      println("Good job! You're onto next level!");
      level++;
      pl1.levelUpdate();
    }
  }

  void display() {
    fill(255);
    ellipse(pos.x, pos.y, size, size);
  }
}