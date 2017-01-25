//class that ensures the amount of vehicles and obstacles is set by levels
//vehicles, obstacles and (maybe) rewards are managed in an ArrayList 
//since each level has more obstacles and vehicles involved
//Ideally, there should be five levels (Noobs, Amateur, Intermediate, Professional, Hardcore)

//after REWARD(GEM) IS PICKED UP, the level proceeds by having the player move from 
//tge top right to bottom left where OBSTACLES ONLY POP OUT after top down camera panning
//(driver player = new location) is finished
class Level {
  ArrayList<Footslogger> peds;
  ArrayList<Obstacle> trees;
  ArrayList<Reward> gem;


  Level() {
    
    
  }
}