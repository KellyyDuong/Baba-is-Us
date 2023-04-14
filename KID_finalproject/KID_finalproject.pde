Baba baba;
Yaga yaga;
// Initialize objects for fishes
Body b;
Eye e;
Tail t;

void setup() {
  size(1000, 800);
  baba = new Baba();
  yaga = new Yaga();
  b = new Body();
  e = new Eye(); 
  t = new Tail();
}

void draw() {
  background(#9B7454);
  baba.display();
  yaga.display();
  t.display();
  b.display();
  e.display();
}

void keyPressed() {
  // When key left/right/up/down are pressed, move Baba accordingly
  if (keyCode == LEFT) {
    baba.moveLeft();
  } else if (keyCode == RIGHT) {
    baba.moveRight();
  } else if (keyCode == UP) {
    baba.moveUp();
  } else if (keyCode == DOWN) {
    baba.moveDown();
  }

  // When key W/A/S/D are pressed, move Yaga accordingly
  if (keyCode == 'A') {
    yaga.moveLeft();
  } else if (keyCode == 'D') {
    yaga.moveRight();
  } else if (keyCode == 'W') {
    yaga.moveUp();
  } else if (keyCode == 'S') {
    yaga.moveDown();
  }
}
