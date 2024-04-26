

ArrayList<Zombie> zombies; // Declare a new Zombie arraylist.

int[]zombPosY = new int[30]; // Declare a 30 element integer array.

int[]zombPosX = new int[30]; // Declare a 30 element integer array.

int[]usedZombies = new int[30]; // Declare a 30 element integer array for

int zombIndex = 0; // Intialize zombIndex to 0.

class ZombieController
{
  // Initialize each element of the zombPosX array to 90.
  void initializePosXList()
  {
    for (int i = 0; i < zombPosX.length; i++)
    {
      zombPosX[i] = -50;
    }
  }
  
  void initializePosYList()
  {
    for (int i = 0; i < zombPosY.length; i++)
    {
      zombPosY[i] = (int)random(200,600);
    }
  }
  
  // Create a new zombie instance in the zombies arraylist and randomly spawn a zombie on screen.
  void spawnZombie()
  {
    
    zombies.add(new Zombie()); // Add a new zombie object to the array.

    if(zombIndex < zombies.size()-1 && !isDead[zombIndex])
    {
      pushMatrix();
      zombies.get(zombIndex).move(zombIndex);
      zombies.get(zombIndex).createModel(zombIndex, zombPosY[zombIndex]);
      popMatrix();
    }
    else if (isDead[zombIndex])
    {

      if (zombIndex != 29)
      {
        zombIndex++;
      }
      else
      {
        roundOver = true;
      }
      
      if (zombIndex >= 5 && zombIndex < 10 )
      {
        zombieSpeed = 2;
      }
      else if (zombIndex >= 10 && zombIndex <= 15)
      {
        zombieSpeed = 4;
      }
      else if (zombIndex > 15 && zombIndex <= 25)
      {
        zombieSpeed = 7;
      }
      else if (zombIndex > 25 && zombIndex <= 29)
      {
        zombieSpeed = 11;
      }
      
    }
    else if (roundOver)
    {
       zombieSpeed = 0;
    }
   
   
  }
  
  
}
