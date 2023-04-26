class Rule
{
  int x, y, ruleType, tileNum;
  int speed = 50;
  String text;

  StringDict attributes;

  Rule(int x, int y, String text, int ruleType)
  {
    this.x = x + 25;
    this.y = y + 25;
    this.text = text;
    this.ruleType = ruleType;
    tileNum = this.x/50 + 19*(this.y/50);

    attributes = new StringDict();
    attributes.set("canBeMoved", "y");
  }

  void updateTileNum()
  {
    int tempTileNum = tileNum;
    tileNum = this.x/50 + 19*(this.y/50);
    tileNums.remove(tempTileNum);
    tileNums.put(tileNum, text);
  }

  /*
  void nounRule()
   {
   switch(text)
   {
   case "BabaRule":
   {
   break;
   }
   case "YagaRule":
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
   case "Is":
   {
   break;
   }
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
   */

  void display()
  {
    fill(#DB5656);
    square(x, y, 50);
    fill(255);
    textSize(12);
    textAlign(CENTER, CENTER);
    if (text.contains("Is"))
    {
      text("Is", x, y, 50, 50);
    } else
    {
      text(text, x, y, 50, 50);
    }
  }
}
