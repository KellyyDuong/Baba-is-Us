class Button
{
  float x, y, buttonWidth, buttonHeight, buttonRadius;
  color buttonColor;

  Button(float x, float y, float buttonWidth, float buttonHeight, color buttonColor) // Rectangular button constructor
  {
    this.x = x;
    this.y = y;
    this.buttonWidth = buttonWidth;
    this.buttonHeight = buttonHeight;
    this.buttonColor = buttonColor;
  }

  boolean mouseIsOverButton()
  {
    if (x - buttonWidth/2 <= mouseX && mouseX <= x + buttonWidth/2 && y - buttonHeight/2 <= mouseY && mouseY <= y + buttonHeight/2) // If the cursor is inside the button
    {
      return true;
    } else // Outside the button
    {
      return false;
    }
  }

  void display(String info)
  {
   
    if (mouseIsOverButton()) // Cursor over the button, but not clicked yet
    {
      fill(color(50, 50, 50));
    } else // Cursor not over the button
    {
      fill(buttonColor);
    }
    rectMode(CENTER);
    rect(x, y, buttonWidth, buttonHeight);
    textSize(50);
    fill(255);
    text(info, x, y+12.5); // Display text showing what the button does
  }
}
