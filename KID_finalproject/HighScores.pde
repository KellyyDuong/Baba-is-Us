class HighScores
{
  Button b;
  String[] scores;
  int[] intScores;

  // Constructor
  HighScores()
  {
    b = new Button(75, 40, 150, 85, color(0, 0, 0));
    scores = loadStrings("highScores.txt");
    intScores = new int[scores.length];
    for (int i = 0; i < scores.length; i++)
    {
      intScores[i] = Integer.parseInt(scores[i]);
    }
    intScores = sort(intScores);
  }

  void display()
  {
    pushMatrix();
    b.display("Back");
    textSize(150);
    text("HIGH SCORES", 500, 250);
    textSize(75);
    text(intScores[intScores.length - 1], 500, 500);
    text(intScores[intScores.length - 2], 500, 600);
    text(intScores[intScores.length - 3], 500, 700);
    popMatrix();
  }
}
