class Rule
{
  int x, y, tileNum;
  int speed = 50;
  String text;
  
  Rule(int x, int y, String text)
  {
    this.x = x + 25;
    this.y = y + 25;
    this.text = text;
    tileNum = this.x/50 + 19*(this.y/50);
  }
  
  void nounRule()
  {
    switch(text)
    {
      case "Baba":
      {
        break;
      }
      case "Yaga":
      {
        break;
      }
      case "You":
      {
        break;
      }
      case "Tree":
      {
        break;
      }
      case "Water":
      {
        break;
      }
      case "Lava":
      {
        break;
      }
      case "Axe":
      {
        break;
      }
      case "Plank":
      {
        break;
      }
      case "Ghost":
      {
        break;
      }
    }
  }
  
  void verbRule()
  {
    switch(text)
    {
      case "Can Swim":
      {
        break;
      }
      case "Equips":
      {
        break;
      }
    }
  }
  
  void adjectiveRule()
  {
    switch(text)
    {
      case "Win":
      {
        break;
      }
      case "Floaty":
      {
        break;
      }
      case "Strong":
      {
        break;
      }
      case "Weak":
      {
        break;
      }
    }
  }
  
  void display()
  {
    fill(#DB5656);
    square(x, y, 50);
    fill(255);
    textSize(15);
    textAlign(CENTER, CENTER);
    text(text, x, y, 50, 50);
  }
}
