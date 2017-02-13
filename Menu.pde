class Menu {
  //universal y
  float uy;
  //x of button for instructions
  float ix;

  Menu() {
    uy = height - 170;
    ix = width - 450;
  }

  void display() {

    if (mouseX  > ix && mouseX < ix + 85
      && mouseY > uy && mouseY < uy + 60) {
      fill(255);
    } else {
      fill(#EDA41D);
    }
    stroke(0);
    rect(ix, uy, 85, 60);
    fill(0);
    textFont(font2, 35);
    text("i", ix + 40, uy + 40);

    if (stateOfGame == 2) {
      uy += 2;
    }
  }
}