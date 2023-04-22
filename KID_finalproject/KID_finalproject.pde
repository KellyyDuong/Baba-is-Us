import java.util.Map;

Player p1, p2, dummy1, dummy2;
Baba baba;
Yaga yaga;
Tree tree;
Flag flag;

Rule babaRule, yagaRule, flagRule, you1, you2;
Rule is1, is2, is3, canSwim;
Rule win;

ArrayList<String> playerNames;
StringList ruleNames;
HashMap<String, Player> playerMap;
HashMap<String, Rule> ruleMap;
HashMap<Integer, String> tileNums;
IntList waterTileNums;

// Initialize objects for fishes, boat, flag, pole
Body b, b2, b3;
Eye e, e2, e3;
Tail t, t2, t3;
Boat boat;
Pole pole;
BoatFlag boatflag;

void setup() {
  size(1000, 800); // Tiles are 50x50 pixels, with the top left tile being at (0, 0) (really at (25, 25)) and the botton right tile being at (900, 700) (really at (925, 725))
  // Note: ALL Player/Rule objects MUST satisfy at least these two requirements:
  // 1. 0 <= x <= 900 AND x%50 == 0
  // 2. 0 <= y <= 700 AND y%50 == 0
  // Optional Requirements:
  // 1. Objects may or may not be on top of each other (i.e. have the same x and y-values). It depends on which ruleMap are affecting such objects.
  p1 = new Player(new StringList("Baba_Character")); // Start Player 1 off as Baba at (500, 100)
  p2 = new Player(new StringList("Yaga_Character")); // Start Player 2 off as Yaga at (700, 100)
  dummy1 = new Player(-5000000, -5000000, new StringList("Dummy1"));
  dummy2 = new Player(-5500000, -5500000, new StringList("Dummy2"));
  baba = new Baba(100, 50, p1.names);
  yaga = new Yaga(750, 600, p2.names);
  tree = new Tree(50, 50, new StringList("Tree_Character"));
  flag = new Flag(800, 100, new StringList("Flag_Character"));
  boatflag = new BoatFlag();
  
  // Declare fish, boat, flag, and pole object fields
  b = new Body();
  e = new Eye();
  t = new Tail();
  b2 = new Body(50, 300, 2, 20, #4BC1FF);
  e2 = new Eye(56, 300, 2, 3, #000000);
  t2 = new Tail(40, 300, 2, #4BC1FF);
  b3 = new Body(50, 350, 2, 20, #FF7E4B);
  e3 = new Eye(56, 350, 2, 3, #000000);
  t3 = new Tail(40, 350, 2, #FF7E48);
  boat = new Boat();
  pole = new Pole();
  
  playerMap = new HashMap<String, Player>();
  playerMap.put("Baba_Character", baba);
  playerMap.put("Yaga_Character", yaga);
  playerMap.put("Dummy1", dummy1);
  playerMap.put("Dummy2", dummy2);
  playerMap.put("Tree_Character", tree);
  playerMap.put("Flag_Character", flag);
  
  playerNames = new ArrayList<String>();
  playerNames.add("Baba_Character");
  playerNames.add("Yaga_Character");
  playerNames.add("Dummy1");
  playerNames.add("Dummy2");
  playerNames.add("Tree_Character");
  playerNames.add("Flag_Character");
  
  tileNums = new HashMap<Integer, String>();
  for (String name : playerNames)
  {
    tileNums.put(playerMap.get(name).tileNum, name);
  }
  
  /*
    Fourth parameter in the Rule constructor is ruleType. Here's what each value means:
    1 = Noun rule/Player object
    2 = Verb that requires two noun rules in some sort of line to function
    3 = Verb that requires a noun rule either on top or to the left of the rule in question to function
    4 = Adjective that requires a "Is" block either on top or to the left of the rule in question to function
    
    A completed "rule set" strictly requires a noun and a verb (e.g. "Baba" "Can Swim"). An adjective is optional.
    A completed "rule set" strictly must be either two or three Rules long.
    A completed "rule set" strictly must have a Rule.ruleType == 1 in the first position and Rule.ruleType == 2 or 3 in the second position.
  */
  
  babaRule = new Rule(0, 200, "Baba", 1);
  yagaRule = new Rule(600, 600, "Yaga", 1);
  flagRule = new Rule(800, 650, "Flag", 1);
  you1 = new Rule(100, 200, "Player 1", 1);
  you2 = new Rule(600, 700, "Player 2", 1);
  
  is1 = new Rule(50, 200, "Is1", 2);
  is2 = new Rule(600, 650, "Is2", 2);
  is3 = new Rule(850, 650, "Is3", 2);
  
  canSwim = new Rule(700, 550, "Can Swim", 3);
  
  win = new Rule(200, 100, "Win", 4);
  
  ruleMap = new HashMap<String, Rule>();
  ruleMap.put("Baba", babaRule);
  ruleMap.put("Yaga", yagaRule);
  ruleMap.put("Flag", flagRule);
  ruleMap.put("Player 1", you1);
  ruleMap.put("Player 2", you2);
  ruleMap.put("Is1", is1);
  ruleMap.put("Is2", is2);
  ruleMap.put("Is3", is3);
  ruleMap.put("Can Swim", canSwim);
  ruleMap.put("Win", win);
  
  ruleNames = new StringList();
  ruleNames.append("Baba");
  ruleNames.append("Yaga");
  ruleNames.append("Flag");
  ruleNames.append("Player 1");
  ruleNames.append("Player 2");
  ruleNames.append("Is1");
  ruleNames.append("Is2");
  ruleNames.append("Is3");
  ruleNames.append("Can Swim");
  ruleNames.append("Win");
  
  for (String name : ruleNames)
  {
    tileNums.put(ruleMap.get(name).tileNum, name);
  }
  
  waterTileNums = new IntList();
  for (int i = 95; i <= 189; i++)
  {
    waterTileNums.append(i);
  }
  for (int i = 7; i <= 11; i++)
  {
    for (int j = 0; j < 15; j++)
    {
      if (!waterTileNums.hasValue(i + 19*j))
      {
        waterTileNums.append(i + 19*j);
      }
    }
  }
}

void youTest(Rule theRule, Player p, int superOffset)
{
  if (ruleMap.get(tileNums.get(theRule.tileNum + superOffset)) != null)
  {
    if (ruleMap.get(tileNums.get(theRule.tileNum + superOffset)).text.contains("Is") && ruleMap.get(tileNums.get(theRule.tileNum + superOffset*2)) != null)
    {
      if (ruleMap.get(tileNums.get(theRule.tileNum + superOffset*2)).ruleType == 1)
      {
        checkForBabaOrYaga(theRule, p, superOffset*2);
      }
    }
  }
}

void swimTest(Rule theRule, int superOffset)
{
  if (ruleMap.get(tileNums.get(theRule.tileNum + superOffset)) != null)
  {
    if (ruleMap.get(tileNums.get(theRule.tileNum + superOffset)).ruleType == 1)
    {
      if (!ruleMap.get(tileNums.get(theRule.tileNum + superOffset)).text.contains("Player"))
      {
        String newName = ruleMap.get(tileNums.get(theRule.tileNum + superOffset)).text + "_Character";
        playerMap.get(newName).attributes.set("canSwim", "y");
      }
    }
  }
}

void adjectiveTest(Rule theRule, int superOffset)
{
  if (ruleMap.get(tileNums.get(theRule.tileNum - superOffset)) != null && ruleMap.get(tileNums.get(theRule.tileNum + superOffset)) != null)
  {
    if (ruleMap.get(tileNums.get(theRule.tileNum - superOffset)).ruleType == 1 && ruleMap.get(tileNums.get(theRule.tileNum + superOffset)).ruleType == 4)
    {
      switch(ruleMap.get(tileNums.get(theRule.tileNum + superOffset)).text)
      {
        case "Win":
        {
          String newName = ruleMap.get(tileNums.get(theRule.tileNum - superOffset)).text + "_Character";
          playerMap.get(newName).attributes.set("isWin", "y");
          break;
        }
      }
    }
  }
}

void checkForBabaOrYaga(Rule theRule, Player p, int offset)
{
  if (ruleMap.get(tileNums.get(theRule.tileNum + offset)).text == "Baba")
  {
    p.names.append("Baba_Character");
  }
  else if (ruleMap.get(tileNums.get(theRule.tileNum + offset)).text == "Yaga")
  {
    p.names.append("Yaga_Character");
  }
  else
  {
    String newName = ruleMap.get(tileNums.get(theRule.tileNum + offset)).text + "_Character";
    p.names.append(newName);
  }
  p.playerIsAssigned = true;
}

void ruleCheck(Rule theRule) // We only care about checking for verbs to create rule sets AND if p1 and p2 are each assigned to a Player object
{
  switch(theRule.text)
  {
    case "Player 1":
    {
      p1.names.clear();
      p1.playerIsAssigned = false;
      
      youTest(theRule, p1, -19);
      youTest(theRule, p1, 19);
      youTest(theRule, p1, -1);
      youTest(theRule, p1, 1);
      
      if (p1.playerIsAssigned == false)
      {
        p1.names.clear();
        p1.names.append("Dummy1");
      }
      break;
    }
    case "Player 2":
    {
      p2.names.clear();
      p2.playerIsAssigned = false;
      
      youTest(theRule, p2, -19);
      youTest(theRule, p2, 19);
      youTest(theRule, p2, -1);
      youTest(theRule, p2, 1);
      
      if (p2.playerIsAssigned == false)
      {
        p2.names.clear();
        p2.names.append("Dummy2");
      }
      break;
    }
    case "Can Swim":
    {
      swimTest(theRule, -19);
      swimTest(theRule, 19);
      swimTest(theRule, -1);
      swimTest(theRule, 1);
      break;
    }
    case "Is1":
    {
    }
    case "Is2":
    {
    }
    case "Is3":
    {
      adjectiveTest(theRule, 19);
      adjectiveTest(theRule, 1);
      break;
    }
  }
}

int playersAroundWin(Player p)
{
  for (String name : p1.names)
  {
    if (playerMap.get(name).tileNum == p.tileNum - 1 || playerMap.get(name).tileNum == p.tileNum + 1 || playerMap.get(name).tileNum == p.tileNum + 19 || playerMap.get(name).tileNum == p.tileNum - 19 || playerMap.get(name).attributes.get("isWin") == "y")
    {
      for (String name2: p2.names)
      {
        if (playerMap.get(name2).tileNum == p.tileNum - 1 || playerMap.get(name2).tileNum == p.tileNum + 1 || playerMap.get(name2).tileNum == p.tileNum + 19 || playerMap.get(name2).tileNum == p.tileNum - 19 || playerMap.get(name2).attributes.get("isWin") == "y")
        {
          return 1;
        }
      }
    }
  }
  return 0;
}

void victoryCheck()
{
  int hasWon = 0;
  for (String name : playerNames)
  {
    if (playerMap.get(name).attributes.get("isWin") == "y")
    {
      hasWon += playersAroundWin(playerMap.get(name));
    }
  }
  if (hasWon > 0)
  {
    background(255);
    textSize(72);
    textAlign(CENTER, CENTER);
    text("YOU WIN!", width/2, height/2);
  }
}

void draw() {
  background(#9B7454);
  for (int i : waterTileNums)
  {
    int x = (i%19)*50 + 25;
    int y = (i - i%19)/19*50 + 25;
    fill(#4592E3);
    square(x, y, 50);
  }
  
  for (String name : playerNames)
  {
    playerMap.get(name).display();
  }
  
  for (String name : playerNames)
  {
    for (String attribute : playerMap.get(name).attributes.keyArray())
    {
      if (attribute != "canBeOnTop" && attribute != "canBeMoved")
      {
        playerMap.get(name).attributes.set(attribute, "n");
      }
    }
  }
  tree.attributes.set("canBeMoved", "n");
  
  for (String name : ruleNames)
  {
    Rule theRule = ruleMap.get(name);
    theRule.display();
    ruleCheck(theRule);
  }
  
  // Display objects
  t.display();
  b.display();
  e.display();
  t2.display();
  b2.display();
  e2.display();
  t3.display();
  b3.display();
  e3.display();
  boat.display();
  pole.display();
  boatflag.display();
  
  victoryCheck();
}

void keyPressed() {
  // When key left/right/up/down are pressed, move Player 1 accordingly
  if (keyCode == LEFT) {
    p1.moveLeft();
  } else if (keyCode == RIGHT) {
    p1.moveRight();
  } else if (keyCode == UP) {
    p1.moveUp();
  } else if (keyCode == DOWN) {
    p1.moveDown();
  }

  // When key W/A/S/D are pressed, move Player 2 accordingly
  if (keyCode == 'A') {
    p2.moveLeft();
  } else if (keyCode == 'D') {
    p2.moveRight();
  } else if (keyCode == 'W') {
    p2.moveUp();
  } else if (keyCode == 'S') {
    p2.moveDown();
  }
}
