class Yaga extends Player {
  int numFrames = 6; // Six Different Frames of Baba
  PImage[] yaga = new PImage[numFrames]; // Array to store sprite
  PImage current;
  int frameCount = 0;
  int frameSwitch = 20;

  // Constructor
  Yaga(int x, int y, String name) {
    super(x, y, name);
    
    // Load in the different sprites
    for (int i = 0; i < yaga.length; i++) {
      String imageName = "Yaga-" + nf(i+1, 1) + ".png";
      yaga[i] = loadImage(imageName);
    }
    this.current = yaga[0];
  }

  // To display onto canvas
  void display() {
    // Switch between two frames every other frame
    if (frameCount % frameSwitch == 0) {
      // Right Facing Baba
      if (right) {
        if (current == yaga[0]) {
          current = yaga[4];
        } else {
          current = yaga[0];
        }
      }
      if (!right) {
        if (current == yaga[2]) {
          current = yaga[5];
        } else {
          current = yaga[2];
        }
      }
    }
    frameCount++;
    image(current, x, y, 100, 100);
  }

  // Move Baba to the left
  void moveLeft() {
    right = false;
    if ((canBeOnTop || tileNums.get(tileNum - 1) == null) && x > 0) {
      x -= speed;
      current = yaga[4];
    }
  }

  void moveRight() {
    right = true;
    if ((canBeOnTop || tileNums.get(tileNum + 1) == null) && x < 900) {
      x += speed;
      current = yaga[2];
    }
  }
}
