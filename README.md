# 2ndYr_Assignment2_OOP_Game

1. The game is set on levels - the higher the level, the harder the obstacles are
2. Player positioned from the bottom left corner goes through obstacles coming from the top right corner
3. Player must avoid the obstacles by trying to use the controls - jump, go left, go right (contemplating on mouse control)
4. Once obstacles hit the player, the game is reset to the beginning
5. Highest score is recorded on the current levels played


## Observations on the specifications of the requirements in order to ensure game's smooth process
* The game is in 3D - meaning the vehicles and esp the player contains the x, y and z coordinates
* The mechanics of the levels of the game must be either:
  1. The obstacles/ environment will be the one moving one by one from the top right corner of the screen to the bottom left of the screen AS THE PLAYER SUCCEEDS AN OBSTACLE AFTER THE ANOTHER
  2. The obstacles get harder THROUGH LEVELS after the player succeeds to "CROSS THE ROAD" (which would mean the player has to go diagonally from bottom left to top right of the screen without getting drowned down the river or crushed flat by the truck vehicles).
* Challenge
  1. Possible timer for prolonged inactivity in game
  2. Timer is recorded for shortest duration of obstacle done (to encourage challenge within self)
* Current score is recorded PER OBSTACLE PASSED
* Possible list of levels able to be unlocked after finishing one
