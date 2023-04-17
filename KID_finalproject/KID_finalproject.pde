import java.util.Map;

Player p1, p2;
Baba baba;
Yaga yaga;
Tree tree;

Rule babaRule, yagaRule, you1, you2;
Rule is1, is2;

ArrayList<String> playerNames;
ArrayList<String> ruleNames;
HashMap<String, Player> playerMap;
HashMap<String, Rule> ruleMap;
HashMap<Integer, String> tileNums;

// Initialize objects for fishes
Body b;
Eye e;
Tail t;

void setup() {
  size(1000, 800); // Tiles are 50x50 pixels, with the top left tile being at (0, 0) (really at (25, 25)) and the botton right tile being at (900, 700) (really at (925, 725))
  // Note: ALL Player/Rule objects MUST satisfy at least these two requirements:
  // 1. 0 <= x <= 900 AND x%50 == 0
  // 2. 0 <= y <= 700 AND y%50 == 0
  // Optional Requirements:
  // 1. Objects may or may not be on top of each other (i.e. have the same x and y-values). It depends on which ruleMap are affecting such objects.
  p1 = new Player("Baba"); // Start Player 1 off as Baba at (500, 100)
  p2 = new Player("Yaga"); // Start Player 2 off as Yaga at (700, 100)
  baba = new Baba(100, 50, p1.name);
  yaga = new Yaga(800, 100, p2.name);
  tree = new Tree(50, 50, "Tree");
  
  playerMap = new HashMap<String, Player>();
  playerMap.put("Baba", baba);
  playerMap.put("Yaga", yaga);
  playerMap.put("Tree", tree);
  
  playerNames = new ArrayList<String>();
  playerNames.add("Baba");
  playerNames.add("Yaga");
  playerNames.add("Tree");
  
  tileNums = new HashMap<Integer, String>();
  for (String name : playerNames)
  {
    tileNums.put(playerMap.get(name).tileNum, name);
  }
  
  babaRule = new Rule(50, 100, "Baba");
  yagaRule = new Rule(250, 100, "Yaga");
  you1 = new Rule(150, 100, "You");
  you2 = new Rule(350, 100, "You");
  
  is1 = new Rule(100, 100, "Is");
  is2 = new Rule(300, 100, "Is");
  
  ruleMap = new HashMap<String, Rule>();
  ruleMap.put("Baba", babaRule);
  ruleMap.put("Yaga", yagaRule);
  ruleMap.put("You1", you1);
  ruleMap.put("You2", you2);
  ruleMap.put("Is1", is1);
  ruleMap.put("Is2", is2);
  
  ruleNames = new ArrayList<String>();
  ruleNames.add("Baba");
  ruleNames.add("Yaga");
  ruleNames.add("You1");
  ruleNames.add("You2");
  ruleNames.add("Is1");
  ruleNames.add("Is2");
  
  for (String name : ruleNames)
  {
    tileNums.put(ruleMap.get(name).tileNum, name);
  }
  
  b = new Body();
  e = new Eye();
  t = new Tail();
}

void draw() {
  background(#9B7454);
  for (String name : playerNames)
  {
    playerMap.get(name).display();
  }
  
  for (String name : ruleNames)
  {
    ruleMap.get(name).display();
  }
  
  println(tileNums);
  
  t.display();
  b.display();
  e.display();
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
