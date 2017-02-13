class Finisher extends HUD {
  float finPosX= width/2.2;
  float finPosY = -4800; 
  PShape gem;
  float size;

  Finisher() {
    size = 50;     
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
    if (pl1.playerPos.x + 20 > x && pl1.playerPos.x < x + 40 &&
      //  bottom side of player                            bot side of gem
      pl1.playerPos.y + 90 > y && pl1.playerPos.y < y + 50 ) {
      stateOfGame = 3;
    }

    textDesign();
  }
}