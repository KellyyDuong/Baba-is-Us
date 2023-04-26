class Fireworks {
  float x, y, vx, vy, r;
  color c;

  // Constructor
  Fireworks() {
    x = random(width);
    y = random(height);
    vx = random(-2, 2);
    vy = random(-2, 2);
    r = 40;
    c = color(random(255), random(255), random(255));
  }

  // To fade in / fade out the fireworks
  void update() {
    x += vx;
    y += vy;
    vy += 0.1;
    r -= 0.1;
  }

  // To display fireworks onto canvas
  void display() {
    noStroke();
    fill(c);
    ellipse(x, y, r, r);
  }
  
  void reset() {
    x = random(width);
    y = random(height);
    vx = random(-2, 2);
    vy = random(-2, 2);
    r = 40;
    c = color(random(255), random(255), random(255));
  }
}
