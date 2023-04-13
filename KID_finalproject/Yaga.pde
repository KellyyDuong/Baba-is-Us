class Yaga {
  float x, y; // Position x, y of Baba
  float speed;
  int numFrames = 6; // Two Different Frames of Baba
  PImage[] yaga = new PImage[numFrames]; // Array to store sprite
  PImage current;
  boolean right; // To keep track of whether facing left/right
  int frameCount = 0;
  int frameSwitch = 20;

  // Constructor
  Yaga() {
    this.x = 100;
    this.y = 100;
    this.speed = 25;
    // Load in the different sprites
    for (int i = 0; i < yaga.length; i++) {
      String imageName = "Yaga-" + nf(i+1, 1) + ".png";
      yaga[i] = loadImage(imageName);
    }
    this.current = yaga[0];
    this.right = true;
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
    this.right = false;
    if (this.x > 0) {
      this.x -= speed;
      this.current = yaga[3];
    }
  }

  // Move Baba to the right
  void moveRight() {
    this.right = true;
    if (this.x < 900) {
      this.x += speed;
      this.current = yaga[1];
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
