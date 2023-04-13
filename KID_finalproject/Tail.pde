class Tail extends Body {

  // Default Constructor
  Tail() {
    super();
    this.x = -20;
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
    translate(x, y, 0);
    lights();
    noStroke();
    fill(c);
    // Scaling to create pyramid -- default
    scale(0.7, 0.8, 0.1);
    // Rotate pyramid to represent tail
    rotate(-1 * HALF_PI);
    // Draw pyramid
    beginShape(TRIANGLES);
    vertex(0, 50, 0);
    vertex(-35, -20, 35);
    vertex(35, -20, 35);
    vertex(0, 50, 0);
    vertex(35, -20, 35);
    vertex(35, -20, -35);
    vertex(0, 50, 0);
    vertex(35, -20, -35);
    vertex(-35, -20, -35);
    vertex(0, 50, 0);
    vertex(-35, -20, -35);
    vertex(-35, -20, 35);
    endShape(CLOSE);
    // Animation
    if (x > 1000) {
      x = 0;
    }
    x += speed;
    popMatrix();
  }
}
