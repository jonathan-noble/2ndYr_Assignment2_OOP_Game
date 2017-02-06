class Reward {
  float[] rewardX = {350, 55, 250, 360, 560, 450, 450, 250 };
  float[] rewardY = {320, 0 , -230, -450, -600 , -1000, -1500, -1750, -1900 };
  PImage vintage;
  float size;
  Player pl1;

  Reward(Player pl1) {
    size = 60;
    vintage = loadImage("vintage.png");
    this.pl1 = pl1;
  }

  public void getScore(float x, float y) {
    fill(255);
    //ellipse(loc.x, loc.y - 5, size, size);
    image(vintage, x, y, size, size);

    if (pl1.playerPos.x + 35  > x && pl1.playerPos.x < x + 20   
      && pl1.playerPos.y + 45 > y && pl1.playerPos.y  < y + 5) { 
      score++;
    }
    
    if (score == 1) {
      game_start = true;
    }
    
    //Interface for score
    float ifaceX = 400;
    float ifaceY = 25;
     
     textAlign(LEFT, CENTER);
    text("Quid: €" + score, ifaceX - 200, ifaceY);
  }
}