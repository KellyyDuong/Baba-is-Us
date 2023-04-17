class Baba extends Player {
  int numFrames = 6; // Six Different Frames of Baba
  PImage[] baba = new PImage[numFrames]; // Array to store sprite
  PImage current;
  int frameCount = 0;
  int frameSwitch = 20;
  
  // Constructor
  Baba(int x, int y, String name) {
    super(x, y, name);
    
    // Load in the different sprites
    for (int i = 0; i < baba.length; i++) {
      String imageName = "Baba-" + nf(i+1, 1) + ".png";
      baba[i] = loadImage(imageName);
    }
    this.current = baba[0];
  }

  // To display onto canvas
  void display() {
    // Switch between two frames every other frame
    if (frameCount % frameSwitch == 0) {
      // Right Facing Baba
      if (right) {
        if (current == baba[0]) {
          current = baba[1];
        } else {
          current = baba[0];
        }
      }
      if (!right) {
        if (current == baba[3]) {
          current = baba[5];
        } else {
          current = baba[3];
        }
      }
    }
    frameCount++;
    image(current, x, y, 100, 100);
  }
  
  void moveLeft() {
    right = false;
    if ((canBeOnTop || tileNums.get(tileNum - 1) == null) && x > 0) {
      x -= speed;
      current = baba[4];
    }
  }

  void moveRight() {
    right = true;
    if ((canBeOnTop || tileNums.get(tileNum + 1) == null) && x < 900) {
      x += speed;
      current = baba[2];
    }
  }
}
