PImage img;

class BackGround
{
  // Load the background image onto the screen.
  void loadBackground()
  {
    img = loadImage("Background.jpeg");
    image(img, 0, 0);
  }
}
