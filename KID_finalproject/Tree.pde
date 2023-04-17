class Tree extends Player
{
  Tree(int x, int y, String name)
  {
    super(x, y, name);
  }
  
  void display()
  {
    fill(#5F3232);
    square(x, y, 50);
  }
}
