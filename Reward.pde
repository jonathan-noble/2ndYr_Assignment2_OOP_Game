class Reward {
  float[] rewardX = {500, 0, -230, -450, -600, -1000};
  float[] rewardY = {330, 55, 0, -120, 360, 560};
  PImage statue;
  float size;
  Player pl1;

  Reward(Player pl1) {
    size = 60;
    statue = loadImage("statue.png");
    this.pl1 = pl1;
  }

  public void getScore(float x, float y) {
    fill(255);
    //ellipse(loc.x, loc.y - 5, size, size);
    image(statue, x, y, size, size);

    if (pl1.playerPos.x + 35  > x && pl1.playerPos.x < x + 20   
      && pl1.playerPos.y + 45 > y && pl1.playerPos.y  < y + 5) { 
      score++;
    }
    
    //Interface for gas and gear
    float ifaceX = 400;
    float ifaceY = 25;
     
     textAlign(LEFT, CENTER);
    text("Score: " + score, ifaceX - 200, ifaceY);
  }
}