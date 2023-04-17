class Player
{
  int x, y; // Position x, y of the object
  int speed = 50;
  boolean right = true; // To keep track of whether facing left/right
  String name;
  int tileNum;
  
  boolean canBeOnTop = false;
  
  Player(int x, int y, String name)
  {
    if (name != "Baba" && name != "Yaga")
    {
      this.x = x + 25;
      this.y = y + 25;
      tileNum = (this.x - 25)/50 + 19*(this.y - 25)/50;
    }
    else
    {
      this.x = x;
      this.y = y;
      tileNum = this.x/50 + 19*(this.y/50);
    }
    this.name = name;
  }
  
  Player(String name)
  {
    this.name = name;
  }
  
  void controlWho()
  {
    // Checks to what "Is" is assigned to
  }
  
  void updateTileNum()
  {
    int tempTileNum = playerMap.get(name).tileNum;
    if (name != "Baba" && name != "Yaga")
    {
      playerMap.get(name).tileNum = (playerMap.get(name).x - 25)/50 + 19*((playerMap.get(name).y - 25)/50);
    }
    else
    {
      playerMap.get(name).tileNum = playerMap.get(name).x/50 + 19*(playerMap.get(name).y/50);
    }
    
    tileNums.remove(tempTileNum);
    tileNums.put(playerMap.get(name).tileNum, name);
  }

  void moveLeft() {
    this.right = false;
    switch(name)
    {
      case "Baba":
      {
        baba.moveLeft();
        break;
      }
      case "Yaga":
      {
        yaga.moveLeft();
        break;
      }
      default:
      {
        if ((canBeOnTop || tileNums.get(playerMap.get(name).tileNum - 1) == null) && playerMap.get(name).x > 0)
        {
          playerMap.get(name).x -= speed;
        }
      }
    }
    updateTileNum();
  }

  void moveRight() {
    this.right = true;
    switch(name)
    {
      case "Baba":
      {
        baba.moveRight();
        break;
      }
      case "Yaga":
      {
        yaga.moveRight();
        break;
      }
      default:
      {
        if ((canBeOnTop || tileNums.get(playerMap.get(name).tileNum + 1) == null) && playerMap.get(name).x < 900)
        {
          playerMap.get(name).x += speed;
        }
      }
    }
    updateTileNum();
  }

  // Move the object up
  void moveUp() {
    if ((canBeOnTop || tileNums.get(playerMap.get(name).tileNum - 19) == null) && playerMap.get(name).y > 0) {
      playerMap.get(name).y -= speed;
      updateTileNum();
    }
  }

  // Move object down
  void moveDown() {
    if ((canBeOnTop || tileNums.get(playerMap.get(name).tileNum + 19) == null) && playerMap.get(name).y < 700) {
      playerMap.get(name).y += speed;
      updateTileNum();
    }
  }
  
  void display()
  {
  }
}
