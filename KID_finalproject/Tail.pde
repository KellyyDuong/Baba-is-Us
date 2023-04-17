class Tail extends Body {

  // Default Constructor
  Tail() {
    super();
    this.x = 0;
    this.y = 500;
    this.speed = 2;
  }

  // Constructor
  Tail(float x, float y, float s, color c) {
    this.x = x;
    this.y = y;
    this.speed = s;
    this.c = c;
  }

  // To display onto canvas + animation
  void display() {
    // To ensure only modifying fish tail
    pushMatrix();
    fill(c);
    // Rotate pyramid to represent tail

    triangle(x + 2, y, x - 10, y - 10, x - 10, y + 10);
    // Animation
    if (x > 1000) {
      x = 0;
    }
    x += speed;
    popMatrix();
  }
}
