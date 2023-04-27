class Start
{
  Button b3;
  Button b2;
  Start()
  {
    b2 = new Button(500, 400, 300, 100, color(0, 0, 0));
    b3 = new Button(500, 600, 300, 100, color(0, 0, 0));
  }
  
  void display()
  {
    pushMatrix();
    fill(255);
    background(#9B7454);
    textFont(startFont);
    textSize(200);
    textAlign(CENTER);
    text("BABA IS US", 500, 250);
    
    b2.display("Play");
    b3.display("High Scores");

    popMatrix();
  }
}
