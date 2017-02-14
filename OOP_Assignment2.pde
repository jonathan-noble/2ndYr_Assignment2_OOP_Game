//  Author Name:  Jonathan Noble
//  Program Name: OOP 2nd Assignment - Game: Crossy_Road 2.0/ Grand Theft Crossy Road/ Grand TheSsy Road/ GTCR
//  Due Date:     15/02/2017 
//  Description:  A game WHERE the PLAYER collects money and at the same time, 
//                tries to avoid the OBSTACLES and the Footsloggers (apart from the zombies!) in order to not get busted.
//  Features:     1) A game state with: 
//                    a) Game Menu and Info
//                    b) Game Start, Game Win and Game Over - High Score is recorded!
//                2) A HUD with: 
//                    a) Money (reward) collected SO EACH SCORE IS RECORDED IN THE LEADERBOARD
//                    b) Gas, speed and gear is shown
//                    c) 3-star wanted levels fluctuate every time the player runs over a footslogger
//                3) Game
//                    a) When gardas are hit, the wanted level goes up higher
//                    b) When the zombies are hit, the wanted level goes down
//                    c) Obstacle (trees) slow you down so avoid them!

import ddf.minim.*;

PFont font1, font2;
int score = 0;
String quid = str(score);
String[] high_score;
int stateOfGame = 1;
float landY = height;    // length of the land field by height
float ifaceX = 500; 
float ifaceY = 25; 

//Declare classes
gameState state;
Menu menu;
Player pl1;
Finisher Gem;
Obstacle obstacle;
Footslogger fs;
Reward scoreUp;
Guards guard;

//Declare sounds
Minim minim;
AudioPlayer ss_intro, ss_main;
@SuppressWarnings( "deprecation" )
AudioSnippet sound_cash, sound_radio, sound_GO, sound_win, sound_ow, sound_popo, sound_zombie, sound_engine;
@SuppressWarnings( "deprecation" )

  void setup() {

  size(800, 700);
  colorMode(HSB);
  smooth();

  //Initialize all the sound file
  minim = new Minim(this);

  ss_intro = minim.loadFile("ss_intro.wav");
  ss_main = minim.loadFile("ss_main.wav");
  sound_cash = minim.loadSnippet("cash.mp3");
  sound_radio = minim.loadSnippet("radio.mp3");
  sound_GO = minim.loadSnippet("game_over.mp3");
  sound_win = minim.loadSnippet("win.mp3");
  sound_ow = minim.loadSnippet("ow.mp3");
  sound_popo = minim.loadSnippet("police.mp3");
  sound_zombie = minim.loadSnippet("zombie.mp3");
  sound_engine = minim.loadSnippet("car_engine.mp3");

  ss_intro.setGain(-20);
  ss_intro.loop();

  font1 = loadFont("ard110.vlw");
  font2 = loadFont("ard35.vlw");
  high_score = loadStrings("data/high_score.txt");

  //Initialize stateOfGameate class
  state = new gameState();

  //Initialize Menu class
  menu = new Menu();

  //Initialize Player class
  pl1 = new Player();

  //Initialize Finisher class
  Gem = new Finisher();

  //Initialize Footslogger - pedestrian object
  fs = new Footslogger();

  //Initialize Obstacle - tree object
  obstacle = new Obstacle();

  //Initialize reward - scoreUP
  scoreUp = new Reward();

  //Initialize Guard class
  guard = new Guards();
}

void draw() {

  switch(stateOfGame) {
  case 1: 
    { 
      state.gameMenu();
      break;
    }
  case 2: 
    {
      state.gameStart();
      break;
    }
  case 3: 
    { 
      state.gameWin();
      break;
    }
  case 4: 
    {
      state.gameOver();
      break;
    }
  }
}// end draw method



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