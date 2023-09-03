//This class allows for easy creation of buttons
class Button
{
  void show(float x1, float y1, float x2, float y2)
  {
    rect(x1, y1, x2, y2);
  }

  void show(float x1, float y1, float x2, float y2, String T)
  {
    rect(x1, y1, x2, y2);
    fill(0);
    text(T, (x1+x2)*0.5, (y1+y2)*0.6);
    fill(255);
  }
  boolean press(float x1, float y1, float x2, float y2)
  {
    if ((mouseX>x1 && mouseX<x2) && (mouseY>y1 && mouseY<y2))return true;
    return false;
  }

  void x(float w, float h)
  {
    fill(255);
    rect(w, h, 25, 25);
    stroke(255, 0, 0);
    //rectMode(CENTER);
    line(w,h,w+25,h+25);
    line(w,h+25,w+25,h);
      fill(0);
    rectMode(CORNER);
    stroke(0);
  }
}
