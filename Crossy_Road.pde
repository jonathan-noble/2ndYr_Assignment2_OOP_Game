//  Author Name:  Jonathan Noble
//  Program Name: OOP 2nd Assignment - Game: Crossy_Road 2.0
//  Due Date:     08/02/2017
//  Description:  A game WHERE PLAYER avoids the OBSTACLES and the Footsloggers 
//                BUT the gearbox is incontrollably broken, thus giving away random change of gears 
//  Features:     1) A menu with: 
//                    a) Leaderboard
//                    b) Character and Lvl selection
//                2) A game interface with: 
//                    a) A TIMER SO EACH SCORE IS RECORDED IN THE LEADERBOARD
//                    b) Gas and gear is shown

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


int score = 0;
float landY = height;    // length of the land field by height
boolean game_start = false;
boolean game_over = false;

//Declare classes
Player pl1;
Finisher gem;
Obstacle obstacle;
Footslogger fs;
Reward scoreUp;
Minim minim;
AudioPlayer ss_intro, ss_main;

void setup() {

  size(800, 700);
  colorMode(HSB);
  smooth();

  //Initialize all the sound file
  minim = new Minim(this);
  ss_intro = minim.loadFile("ss_intro.wav");
  ss_main = minim.loadFile("ss_main.wav");

  ss_intro.loop();

  //Initialize Player class
  pl1 = new Player();

  //Initialize Finisher class
  gem = new Finisher(pl1);

  //Initialize Footslogger - pedestrian object
  //HERE
  fs = new Footslogger(pl1);


  //Initialize Obstacle - tree object
  obstacle = new Obstacle(pl1);

  //Initialize reward - scoreUP
  scoreUp = new Reward(pl1);
}

void gameBG() {

  background(#FF5AF4);  //background(#FF05EF);

  //for loop indicates a shaded rect is incrementing to the distance of -4000 from landY
  //y < 600 meaning keep looping until 600
  //y+= 100 meaning the distance between each rects
  for (float y = -4370; y < 600; y += 100) {
    fill(#FF05EF); //#DE12D0);
    rect(0, landY + y, width, 30);
  }
}  // end gameBG method


void draw() {

  gameBG(); 

  if (game_start == true) {
    ss_intro.close();
    ss_main.play();
    cursor(CROSS);
    landY += 2.3;                //the scroll spreed of the land towards height
    pl1.playerPos.y += 2.3;      //ensures the stance of the player towards the height
  }


  for (int i = 0; i < fs.fsX.length; i++) {      
    // The ternary operator used to decide whether a Footslogger index > 2 is true or false
    //If true, it will add -5 to speed of fs from right. 
    //However if false, it will add 2 to speed of fs from left.
    fs.fsX[i] += i > 2 ? -6 : 4;
  }

  for (int i = 0; i < fs.laneY1.length; i++) {
    fs.lane1(0, landY + fs.laneY1[i]); 
    //landY is added so fs don't stay in the screen as game starts
    fs.busted();
  }

  for (int i = 0; i < fs.laneY2.length; i++) {
    fs.lane2(0, landY + fs.laneY2[i]);  
    //landY is added so fs don't stay in the screen as game starts
    fs.busted();
  }

  for (int i = 0; i < fs.laneY3.length; i++) {
    fs.lane3(0, landY + fs.laneY3[i]);  
    //landY is added so fs don't stay in the screen as game starts
    fs.busted();
  }

  for (int i = 0; i < scoreUp.rewardX.length; i++) {
    scoreUp.getScore(scoreUp.rewardX[i], scoreUp.rewardY[i] + landY);  
    //landY is added so scoreUp don't stay in the screen as game starts
  }

  pl1.run();

  for (int i = 0; i < obstacle.obstacleX.length; i++) {
    obstacle.display(obstacle.obstacleX[i], obstacle.obstacleY[i] + landY); 
    //landY is added so obstacles don't stay in the screen as game starts
  }

  gem.bonusUp();
  gem.display(gem.finPosX, gem.finPosY + landY); 


  //Boundary check
  if (pl1.playerPos.x > width - 30 || pl1.playerPos.x < 0 + 30
    || pl1.playerPos.y > height - 80) {
    game_over = true;
  }

  fill(50, 50, 50, 150);
  rect(0, height-25, width, 25);
  rect(0, 0, 45, height);
  rect(width-45, 0, 45, height);

  gameWin();
  gameOver();
}// end draw method

void gameWin() {
}


void gameOver() { 
  if (game_over == true)
  {
    //text not showing up
    text("B U S T E D", width/2 - 100, height/2 - 100, 800, 1000);
    println("Game Over!");
    noLoop();    //looks better with loop on
    // text( game over)
  }
}



//error-check if keys are pressed correctly by user
boolean[] keys = new boolean[1000];

void keyPressed()
{ 
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

boolean checkKey(int k)
{
  if (keys.length >= k) 
  {
    return keys[k] || keys[Character.toUpperCase(k)];
  }
  return false;
}