class Tree extends Player
{
  Tree(int x, int y, StringList names)
  {
    super(x, y, names);
  }
  
  void display()
  {
    fill(#5F3232);
    square(x, y, 50);
  }
}
