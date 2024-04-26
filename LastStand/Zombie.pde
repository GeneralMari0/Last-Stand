class Zombie
{

  int yPos = (height/2); // Intialize yPos to be between the top and bottom of the screen.
  
  // Create a new zombie Model and set the x position of the rectangles to
  // the element of zombPosX stored in posIndex.
  void createModel(int posIndex, int yPos)
  {
    
    pushMatrix();
    translate(90, 120);
    fill(0, 0, 0);
    rect(zombPosX[posIndex]-80,yPos+55, 40, 15);
    
    fill(7, 15, 82);
    rect(zombPosX[posIndex]-80,yPos+20, 40, 35);

    fill(43, 92, 0);
    rect(zombPosX[posIndex]-85,yPos-15, 50, 50);
    
    popMatrix();
    
  }
  
  // Move the zombie forwards based on their position based on delay.
  void move(int posIndex)
  { 
    
    // Get the current frame count + 1.
    //If the number of frames is equal to or greater than the delay, and the player is alive, and the zombie is alive,
    // then increase the zombie position by x, and check to see if the zombie has been killed.
    if (!playerIsDead && !isDead[zombIndex])
    {
      zombPosX[posIndex] = zombPosX[posIndex] + zombieSpeed;
      
      // If the mouse Cursor is within the zombies head hitbox, and the mouse is pressed and the weapon is fired, then
      // set the zombie is dead equal to true.
      if (mouseX > zombPosX[posIndex] && mouseX < zombPosX[posIndex]+50 && mousePressed && weaponFired)
      {
        isDead[zombIndex] = true;
      }
    }
  }
  
}
