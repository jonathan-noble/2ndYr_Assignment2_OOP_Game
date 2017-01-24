# 2ndYr_Assignment2_OOP_Game
The Game Crossy Road is loosely based on the game Frogger - except for my version, the player IS the vehicle and avoids pedestrians and animals crossing, obstacle courses which involves trees, traffic lights and buildings

1. The game is set on levels - the higher the level, the harder the obstacles are
2. Player positioned from the bottom left corner goes through obstacles coming from the top right corner
3. Player must avoid the obstacles by trying to use the mouse controls 
4. Once obstacles hit the player, the game is reset to the beginning
5. Highest score is recorded on the current levels played


## Observations on the specifications of the requirements in order to ensure game's smooth process
* Camera mode:
  1. The game is in 3D - meaning the player (vehicle) and obstacles contains the x, y and z coordinates
  2. The game is in top down perspective
* The mechanics of the levels of the game must be either:
  1. The obstacles/ environment will be the one moving one by one from the top right corner of the screen to the bottom left of the screen AS THE PLAYER SUCCEEDS AN OBSTACLE AFTER THE ANOTHER
  2. The obstacles get harder THROUGH LEVELS after the player succeeds to "CROSS THE ROAD" (which would mean the player has to go diagonally from bottom left to top right of the screen without hitting a deer or bumping a traffic light).
  3. Possible bonus points for hitting a zombie
* Challenge
  1. Possible timer for prolonged inactivity in game
  2. Timer is recorded for shortest duration of obstacle done (to encourage challenge within self and other peers)
* Current score is recorded PER OBSTACLE PASSED in the leaderboard
* Possible list of levels able to be unlocked after finishing one

