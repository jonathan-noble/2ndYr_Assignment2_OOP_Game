class Reward {
  float[] rewardX = {355, 400, 150, 360, 560, 250, 450, 
    200, 450, 650, 550, 325, 650, 
    250, 350, 450, 550, 375, 150, 600
  };
  float[] rewardY = {330, -100, -300, -450, -600, -800, -1050, 
    -1400, -1600, -1750, -1900, -2100, -2300, 
    -2850, -3050, -3250, -3450, -4150, -4350, -4350
  };

  PImage quid;
  float size;
  Player pl1;

  Reward(Player pl1) {
    size = 65;
    quid = loadImage("quid.png");

    this.pl1 = pl1;
  }

  public void getScore(float x, float y) {
    fill(255);
    //ellipse(loc.x, loc.y - 5, size, size);
    image(quid, x, y, size, size);

    if (pl1.playerPos.x + 35  > x && pl1.playerPos.x < x + 20   
      && pl1.playerPos.y + 45 > y && pl1.playerPos.y  < y + 5) { 
      score++;

      textFont(font2, 35);
      fill(#56CB33);
      text("+€", pl1.playerPos.x + 35, pl1.playerPos.y - 20);
      sound_cash.pause();
      sound_cash.rewind();
      sound_cash.play();
    }

    if (score == 1) {
      game_start = true;
    }
  }
}