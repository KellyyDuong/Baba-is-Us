class Start
{
  Button b1;
  Button b2;
  Button b3;
  Start()
  {
    b1 = new Button(300, 350, 300, 100, color(0, 0, 0));
    b2 = new Button(700, 350, 300, 100, color(0, 0, 0));
    b3 = new Button(500, 500, 300, 100, color(0, 0, 0));
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
    
    b1.display("1 Player");
    b2.display("2 Players");
    b3.display("High Scores");
    /*
    rectMode(CENTER);
    fill(0);
    rect(300, 350, 300, 100);
    rect(700, 350, 300, 100);
    rect(500, 500, 300, 100);
    textSize(50);
    fill(255);
    text("1 Player", 300, 375);
    text("2 Players", 700, 375);
    text("High Scores", 500, 525);
*/
    popMatrix();
  }
}
