class Boat {
  float x, y; // Position of the Boat
  float s; // Speed of the Boat

  // Constructor
  Boat() {
    this.x = 50;
    this.y = 440; 
    this.s = 2;
  }
  
  // To display onto canvas
  void display() {
    fill(#895D4C);
    arc(x + 10, y, 60, 50, 0, PI);
    // Animation
    if (x > 950) {
      x = 0;
    }
    x += s;
  }
}
