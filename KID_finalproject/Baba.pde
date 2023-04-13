class Baba {
  float x, y; // Position x, y of Baba
  float speed;
  int numFrames = 6; // Two Different Frames of Baba
  PImage[] baba = new PImage[numFrames]; // Array to store sprite
  PImage current;
  boolean right; // To keep track of whether facing left/right
  int frameCount = 0;
  int frameSwitch = 20;

  // Constructor
  Baba() {
    this.x = 500;
    this.y = 500;
    this.speed = 25;
    // Load in the different sprites
    for (int i = 0; i < baba.length; i++) {
      String imageName = "Baba-" + nf(i+1, 1) + ".png";
      baba[i] = loadImage(imageName);
    }
    this.current = baba[0];
    this.right = true;
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

  // Move Baba to the left
  void moveLeft() {
    this.right = false;
    if (this.x > 0) {
      this.x -= speed;
      this.current = baba[4];
    }
  }

  // Move Baba to the right
  void moveRight() {
    this.right = true;
    if (this.x < 900) {
      this.x += speed;
      this.current = baba[2];
    }
  }

  // Move Baba up
  void moveUp() {
    if (this.y > 0) {
      this.y -= speed;
    }
  }

  // Move Baba down
  void moveDown() {
    if (this.y < 700) {
      this.y += speed;
    }
  }
}
