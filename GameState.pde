class gameState extends HUD {

  gameState() {
  }

  //BEGIN GAME STATES
  void gameMenu() {

    gameBG();
    menu.display();
    textMenu();

    for (int i = 0; i < fs.fsX.length; i++) {      
      // The ternary operator used to decide whether a Footslogger index > 2 is true or false
      //If true, it will add -5 to speed of fs from right. 
      //However if false, it will add 2 to speed of fs from left.
      fs.fsX[i] += i > 2 ? -7 : 5;
    }

    fs.display();

    if (checkKey(' ')) {
      stateOfGame = 2;
    }
  }

  void gameStart() {

    gameBG();

    ss_intro.close();
    ss_main.play();
    cursor(CROSS);
    landY += 2.4;                //the scroll spreed of the land towards height
    pl1.playerPos.y += 2.4;      //ensures the stance of the player towards the height


    for (int i = 0; i < fs.fsX.length; i++) {      
      // The ternary operator used to decide whether a Footslogger index > 2 is true or false
      //If true, it will add -5 to speed of fs from right. 
      //However if false, it will add 2 to speed of fs from left.
      fs.fsX[i] += i > 2 ? -6 : 4;
    }


    fs.display();

    for (int i = 0; i < scoreUp.rewardX.length; i++) {
      scoreUp.getScore(scoreUp.rewardX[i], scoreUp.rewardY[i] + landY);  
      //landY is added so scoreUp don't stay in the screen as game starts
    }

    pl1.run();
    guard.run();

    for (int i = 0; i < obstacle.obstacleX.length; i++) {
      obstacle.display(obstacle.obstacleX[i], obstacle.obstacleY[i] + landY); 
      //landY is added so obstacles don't stay in the screen as game starts
    }

    gem.display(gem.finPosX, gem.finPosY + landY); 

    //Boundary check
    if (pl1.playerPos.x > width - 30 || pl1.playerPos.x < 0 + 30
      || pl1.playerPos.y > height - 80) {
      stateOfGame = 4;
    }
  }

  void gameWin() {
    textFont(font1, 110);
    fill(255, 200);
    text("W I N", 275, 280);
    println("Good job! You wonnered the game!");

    textFont(font2, 35); 
    text("HIGH SCORE: ", width/2 - 150, height/2 - 100);
    text(high_score[0], width/2 + 50, height/2 - 100);
  }

  void gameOver() { 
    ss_intro.close();
    ss_main.close();
    sound_GO.play();
    textFont(font1, 110);
    fill(255, 225, 200);
    text("B U S T E D", 130, 280);
    println("Game Over!");
    pl1.speed = 0;

    textFont(font2, 35); 
    text("HIGH SCORE: ", width/2 - 150, height/2);
    text(high_score[0], width/2 + 50, height/2);
  }

  //void gameRestart() {
  //  if (game_over == true) {
  //    rect(width/2, height/2, 50, 50);

  //    if (mouseX > width/2 && mouseX < width/2 && mouseY > height/2 && mouseY < height/2) {
  //    //  if (mousePressed) {
  //        text("Try again?", width/2, height/2);
  //        //ss_intro.close();
  //        //ss_main.play();
  //        //cursor(CROSS);
  //        //landY += 2.4;                //the scroll spreed of the land towards height
  //        //pl1.playerPos.y += 2.4;      //ensures the stance of the player towards the height
  //      stateOfGame == 2;
  //     // }
  //    }
  //  }
  //}


  // END GAME STATES
}