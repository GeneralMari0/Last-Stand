


class Round
{
  
  void startRound() // Start a new round of the game.
  {
    background(0, 1, 41);
    
    fill(0, 179, 62);
    rect(0, 300, width, 500);
    
    fill(77, 40, 0);
    rect((width/2)+220, 300, 60, height);
    
    PlayerModel plyModel = new PlayerModel();
    plyModel.createModel(); // Create a playermodel and display on screen.
    
    Weapon curWep = ply.getWeapon();
    curWep.createWeaponViewModel(plyModel); // Create the weapons view model and pass the current playerModel instance
    
    fireTimer = new Timer(curWep.getFireDelay()); // Create a new timer and set the delay to the weapons fire delay.
    timerThread = new Thread(fireTimer); // Initialize a new thread for fireTimer.
    
    spawnTimer = new Timer(1);
    spawnTimer.startSpawnTimer(1);
    
    curWep.drawCrosshair(); // Draw the crosshair above all other elements on the screen.
    
    // If the mouse is pressed and hasn't been pressed yet, then fire the gun.
    if (mousePressed && timesPressed == 0)
    {
      timesPressed++; // Increase timesPressed by 1.
      curWep.fireWeapon(); // Fire the current weapon.
    }
    roundTimer = new Timer(2); // Create a new roundtimer with a delay of 2.
    roundTimer.startRoundTimer(); // Start the round timer.
    fill(255);
    textSize(80);
    String timerText = str(roundTime); // Set the timerText value to the value of roundTime parsed as a string.
    text("TIME", width/2-60, 130);
    textSize(50);
    text(timerText, width/2, 200);
    
    // If the weapon has been fired, set the angle of the bullet and set the velocity to 35 pixels.
    if (weaponFired)
    {
      pushMatrix();
      translate(920, 545);
      scale(-1, -1);
      float angle = atan2(mouseY - 545, mouseX - 920);
      rotate(angle);
      translate(-80, -20);
      fill(255,255,0);
      rotate(radians(0));
      rect(bulletXPos-=35, 0, 50,10);
      bulletYPos-=35;
      popMatrix();
    }
    // If the weapon hasnt been fired, then set the bullet position to 0.
    else if (!weaponFired)
    {
      bulletXPos = 0;
      bulletYPos = 0;
    }
    
    //If the round is over, then end the round.
    if (roundOver && !playerIsDead)
    {
      menuState = 3;
    }
    else if (roundOver && playerIsDead)
    {
      menuState = 4;
    }
    if (zombPosX[zombIndex] > 840)
    {
      playerIsDead = true;
      roundOver = true;
    }
    
  }  
  
}
