class BoatFlag extends Pole {
  color c;
  int counter;
  boolean flip;

  BoatFlag() {
    this.x = 55;
    this.y = 395;
    this.s = 2;
    this.c =#FF2B00;
    this.flip = false;
    this.counter = 0;
  }

  // Display onto canvas
  void display() {
    fill(c);
    if (counter % 50 == 0) {
      flip = !flip;
    }
    if (!flip) {
      triangle(x - 25, y + 10, x + 8, y, x + 8, y + 20);
    } else {
      triangle(x + 30, y + 10, x, y, x, y + 20);
    }
    counter ++;
    // Animation
    if (x > 950) {
      x = 0;
    }
    x += s;
  }
}
