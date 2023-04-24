class EnvironmentObj {
  int x, y; // Position of Objects
  int type; // Type of Object
  PImage rock; // Type 1
  PImage water; // Type 2
  PImage lava; // Type 3
  PImage lily; // Type 4
  PImage algae; // Type 5

  // Default Constructor
  EnvironmentObj() {
    this.x = 75;
    this.y = 75;
    rock = loadImage("rock.png");
    water = loadImage("water.png");
    lava = loadImage("lava.png");
    lily = loadImage("lily.png");
    algae = loadImage("algae.png");
  }

  // Constructor
  EnvironmentObj(int x, int y, int type) {
    this.x = x;
    this.y = y;
    this.type = type;
    rock = loadImage("rock.png");
    water = loadImage("water.png");
    lava = loadImage("lava.png");
    lily = loadImage("lily.png");
    algae = loadImage("algae.png");
  }

  // display
  void display() {
    if (type == 1) {
      image(rock, x, y, 50, 50);
    } else if (type == 2) {
      image(water, x, y, 50, 50);
    } else if (type == 3) {
      image(lava, x, y, 50, 50);
    } else if (type == 4) {
      image(lily, x, y, 50, 50);
    } else if (type == 5) {
      image(algae, x, y, 50, 50);
    }
  }
}
