class Yaga extends Player {
  int numFrames = 6; // Six Different Frames of Baba
  PImage[] yagaFrames = new PImage[numFrames]; // Array to store sprite
  PImage[] babaFrames = new PImage[numFrames]; // Array to store sprite
  PImage current;
  int frameCounter = 0;
  int frameSwitch = 20;

  // Constructor
  Yaga(int x, int y, StringList names) {
    super(x, y, names);
    
    // Load in the different sprites
    for (int i = 0; i < yagaFrames.length; i++) {
      String imageName = "Yaga-" + nf(i+1, 1) + ".png";
      yagaFrames[i] = loadImage(imageName);
    }
    for (int i = 0; i < babaFrames.length; i++) {
      String imageName = "Baba-" + nf(i+1, 1) + ".png";
      babaFrames[i] = loadImage(imageName);
    }
    this.current = yagaFrames[0];
  }

  // To display onto canvas
  void display() {
    // Switch between two frames every other frame
    if (frameCounter % frameSwitch == 0) {
      // Right Facing Baba
      if (right) {
        if (current == yagaFrames[0]) {
          current = yagaFrames[4];
        } else {
          current = yagaFrames[0];
        }
      }
      if (!right) {
        if (current == yagaFrames[2]) {
          current = yagaFrames[5];
        } else {
          current = yagaFrames[2];
        }
      }
    }
    frameCounter++;
    image(current, x, y, 100, 100);
  }

  // Move Baba to the left
  void moveLeft() {
    right = false;
    int offset = -1;
    String name = "Yaga_Character";
    if (playerMap.get(name).x > 0)
    {
      if (tileNums.get(playerMap.get(name).tileNum + offset) == null)
      {
        if (waterTileNums.hasValue(playerMap.get(name).tileNum + offset))
        {
          if (playerMap.get(name).attributes.get("canSwim") == "y")
          {
            playerMap.get(name).x -= playerMap.get(name).speed;
            current = yagaFrames[3];
            if (name == "Baba_Character")
            {
              baba.current = babaFrames[4];
            }
          }
        }
        else
        {
          playerMap.get(name).x -= playerMap.get(name).speed;
          current = yagaFrames[3];
          if (name == "Baba_Character")
          {
            baba.current = babaFrames[4];
          }
        }
      }
      else if (playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)) != null)
      {
        if (playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).attributes.get("canBeMoved") == "y" && playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).x > 0)
        {
          playerMap.get(name).x -= playerMap.get(name).speed;
          current = yagaFrames[3];
          playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).x -= speed;
          playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).updateTileNum(tileNums.get(playerMap.get(name).tileNum + offset));
        }
      }
      else if (ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)) != null)
      {
        if (ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).attributes.get("canBeMoved") == "y" && ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).x > 0)
        {
          playerMap.get(name).x -= playerMap.get(name).speed;
          current = yagaFrames[3];
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
    String name = "Yaga_Character";
    if (playerMap.get(name).x < 900)
    {
      if (tileNums.get(playerMap.get(name).tileNum + offset) == null)
      {
        if (waterTileNums.hasValue(playerMap.get(name).tileNum + offset))
        {
          if (playerMap.get(name).attributes.get("canSwim") == "y")
          {
            playerMap.get(name).x += playerMap.get(name).speed;
            current = yagaFrames[1];
            if (name == "Baba_Character")
            {
              baba.current = babaFrames[2];
            }
          }
        }
        else
        {
          playerMap.get(name).x += playerMap.get(name).speed;
          current = yagaFrames[1];
          if (name == "Baba_Character")
          {
            baba.current = babaFrames[2];
          }
        }
      }
      else if (playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)) != null)
      {
        if (playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).attributes.get("canBeMoved") == "y" && playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).x < 900)
        {
          playerMap.get(name).x += playerMap.get(name).speed;
          current = yagaFrames[1];
          playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).x += speed;
          playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).updateTileNum(tileNums.get(playerMap.get(name).tileNum + offset));
        }
      }
      else if (ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)) != null)
      {
        if (ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).attributes.get("canBeMoved") == "y" && ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).x < 900)
        {
          playerMap.get(name).x += playerMap.get(name).speed;
          current = yagaFrames[1];
          ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).x += speed;
          ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).updateTileNum();
        }
      }
    }
    playerMap.get(name).updateTileNum(name);
  }
}
