class Pause
{
  Button b1, b2, b3;

  // Constructor
  Pause()
  {
    b1 = new Button(500, 400, 300, 100, color(0, 0, 0));
    b2 = new Button(500, 550, 300, 100, color(0, 0, 0));
    b3 = new Button(500, 700, 300, 100, color(0, 0, 0));
  }

  void display()
  {
    textSize(200);
    text("PAUSED", 500, 150);

    b1.display("Resume");
    b2.display("Main Menu");
    b3.display("High Scores");
  }
}
