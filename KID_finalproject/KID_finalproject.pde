Baba b;
Yaga y;

void setup() {
  size(1000, 800);
  b = new Baba();
  y = new Yaga();
}

void draw() {
  background(#9B7454);
  b.display();
  y.display();
}

void keyPressed() {
  // When key left/right/up/down are pressed, move Baba accordingly
  if (keyCode == LEFT) {
    b.moveLeft();
  } else if (keyCode == RIGHT) {
    b.moveRight();
  } else if (keyCode == UP) {
    b.moveUp();
  } else if (keyCode == DOWN) {
    b.moveDown();
  }

  // When key W/A/S/D are pressed, move Yaga accordingly
  if (keyCode == 'A') {
    y.moveLeft();
  } else if (keyCode == 'D') {
    y.moveRight();
  } else if (keyCode == 'W') {
    y.moveUp();
  } else if (keyCode == 'S') {
    y.moveDown();
  }
}
