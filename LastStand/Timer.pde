
import java.lang.Thread;

class Timer extends Thread{
  
  long timerDelay; // Store the timerDelay.
  
  boolean isAsleep = false; // Set intial value of isAsleep to false.
  
  Timer(long delay) // Construct a new timer object and store the value of delay in timerDelay.
  {
    this.timerDelay = delay;
  }
  
  // Run the timer.
  public void run() {
    
    int timesRan = 0; //Intialize timesRan to 0.
    while (true) { // While true, make the thread sleep for a specific delay and break the loop if the thread was ran once.
        if (timesRan == 1) // If thread is ran once, break the loop.
        {
          weaponFired = false;
          this.isAsleep = true;
          timesPressed = 0; // Reset timesPressed to allow the weapon to be fired again.
          break;
        }
      try {
        Thread.sleep((this.timerDelay*1000)); // Make the thread sleep for timerDelay*1000 (delay in milliseconds)
        timesRan++; // Increment timesRan by 1.
      } catch (InterruptedException e) { // If there is the thread is interrupted, print an error message.
        
        e.printStackTrace();
      }
    }
    
   
  }
  
  // Start the new round timer.
  void startRoundTimer()
  {
    int duration = frameCount % 60; // Get the current frame count within the current second.
    
    
    // If the the number of frames is equal to the timerDelay and the round is not over and the player is not dead, then reduce round time.
    if (duration == this.timerDelay && !roundOver && !playerIsDead)
    {
      roundTime--;
      
    }
    // if roundTime is 0, then set the roundOver to true and reset round time.
    else if (roundTime == 0)
    {
      roundOver = true;
      roundTime = 120;
    }
    
  }
  
  // Start a spawn timer for zombie spawns.
  void startSpawnTimer(int moveSpeed)
  {
    // If the duration is equal to the timerDelay, and the round is not over, and the player is not dead, reduce spawntime and
    // spawn a new zombie with a movement speed of 8 pixels.
    if (!roundOver && !playerIsDead)
    {
      spawnTime-= 0.010;
      zombControl.spawnZombie();
    } 
    // if spawnTime is 0, set the roundOver to true and reset spawn time.
    else if (spawnTime == 0)
    {
      roundOver = true;
      spawnTime = 120;
    }
    
  }
  // Return wheter the current timer is asleep or not.
  public boolean isAsleep()
  {
    return this.isAsleep;
  }
}
