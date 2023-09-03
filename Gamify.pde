//Global Variables are initialised first
int screen = 2; //Default screen

//Initialse classes
SkillTree SkillTree = new SkillTree();
Quests Quests = new Quests();
Rewards Rewards = new Rewards();
Profile Profile = new Profile();
Button Button = new Button();
int startSwipe;
int endSwipe;
int edge;
int titleText;
int mainText;

void setup()
{
  size(275, 544); //for developing
  //fullScreen(); //for Android
  textAlign(CENTER);
  mainText = height/25; //Scales Font decently, using width might be better for future?
  textSize(mainText);
  titleText = width/6;
  edge = width/20;
  //setup for quest specific things
  Quests.setup();
}

void draw()
{
  //shows screen based on screen variable
  if (screen==0) SkillTree.show();
  else if (screen==1) Rewards.show();
  else if (screen==2) Quests.show();
  else if (screen==3) Profile.show();
}

void mousePressed()
{
  //currently mouse/finger press is only for selecting the screen and toggling the keyboard
  //blocking moving when typing is required as screen was swapping when hitting lower keys
  if (!Quests.typing)
  {
    //bottom of screen
    if (mouseY>height*0.9)
    {
      if (mouseX<width*0.25) screen = 0;
      else if (mouseX>width*0.25 && mouseX<width*0.5) screen = 1;
      else if (mouseX>width*0.5 && mouseX<width*0.75) screen = 2;
      else if (mouseX>width*0.75 && mouseX<width) screen = 3;
    }
  }

  startSwipe = mouseX;
  //println(startSwipe);

  if (screen==2)
  {
    Quests.toggleKeyboard();
    Quests.mousePressed();
  }
}

void mouseReleased()
{
  endSwipe = mouseX;
  //println(endSwipe);
  swipe();
}

//Starting to implement basic keyboard functionality, the method keyTyped may be more effective for PC but not sure about phone?
//currently typing is needed to add quests
void keyPressed()
{
  if (screen==2) Quests.typing();
}

void swipe()
{
  if (startSwipe<edge && endSwipe>width-edge) screen--;
  else if (startSwipe>width-edge && endSwipe<edge) screen++;
}

void title(String s)
{
  textSize(titleText);
  text(s, width/2, height*0.15);
  textSize(mainText);
}
