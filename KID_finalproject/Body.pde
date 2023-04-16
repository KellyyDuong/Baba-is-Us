class Body extends Fish {
  float radius;
  color c;

  // Default Constructor
  Body() {
    super();
    this.radius = 20;
    this.c = #78CE2A;
  }

  // Constructor
  Body(float x, float y, float s, float r, color c) {
    super(x, y, s);
    this.radius = r;
    this.c = c;
  }

  // To display onto canvas + animation
  void display() {
    // To ensure only modifying fish body
    pushMatrix();
    noStroke();
    fill(c);
    ellipse(x, y, radius + 10, radius);
    // Animation
    if (x > 1000) {
      x = 0;
    }
    x += speed;
    popMatrix();
  }
}
