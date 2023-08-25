//This class allows for easy creation of buttons
class Button
{
  boolean press(float x1,float y1,float x2,float y2)
  {
    if((mouseX>x1 && mouseX<x2) && (mouseY>y1 && mouseY<y2))return true;
    return false;
  }
}
