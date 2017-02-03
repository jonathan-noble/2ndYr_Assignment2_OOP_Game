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

float grassY = height;
int score = 0;
boolean game_over = false;
boolean start = false;
Player pl1;
Finisher gem;

ArrayList<Road> road = new ArrayList<Road>();
ArrayList<Footslogger> FS = new ArrayList<Footslogger>(5);
Obstacle obstacle;
//ArrayList<Obstacle> obstaclet = new ArrayList<Obstacle>();
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

  gem.levelUp();
  gem.display();


  for (Road roads : road) {
    roads.run();
  }

  for (int i = 0; i < FS.size(); i++) {
    Footslogger footS = (Footslogger) FS.get(i);
    footS.run();
    footS.gameoverUpdate();
  }

  //levelUpCheck();

  pl1.run();

  for (int i = 0; i < obstacle.obstacleX.length; i++) {
    obstacle.display();//obstacle.obstacleX[i], obstacle.obstacleY[i] + grassY);  
    obstacle.gameoverUpdate();//grassY needed for function call to work
  }

  for (Reward sU : scoreUp) {
    sU.display();
  }

  gameOver();
}


void gameOver() { 
  if (game_over == true)
  {
    println("Game Over!");
    noLoop();    //looks better with loop on
    // text( game over)
  }
}


//c-1 - move boolean functions


//c0 - delete
//void levelUpCheck() {
//  int lvl = gem.level;
//  Footslogger ped = new Footslogger();


//  if (lvl == 1) { 
//    System.out.println(FS.size());
//  } else  if (lvl == 2) {

//    //for (Footslogger ped : FS) {
//    for (int i = 0; i < 5; i++) {
//      FS.add(ped);
//    }
//    // FS.set(9, ped);
//    System.out.println(FS.size());
//    // }
//} else if (lvl == 1) {
//} else if (lvl == 2) { 

//  for (Footslogger ped : FS) {
//    ped.size += 10;
//  }

//OR

//ArrayList <Footslogger> footie = new ArrayList<Footslogger>(FS.size()*2);
//for (int i = 0; i<FS.size(); i++) {
//  footie[i] = FS[i];
//}
//}
//  //Obstacle obstacle[] = new Obstacle[3];

//if (lvl == 3) {
//}
//}

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

//c-2
//void keyReleased() {

//  //boundary check of player in accordance with the keys
//  if (keyCode == LEFT && obstacle.r == false && pl1.playerPos.x > 40 ) {
//    pl1.playerPos.x -= 25;
//    obstacle.l = false;
//    obstacle.r = false;
//    obstacle.u = false;
//    obstacle.d = false;
//    obstacle.l = false;
//    obstacle.r = false;
//    obstacle.u = false;
//    obstacle.d = false;
//    start = true;
//  }

//  if (keyCode == RIGHT && obstacle.l == false && pl1.playerPos.x < width-100 && pl1.playerPos.y < 375) {

//    pl1.playerPos.x += 25;
//    obstacle.l = false;
//    obstacle.r = false;
//    obstacle.u = false;
//    obstacle.d = false;
//    obstacle.l = false;
//    obstacle.r = false;
//    obstacle.u = false;
//    obstacle.d = false;
//    start = true;
//  }

//  if (keyCode == UP && obstacle.d == false && pl1.playerPos.y < 375) {
//    //If player presses up arrow key, the character then subtracts it's hop from width
//    pl1.playerPos.y -= 50;
//    obstacle.l = false;
//    obstacle.r = false;
//    obstacle.u = false;
//    obstacle.d = false;
//    obstacle.l = false;
//    obstacle.r = false;
//    obstacle.u = false;
//    obstacle.d = false;
//    score++;
//    start = true;
//  }

//  if (keyCode == DOWN && obstacle.u == false && pl1.playerPos.y < 375) {
//    pl1.playerPos.y += 25;
//    obstacle.l = false;
//    obstacle.r = false;
//    obstacle.u = false;
//    obstacle.d = false;
//    obstacle.l = false;
//    obstacle.r = false;
//    obstacle.u = false;
//    obstacle.d = false;
//    score--;
//    start = true;
//  }
//}