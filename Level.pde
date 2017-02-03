//class that ensures the amount of vehicles and obstacles is set by levels
//vehicles, obstacles and (maybe) Finishers are managed in an ArrayList 
//since each level has more obstacles and vehicles involved
//Ideally, there should be five levels (Noobs, Amateur, Intermediate, Professional, Hardcore)

// This is the base class! 
// Everything in the scene will extend GameObject
// An abstract class means that:
// You can't instantiate it
// You must make a subclass and instantiate that
// Some of the methods can be abstract. That means they have no body
// If the subclass doesn't implement the abstract methods, then it too is abstract
// You can use abstract classes to ensure that a class has an implementation of the abstract methods

abstract class Level {
  ArrayList<Footslogger> FS;
  ArrayList<Obstacle> trees;
  ArrayList<Finisher> gem;


  Level() {
  }
}