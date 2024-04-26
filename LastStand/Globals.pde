
// Create a set of global variables to be used across the entire game.

int menuState = 0;
int timesPressed = 0;
int roundTime = 120;
int spawnTime = 120;
int movementCalled = 0;
int zombieSpeed = 1;

float zombiePos = 90;
float bulletXPos = 0;
float bulletYPos = 0;

boolean playerIsDead = false;
boolean weaponFired = false;
boolean[] isDead = new boolean[30];
boolean roundOver = false;

ZombieController zombControl = new ZombieController(); // Declare a new zombie controller instance.

Timer fireTimer;
Timer roundTimer;
Timer spawnTimer;

Thread timerThread;
