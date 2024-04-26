PFont font;
color hoverColor1 = color(214, 214, 214);
color hoverColor2 = color(214, 214, 214);
color hoverColor3 = color(214, 214, 214);

WeaponMenu wepMenu;

BackGround bg = new BackGround();

Player ply = new Player();



class GameMenu
{
  void getBackground(String text) // Create a menu background
  {
    if (!playerIsDead)// Load background image if player isnt dead
    {
     bg.loadBackground();
    }
    
    textSize(128);
    text(text, 213, 180);
  }
  
  void startNewGame() // Create a button to start a new game.
  {
    
    fill(hoverColor1);
    rect(500, 300, 250, 80);
    
    fill(255,255,255);
    textSize(35);
    text("START GAME", 513, 350);
    
    // If the mouse position is within the the button rectangle, change the color to red.
    if (mouseX <= 750 && mouseX >= 500 && mouseY > 300 && mouseY < 380)
    {
      hoverColor1 = color(227, 39, 14);
      
      // If the mouse is pressed, reset the button color and change the menustate.
      if(mousePressed)
      {
       hoverColor1 = color(214, 214, 214);
       menuState = 1;
        
      }
    }
    else // In any other case, dont change the button color.
    {
      hoverColor1 = color(214, 214, 214);
    }
  }
  void openCredits() // Create a button to view the leaderboard.
  {
    fill(hoverColor2);
    rect(500, 400, 250, 80);
    
    fill(255,255,255);
    textSize(32);
    text("LEADERBOARD", 500, 450);
    
    // If the mouse position is within the the button rectangle, change the color to red.
    if (mouseX <= 750 && mouseX >= 500 && mouseY > 400 && mouseY < 480)
    {
      hoverColor2 = color(227, 39, 14);
    }
    else // In any other case, dont change the button color.
    {
      hoverColor2 = color(214, 214, 214);
    }
  }
  void quitGame() // Create a button that allows the user to quit the game.
  {
    fill(hoverColor3);
    rect(500, 500, 250, 80);
    
    fill(255,255,255);
    textSize(35);
    text("QUIT", 580, 550);
    
    // If the mouse position is within the the button rectangle, change the color to red.
    if (mouseX <= 750 && mouseX >= 500 && mouseY > 500 && mouseY < 580)
    {
      hoverColor3 = color(227, 39, 14);
      
      // If the mouse is pressed, call the exit function and terminate the program.
      if(mousePressed)
      {
        exit();
      }
    }
    else // In all other cases, dont change hover color
    {
      hoverColor3 = color(214, 214, 214);
    }
    
  }
  
  
}


// Define initial settings for the game.
void setup()
{
  size(1200,800);
  noStroke();
  font = createFont("Arial Bold", 24);
  textFont(font);
  frameRate(60);
  
  zombies = new ArrayList<Zombie>(); // Declare a new zombie arraylist object and store it in zombies.
  zombControl.initializePosXList(); // Initialize list of all zombie Positions for the game.
  zombControl.initializePosYList();
}

