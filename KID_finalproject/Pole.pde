class Pole extends Boat {

  // Constructor
  Pole() {
    this.x = 55;
    this.y = 400;
    this.s = 2;
  }

  // display to canvas
  void display() {
    fill(#895D4C);
    rect(x, y, 8, 50);
    // Animation
    if (x > 950) {
      x = 0;
    }
    x += s;
  }
}
