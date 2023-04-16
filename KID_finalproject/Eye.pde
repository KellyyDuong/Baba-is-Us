class Eye extends Tail {

  // Default Constructor
  Eye() {
    super();
    this.x = 16;
    this.y = 500;
    this.radius = 3;
    this.c = #000000;
    this.speed = 2;
  }

  // Constructor
  Eye(float x, float y, float s, float r, color c) {
    this.x = x;
    this.y = y;
    this.speed = s;
    this.radius = r;
    this.c = c;
  }

  // To display onto canvas
  void display() {
    // To ensure only modifying fish eyes
    pushMatrix();
    fill(255);
    // Outer eye needs to be slightly bigger
    ellipse(x, y, radius + 5, radius + 5);
    // Animation
    if (x > 1000) {
      x = 0;
    }
    x += speed;
    fill(c);
    ellipse(x - 2, y, radius, radius);
    popMatrix();
  }
}