// Redraw all code within the function once per frame.
void draw()
{
  
  // If the menuState = 1, clear the screen, reload the background image, and open the weapons menu.
  if ( menuState == 1)
  {
    background(125,125,125);
    bg.loadBackground();
    WeaponMenu wepMenu = new WeaponMenu();
    wepMenu.openWeaponMenu();
  }
  // If menuState = 2, then start a new round
  else if (menuState == 2)
  {
     Round round = new Round();
     round.startRound();
  }
  // If menuState = 3, then create another game menu.
  else if (menuState == 3)
  {
    GameMenu menu = new GameMenu();
    textSize(128);
    text("YOU WIN!", 300, 300);
   
    menu.quitGame();
  }
  else if (menuState == 4)
  {
    GameMenu menu = new GameMenu();
    textSize(128);
    text("YOU'RE DEAD!", 213, 300);
   
    menu.quitGame();
  }
  // If menuState is equal to 0, load the main menu and three buttons.
  else
  {
    GameMenu menu = new GameMenu();

    menu.getBackground("LAST STAND");
  
    menu.startNewGame();
    menu.openCredits();
    menu.quitGame();
  
  }
}
// Create a new weapon menu to allow the player to select their weapon.
 class WeaponMenu
{
  Pistol pist = new Pistol();
  Rifle rifle = new Rifle();
  ShotGun shot = new ShotGun();
   void openWeaponMenu() // Load all three weapons onto the screen and allow the user to pick their weapon.
   {
     
     Weapon[] wepList = new Weapon[3]; // Declare a weapon array with 3 elements.
     wepList[0] = pist;  // Load the pistol into the first element.
     wepList[1] = rifle; // Load the rifle into the second element.
     wepList[2] = shot;  // Load the shotgun into the third element.
     fill(255,255,255);
     textSize(40);
     text("CHOOSE YOUR WEAPON", 330, 220);
     textSize(25);
     // For each each iteration, create a new button and depending on the value of i, display a specific weapon.
      for (int i = 0; i < 3; i++)
      { 
        if(i==0)
        {
          fill(hoverColor1);
          rect(((width/4)*i) + 200,(height/2)-150,150,150);
           fill(255,255,255);
           text("PISTOL", ((width/4)*i) + 220,(height/2)-100);
        }
        else if(i==1)
        {
          fill(hoverColor2);
          rect(((width/4)*i) + 200,(height/2)-150,150,150);
           fill(255,255,255);
          text("RIFLE", ((width/4)*i) + 240,(height/2)-100);
        }
        else if (i==2)
        {
          fill(hoverColor3);
          rect(((width/4)*i) + 200,(height/2)-150,150,150);
          fill(255,255,255);
          text("SHOTGUN", ((width/4)*i) + 210,(height/2)-100);
        }
        
        // Create a black button outline for each button.
        pushMatrix();
        noFill();
        stroke(0);
        strokeWeight(5);
        rect(((width/4)*i) + 200,(height/2)-150,150,150);
        popMatrix();
        
        
        // Render the weapon model to the screen.
        pushMatrix();
        strokeWeight(0);
        translate(((width/4)*i) + 250 ,(height/2)-50);
        wepList[i].buildWeaponModel();
        popMatrix();
      }
    
    // If the mouse pointer is within the weapon button box, then change the inner box color to red.
    if (mouseX <= ((width/4)*0) + 350 && mouseX >= 200 && mouseY > (height/2)-150 && mouseY < (height/2))
    {
      hoverColor1 = color(227, 39, 14);
      
      // if the mouse is pressed, set the weapon as the players active weapon and change the menuState to 2.
      if (mousePressed)
      {
        ply.setWeapon(wepList[0]); 
        menuState = 2;
      }
    }
    else
    {
      hoverColor1 = color(214, 214, 214);
    }
    
    // If the mouse pointer is within the weapon button box, then change the inner box color to red.
     if (mouseX <= ((width/4)) + 350 && mouseX >= 500 && mouseY > (height/2)-150 && mouseY < (height/2))
    {
      hoverColor2 = color(227, 39, 14);
      
      // if the mouse is pressed, set the weapon as the players active weapon and change the menuState to 2
      if (mousePressed)
      {
        ply.setWeapon(wepList[1]); 
        menuState = 2;
      }
    }
    else
    {
      hoverColor2 = color(214, 214, 214);
    }
    // If the mouse pointer is within the weapon button box, then change the inner box color to red.
     if (mouseX <= 950 && mouseX >= 800 && mouseY > (height/2)-150 && mouseY < (height/2))
    {
      hoverColor3 = color(227, 39, 14);
      
      // if the mouse is pressed, set the weapon as the players active weapon and change the menuState to 2
      if (mousePressed)
      {
        ply.setWeapon(wepList[2]); 
        menuState = 2;
      }
    }
    else // In all other cases, do not change button color
    {
      hoverColor3 = color(214, 214, 214);
    }
    
      
   }
    
    
}
  
  
