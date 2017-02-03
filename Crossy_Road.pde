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


int score = 0;
boolean game_over = false;
boolean start = false;

Player pl1;
Finisher gem;
Obstacle obstacle;
ArrayList<Road> road = new ArrayList<Road>();
ArrayList<Footslogger> FS = new ArrayList<Footslogger>(5);
ArrayList<Reward> scoreUp = new ArrayList<Reward>();

void setup() {

  size(800, 700);
  colorMode(HSB);
  smooth();

  //Initialize Player class
  pl1 = new Player();

  //Initialize Finisher class
  gem = new Finisher(pl1);

  //Initialize road class
  for (int i = 0; i < 100; i++) {
    road.add(new Road());
  }

  //Initialize Footslogger - pedestrian object
  //HERE
  Footslogger ped = new Footslogger();
  while (FS.size() < 1) FS.add(ped);


  //Initialize Obstacle - tree object
  obstacle = new Obstacle(pl1);

  //Initialize reward - scoreUP
  for (int i = 0; i < 3; i++) {
    scoreUp.add(new Reward());
  }
}

void draw() {
  background(#FF05EF);
  // resetUpdate();

  gem.levelUp();
  gem.display();


  for (Road roads : road) {
    roads.run();
  }

  for (int i = 0; i < FS.size(); i++) {
    Footslogger footS = (Footslogger) FS.get(i);
    footS.run();
  }


  for (int i = 0; i < obstacle.obstacleX.length; i++) {
    obstacle.display();  //obstacle.obstacleX[i], obstacle.obstacleY[i] + grassY);  
    //grassY needed for function call to work  
    obstacle.gameoverUpdate();
  }

  for (Reward sU : scoreUp) {
    sU.display();
  }

  pl1.run();

  gameOver();
}// end draw method


void gameOver() { 
  if (game_over == true)
  {
    println("Game Over!");
    noLoop();    //looks better with loop on
    // text( game over)
  }
}

//THIS BOOLEAN FUNCTION ONLY DETECTS THE X AND Y COORDINATE OF THE OBJECT
//NOT ITS LINES IN THE EDGES!!! MEANING ONLY BOTTOM OF RECT IS DETECTED
boolean overFS(float x, float y, float width, float height) {

  float plyrX = pl1.playerPos.x;
  float plyrY = pl1.playerPos.y;

  if (plyrX >= x && plyrX <= x + width && 
    plyrY >= y && plyrY <= y + height) {
    return true;
  } else {
    return false;
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