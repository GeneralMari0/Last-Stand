class Player
{
  
  Weapon playerWep; 
  
  PlayerModel playerModel;
  
  void setWeapon(Weapon wep)
  {
    this.playerWep = wep; // Set the players weapon to wep.
  }
  
  Weapon getWeapon()
  {
    return this.playerWep; // Return the value of the players weapon.
  }
  
}

class PlayerModel
{
  void createModel() // Create a player model.
  {
    pushMatrix();
    translate((width/3) * 2.5 ,(height/2)+ 109); // Set the location of the playermodel.
    
    fill(0, 0, 0);
    rect(-80,55, 40, 15);
    
    fill(0, 4, 231);
    rect(-80,20, 40, 35);
    
   
    
    fill(247, 219, 183);
    rect(-85,-15, 50, 50);
    
    popMatrix();
  }
  
  void createFiringArm() // Create a firing arm for the player, and set an initial position.
  {
    pushMatrix();
    translate(80, -35);
    rect(-30,50, 40, 10);
    popMatrix();
  }
}
