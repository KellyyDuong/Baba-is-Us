class Player
{
  int x, y, tileNum; // Position x, y of the object
  int speed = 50;
  boolean right = true; // To keep track of whether facing left/right
  StringList names;
  boolean playerIsAssigned = false;

  StringDict attributes;

  Player(int x, int y, StringList names)
  {
    if (!names.hasValue("Baba_Character") && !names.hasValue("Yaga_Character"))
    {
      this.x = x + 25;
      this.y = y + 25;
      tileNum = (this.x - 25)/50 + 19*(this.y - 25)/50;
    } else
    {
      this.x = x;
      this.y = y;
      tileNum = this.x/50 + 19*(this.y/50);
    }
    this.names = names;
    attributes = new StringDict();
    attributes.set("isWin", "n");
    attributes.set("canSwim", "n");
    attributes.set("canBeMoved", "y");
    attributes.set("canBeOnTop", "y");
  }

  Player(StringList names)
  {
    this.names = names;
  }

  void updateTileNum(String name)
  {
    int tempTileNum = playerMap.get(name).tileNum;
    if (name != "Baba_Character" && name != "Yaga_Character")
    {
      playerMap.get(name).tileNum = (playerMap.get(name).x - 25)/50 + 19*((playerMap.get(name).y - 25)/50);
    } else
    {
      playerMap.get(name).tileNum = playerMap.get(name).x/50 + 19*(playerMap.get(name).y/50);
    }

    tileNums.remove(tempTileNum);
    tileNums.put(playerMap.get(name).tileNum, name);
  }

  void moveLeft() {
    this.right = false;
    for (String name : names)
    {
      switch(name)
      {
      case "Baba_Character":
        {
          baba.moveLeft();
          break;
        }
      case "Yaga_Character":
        {
          yaga.moveLeft();
          break;
        }
      default:
        {
          int offset = -1;
          if (playerMap.get(name).x > 0)
          {
            if (tileNums.get(playerMap.get(name).tileNum + offset) == null)
            {
              if (waterTileNums.hasValue(playerMap.get(name).tileNum + offset))
              {
                if (playerMap.get(name).attributes.get("canSwim") == "y")
                {
                  playerMap.get(name).x -= playerMap.get(name).speed;
                }
              } else
              {
                playerMap.get(name).x -= playerMap.get(name).speed;
              }
            } else if (playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)) != null)
            {
              if (playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).attributes.get("canBeMoved") == "y" && playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).x > 0)
              {
                playerMap.get(name).x -= playerMap.get(name).speed;
                playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).x -= speed;
                playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).updateTileNum(tileNums.get(playerMap.get(name).tileNum + offset));
              }
            } else if (ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)) != null)
            {
              if (ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).attributes.get("canBeMoved") == "y" && ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).x > 0)
              {
                playerMap.get(name).x -= playerMap.get(name).speed;
                ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).x -= speed;
                ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).updateTileNum();
              }
            }
          }
        }
        playerMap.get(name).updateTileNum(name);
      }
    }
  }

  void moveRight() {
    this.right = true;
    for (String name : names)
    {
      switch(name)
      {
      case "Baba_Character":
        {
          baba.moveRight();
          break;
        }
      case "Yaga_Character":
        {
          yaga.moveRight();
          break;
        }
      default:
        {
          int offset = 1;
          if (playerMap.get(name).x < 900)
          {
            if (tileNums.get(playerMap.get(name).tileNum + offset) == null)
            {
              if (waterTileNums.hasValue(playerMap.get(name).tileNum + offset))
              {
                if (playerMap.get(name).attributes.get("canSwim") == "y")
                {
                  playerMap.get(name).x += playerMap.get(name).speed;
                }
              } else
              {
                playerMap.get(name).x += playerMap.get(name).speed;
              }
            } else if (playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)) != null)
            {
              if (playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).attributes.get("canBeMoved") == "y" && playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).x < 900)
              {
                playerMap.get(name).x += playerMap.get(name).speed;
                playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).x += speed;
                playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).updateTileNum(tileNums.get(playerMap.get(name).tileNum + offset));
              }
            } else if (ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)) != null)
            {
              if (ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).attributes.get("canBeMoved") == "y" && ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).x < 900)
              {
                playerMap.get(name).x += playerMap.get(name).speed;
                ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).x += speed;
                ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).updateTileNum();
              }
            }
          }
        }
        playerMap.get(name).updateTileNum(name);
      }
    }
  }

  // Move the object up
  void moveUp() {
    int offset = -19;
    for (String name : names)
    {
      if (playerMap.get(name).y > 0)
      {
        if (tileNums.get(playerMap.get(name).tileNum + offset) == null)
        {
          if (waterTileNums.hasValue(playerMap.get(name).tileNum + offset))
          {
            if (playerMap.get(name).attributes.get("canSwim") == "y")
            {
              playerMap.get(name).y -= playerMap.get(name).speed;
            }
          } else
          {
            playerMap.get(name).y -= playerMap.get(name).speed;
          }
        } else if (playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)) != null)
        {
          if (playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).attributes.get("canBeMoved") == "y" && playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).y > 0)
          {
            playerMap.get(name).y -= playerMap.get(name).speed;
            playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).y -= speed;
            playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).updateTileNum(tileNums.get(playerMap.get(name).tileNum + offset));
          }
        } else if (ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)) != null)
        {
          if (ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).attributes.get("canBeMoved") == "y" && ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).y > 0)
          {
            playerMap.get(name).y -= playerMap.get(name).speed;
            ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).y -= speed;
            ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).updateTileNum();
          }
        }
      }
      playerMap.get(name).updateTileNum(name);
    }
  }

  // Move object down
  void moveDown() {
    int offset = 19;
    for (String name : names)
    {
      if (playerMap.get(name).y < 700)
      {
        if (tileNums.get(playerMap.get(name).tileNum + offset) == null)
        {
          if (waterTileNums.hasValue(playerMap.get(name).tileNum + offset))
          {
            if (playerMap.get(name).attributes.get("canSwim") == "y")
            {
              playerMap.get(name).y += playerMap.get(name).speed;
            }
          } else
          {
            playerMap.get(name).y += playerMap.get(name).speed;
          }
        } else if (playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)) != null)
        {
          if (playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).attributes.get("canBeMoved") == "y" && playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).y < 700)
          {
            playerMap.get(name).y += playerMap.get(name).speed;
            playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).y += speed;
            playerMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).updateTileNum(tileNums.get(playerMap.get(name).tileNum + offset));
          }
        } else if (ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)) != null)
        {
          if (ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).attributes.get("canBeMoved") == "y" && ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).y < 700)
          {
            playerMap.get(name).y += playerMap.get(name).speed;
            ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).y += speed;
            ruleMap.get(tileNums.get(playerMap.get(name).tileNum + offset)).updateTileNum();
          }
        }
      }
      playerMap.get(name).updateTileNum(name);
    }
  }

  void display()
  {
  }
}
