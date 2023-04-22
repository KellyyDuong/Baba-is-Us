class Baba extends Player {
  int numFrames = 6; // Six Different Frames of Baba
  PImage[] babaFrames = new PImage[numFrames]; // Array to store sprite
  PImage[] yagaFrames = new PImage[numFrames];
  PImage current;
  int frameCounter = 0;
  int frameSwitch = 20;
  
  // Constructor
  Baba(int x, int y, StringList names) {
    super(x, y, names);
    
    // Load in the different sprites
    for (int i = 0; i < babaFrames.length; i++) {
      String imageName = "Baba-" + nf(i+1, 1) + ".png";
      babaFrames[i] = loadImage(imageName);
    }
    for (int i = 0; i < yagaFrames.length; i++) {
      String imageName = "Yaga-" + nf(i+1, 1) + ".png";
      yagaFrames[i] = loadImage(imageName);
    }
    this.current = babaFrames[0];
  }

  // To display onto canvas
  void display() {
    // Switch between two frames every other frame
    if (frameCounter % frameSwitch == 0) {
      // Right Facing Baba
      if (right) {
        if (current == babaFrames[0]) {
          current = babaFrames[1];
        } else {
          current = babaFrames[0];
        }
      }
      if (!right) {
        if (current == babaFrames[3]) {
          current = babaFrames[5];
        } else {
          current = babaFrames[3];
        }
      }
    }
    frameCounter++;
    image(current, x, y, 100, 100);
  }
  
  void moveLeft() {
    right = false;
    int offset = -1;
    String name = "Baba_Character";
    if (playerMap.get(name).x > 0)
    {
      if (tileNums.get(playerMap.get(name).tileNum + offset) == null)
      {
        if (waterTileNums.hasValue(playerMap.get(name).tileNum + offset))
        {
          if (playerMap.get(name).attributes.get("canSwim") == "y")
          {
            playerMap.get(name).x -= speed;
            current = babaFrames[4];
            if (name == "Yaga_Character")
            {
              yaga.current = yagaFrames[3];
            }
          }
        }
        else
        {
          playerMap.get(name).x -= speed;
          current = babaFrames[4];
          if (name == "Yaga_Character")
          {
            yaga.current = yagaFrames[3];
          }
        }
      }
      else if (playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)) != null)
      {
        if (playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).attributes.get("canBeMoved") == "y" && playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).x > 0)
        {
          playerMap.get(name).x -= speed;
          current = babaFrames[4];
          playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).x -= speed;
          playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).updateTileNum(tileNums.get(playerMap.get(name).tileNum + offset));
        }
      }
      else if (ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)) != null)
      {
        if (ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).attributes.get("canBeMoved") == "y" && ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).x > 0)
        {
          playerMap.get(name).x -= speed;
          current = babaFrames[4];
          ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).x -= speed;
          ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).updateTileNum();
        }
      }
    }
    playerMap.get(name).updateTileNum(name);
  }

  void moveRight() {
    right = true;
    int offset = 1;
    String name = "Baba_Character";
    if (playerMap.get(name).x < 900)
    {
      if (tileNums.get(playerMap.get(name).tileNum + offset) == null)
      {
        if (waterTileNums.hasValue(playerMap.get(name).tileNum + offset))
        {
          if (playerMap.get(name).attributes.get("canSwim") == "y")
          {
            playerMap.get(name).x += speed;
            current = babaFrames[2];
            if (name == "Yaga_Character")
            {
              yaga.current = yagaFrames[1];
            }
          }
        }
        else
        {
          playerMap.get(name).x += speed;
          current = babaFrames[2];
          if (name == "Yaga_Character")
          {
            yaga.current = yagaFrames[1];
          }
        }
      }
      else if (playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)) != null)
      {
        if (playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).attributes.get("canBeMoved") == "y" && playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).x < 900)
        {
          playerMap.get(name).x += speed;
          current = babaFrames[2];
          playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).x += speed;
          playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).updateTileNum(tileNums.get(playerMap.get(name).tileNum + offset));
        }
      }
      else if (ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)) != null)
      {
        if (ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).attributes.get("canBeMoved") == "y" && ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).x < 900)
        {
          playerMap.get(name).x += speed;
          current = babaFrames[2];
          ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).x += speed;
          ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).updateTileNum();
        }
      }
    }
    playerMap.get(name).updateTileNum(name);
  }
}
