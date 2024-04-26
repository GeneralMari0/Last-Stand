
// Create an abstract weapon class.
abstract class Weapon
{
  int fireDelay;
  
  // return fireDelay.
  int getFireDelay()
  {
    return this.fireDelay;
  }
  // Fire the weapon.
  void fireWeapon()
  {
  }
  // Draw the the crosshair on screen by creating two vertical and two horizontal lines.
  void drawCrosshair()
  {
    stroke(255, 0, 0);
    strokeWeight(3);

    line(mouseX, mouseY-20, mouseX, mouseY - 80);
    line(mouseX, mouseY+20, mouseX, mouseY + 80);

    line(mouseX-20, mouseY, mouseX - 80, mouseY);
    line(mouseX+20, mouseY, mouseX + 80, mouseY);

    strokeWeight(0);
  }
  // Create the weapon view model and create a firing arm with plyModel.
  void createWeaponViewModel(PlayerModel plyModel)
  {
  }
  // Build the weapon model and display to the screen.
  void buildWeaponModel()
  {
  }
  // Build a bullet tracer when the weapon is fired.
  void buildTracer()
  {
  }
}

// Pistol class inherits the weapon class.
class Pistol extends Weapon
{
  int fireDelay = 1;
  
  int getFireDelay()
  {
    return this.fireDelay;
  }
  // Fire the weapon.
  void fireWeapon()
  {
    weaponFired = true;
    weaponFired = false;
    timerThread.start(); // Start the fire delay timer on a seperate thread.
  }

// Create the pistol weapon model and display to the screen.
  void buildWeaponModel()
  {
    fill(0, 0, 0);
    rect (0, 0, 30, 10);
    rect (20, 10, 10, 12);
  }
  
  // Create the firing arm and weapon view model, and change the angle of both depending on the mouse position.
  void createWeaponViewModel(PlayerModel plyModel)
  {
    pushMatrix();
    translate(920, 545);
    scale(-1, -1);
    float angle = atan2(mouseY - 545, mouseX - 920);
    rotate(angle);
    translate(-80, -20);
    fill(0, 4, 231);
    plyModel.createFiringArm();
    this.buildWeaponModel();
    popMatrix();
  }

// Create a new bullet tracer based on the mouse position.
  void buildTracer()
  {
    pushMatrix();
    translate(920, 545);
    float angle = atan2(mouseY - 545, mouseX - 920);
    rotate(angle);
    rect(0,0,80,80);
    translate(-80, -20);
 
    popMatrix();
  }
}

// Shotgun inherits weapon class.
class ShotGun extends Weapon
{
  
  int fireDelay = 2;
  
  int getFireDelay()
  {
    return this.fireDelay;
  }
  
  
  // Fire the weapon.
  void fireWeapon()
  {
    weaponFired = true;
    timerThread.start();  // Start a new fire delay timer on a seperate thread.
  }

  // Create the shotgun weapon model and display to the screen.
  void buildWeaponModel()
  {
    pushMatrix();
    fill(145, 90, 0);
    pushMatrix();
    translate(-20, 26);
    rotate(radians(30));
    rect (40, -50, 40, 10);
    popMatrix();

    fill(0, 0, 0);
    rect (0, 0, 50, 13);

    fill(94, 94, 94);
    rect (4, 8, 35, 10);
    popMatrix();
  }
// Create the firing arm and weapon view model, and change the angle of both depending on the mouse position.
  void createWeaponViewModel(PlayerModel plyModel)
  {
    pushMatrix();
    translate(920, 545);
    scale(-1, -1);
    float angle = atan2(mouseY - 545, mouseX - 920);
    rotate(angle);
    translate(-80, -20);
    fill(0, 4, 231);
    plyModel.createFiringArm();
    this.buildWeaponModel();
    popMatrix();
  }
// Create a new bullet tracer based on the mouse position.
  void buildTracer()
  {
    pushMatrix();
    translate(920, 545);
    float angle = atan2(mouseY - 545, mouseX - 920);
    rotate(angle);
    rect(0,0,80,80);
    translate(-80, -20);
 
    popMatrix();
   
  }
}

class Rifle extends Weapon
{
  int fireDelay = 1;
  
  int getFireDelay()
  {
    return this.fireDelay;
  }
  // Fire the weapon.
  void fireWeapon()
  {
    weaponFired = true;
    timerThread.start(); // Start a new fire delay timer on a seperate thread.
  }
// Create the Rifle weapon model and display to the screen.
  void buildWeaponModel()
  {
    fill(0, 0, 0);
    rect (28, -8, 15, 8);
    rect (0, 0, 50, 10);
    rect (36, 10, 10, 10);
    rect (10, 10, 10, 10);
  }
// Create the firing arm and weapon view model, and change the angle of both depending on the mouse position.
  void createWeaponViewModel(PlayerModel plyModel)
  {
    pushMatrix();
    translate(920, 545);
    scale(-1, -1);
    float angle = atan2(mouseY - 545, mouseX - 920);
    rotate(angle);
    translate(-80, -20);
    fill(0, 4, 231);
    plyModel.createFiringArm();
    this.buildWeaponModel();
    popMatrix();
  }

// Create a new bullet tracer based on the mouse position.
  void buildTracer()
  {
    pushMatrix();
    translate(920, 545);
    float angle = atan2(mouseY - 545, mouseX - 920);
    rotate(angle);
    rect(0,0,80,80);
    translate(-80, -20);
 
    popMatrix();
  }
}
