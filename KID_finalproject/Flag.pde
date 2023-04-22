class Flag extends Player
{
  Flag(int x, int y, StringList names)
  {
    super(x, y, names);
  }
  
  void display()
  {
    fill(#F01616);
    rect(x, y, 50, 25);
    fill(#D3CDCD);
    rect(x, y + 25, 10, 25);
  }
}
