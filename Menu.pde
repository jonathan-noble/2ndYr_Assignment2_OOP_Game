class Menu { 
  float uy;       // universal y
  float ix;       // x of button for instructions
  float ax;   // coordinates of contents of instructions
  float ay;
  PShape gem;

  Menu() {
    uy = 25;
    ix = 350;
    ax = 90;
    ay = 130;
  }

  void display() {

    if (mouseX  > ix && mouseX < ix + 85
      && mouseY > uy && mouseY < uy + 60) {
      fill(255);
      if (mousePressed) {
        fill(255, 230);
        stroke(1);
        rect(ax - 10, ay - 30, 635, 80);        
        fill(#1A84C4);
        textFont(font2, 30);
        text("Use Mouse for Direction", ax + 140, ay);
        text("while HOLDING Spacebar for Acceleration", ax + 25, ay + 30);

        fill(255, 230);
        stroke(1);
        rect(ax - 10, ay + 80, 220, 145);
        fill(#E84B2F);
        textFont(font2, 25);
        text("COLLECT AS MUCH", ax, ay + 100);
        text("QUID AS YOU CAN", ax + 5, ay + 130);
        image(scoreUp.quid_pic, ax + 70, ay + 150, scoreUp.size, scoreUp.size);

        fill(255, 230);
        stroke(1);
        rect(ax - 10, ay + 250, 220, 100);
        fill(#E84B2F);
        textFont(font2, 23);
        text("Kill All the Zombies!", ax, ay + 270);
        textFont(font2, 15);
        text("-1 Star Wanted", ax + 50, ay + 300);
        fs.footslog(ax + 25, ay + 310, "zombie", "right");
        fs.footslog(ax + 175, ay + 310, "zombie", "left");

        fill(255, 230);
        stroke(1);
        rect(ax - 10, ay + 380, 220, 120);
        fill(#E84B2F);
        textFont(font2, 23);
        text("Grab the Gem", ax + 25, ay + 400);
        text("to WIN!", ax + 65, ay + 420);
        gem = createShape();
        gem.beginShape();
        gem.fill(random(237, 5), random(100, 230));
        gem.vertex(15, 15);
        gem.vertex(10, 0);
        gem.vertex(5, 15);
        gem.vertex(10, 20);
        gem.endShape(CLOSE);
        shape(gem, ax + 60, ay + 440, Gem.size, Gem.size);

        fill(255, 240);
        stroke(1);
        rect(ax + 280, ay + 80, 345, 230);
        fill(#E84B2F);
        textFont(font2, 25);
        text("AVOID THESE FOOTSLOGGERS", ax + 290, ay + 100);
        textFont(font2, 20);
        text("3 Star Wanted level = Game Over!", ax + 300, ay + 300);
        textFont(font2, 15);
        text("+2 Star Wanted", ax + 460, ay + 190);
        fs.footslog(ax + 360, ay + 140, "pedestrian", "right");
        fs.footslog(ax + 530, ay + 140, "pedestrian", "left");
        fs.footslog(ax + 360, ay + 240, "trump", "right");
        fs.footslog(ax + 530, ay + 240, "trump", "left");
        fs.footslog(ax + 440, ay + 190, "gardai", "right");


        fill(255, 230);
        stroke(1);
        rect(ax + 280, ay + 350, 345, 150);
        fill(#E84B2F);
        textFont(font2, 25);
        text("& AVOID THE COCONUT TREES", ax + 290, ay + 370);
        textFont(font2, 15);
        text("as they SLOW you down!", ax + 370, ay + 490);
        obstacle.tree(ax + 450, ay + 420, obstacle.size, obstacle.size - 45, 6);
      }
    } else {
      fill(#EDA41D);
    }
    stroke(0);
    strokeWeight(1);
    rect(ix, uy, 85, 60);
    fill(0);
    textFont(font2, 35);
    text("i", ix + 40, uy + 40);
  }
}