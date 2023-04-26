class Eye extends Tail {
  float scale;
  float pupil_x;
  boolean dilate = true;

  // Default Constructor
  Eye() {
    super();
    this.x = 56;
    this.pupil_x = 56;
    this.y = 500;
    this.radius = 3;
    this.c = #000000;
    this.scale = 0.5;
    this.speed = 2;
  }

  // Constructor
  Eye(float x, float y, float s, float r, color c) {
    this.x = x;
    this.pupil_x = x;
    this.y = y;
    this.speed = s;
    this.radius = r;
    this.c = c;
    this.scale = 0.5;
  }

  // To display onto canvas
  void display() {
    // To ensure only modifying fish eyes
    pushMatrix();
    fill(255);
    // Outer eye needs to be slightly bigger
    ellipse(x, y, radius + 5, radius + 5);
    // Animation
    if (x > 950) {
      x = 0;
    }
    x += speed;
    popMatrix();
    pushMatrix();
    translate(pupil_x, y);
    // Determine if dilate/un-dilate
    if (dilate) {
      scale += 0.01;
      if (scale >= 1.8) {
        dilate = false;
      }
    } else {
      scale -= 0.01;
      if (scale <= 1.0) {
        dilate = true;
      }
    }
    scale(scale);
    fill(c);
    ellipse(0, 0, radius, radius);
    popMatrix();
    // Animation for Pupils
    if (pupil_x > 950) {
      pupil_x = 0;
    }
    pupil_x += speed;
  }
}
