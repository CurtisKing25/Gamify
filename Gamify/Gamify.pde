void setup()
{
  size(275,544); //for developing
  //fullScreen(); //for Android
  textAlign(CENTER);
  textSize(height/25);
  for(int i=0;i<quests.length;i++) quests[i] = "";
}

int screen = 2;
String typed = "";
String [] quests = new String[10];
String[] empty = {};
String[] savedQuests = new String[10];
String[] previousNumber = new String[10];

int questNumber = 0;
boolean typing = false;

void draw()
{
  if (screen==0) skillTree();
  else if (screen==1) rewards();
  else if (screen==2) quests();
  else if (screen==3) level();
}

void mousePressed()
{
  if(mouseY<height*0.9 && mouseY>height*0.6)
  {
    //openKeyboard(); //for android
    typing = true;
  }
  else if(mouseY<height*0.6)
  {
    //closeKeyboard(); //for android
    typing = false;
  }
  if(!typing)
  {
    if(mouseY>height*0.9 && mouseX<width*0.25) screen = 0;
    else if(mouseY>height*0.9 && mouseX>width*0.25 && mouseX<width*0.5) screen = 1;
    else if(mouseY>height*0.9 && mouseX>width*0.5 && mouseX<width*0.75) screen = 2;
    else if(mouseY>height*0.9 && mouseX>width*0.75 && mouseX<width) screen = 3;
  }
}

void quests()
{
  background(255);
  line(width*0.25,height*0.9,width*0.25,height);
  line(width*0.5,height*0.9,width*0.5,height);
  line(width*0.75,height*0.9,width*0.75,height);
  line(0,height*0.9,width,height*0.9);
  rect(width*0.5,height*0.9,width*0.25,height);
  fill(0);
  text("Quests",width/2,height*0.2);
  text(typed,width/2,height*0.3);
  try 
  {
    savedQuests = loadStrings("quests.txt");
  } 
  catch (Exception e) 
  {
    saveStrings("quests.txt", empty);
    savedQuests = loadStrings("quests.txt");
  }
  try 
  {
   previousNumber = loadStrings("questNumber.txt");
  } 
  catch (Exception e) 
  {
    saveStrings("questNumber.txt", empty);
    previousNumber = loadStrings("questNumber.txt");
  }
  //println(savedQuests.length);
  //println(savedQuests[0]);
  if(savedQuests.length>0)
  {
    for(int i=0;i<quests.length&& i<savedQuests.length;i++)
    {
      if(savedQuests[i]!="null")quests[i] = savedQuests[i];
      else quests[i] = "";
    }
    if(Integer.parseInt(previousNumber[0])>0)questNumber = Integer.parseInt(previousNumber[0]);
  }
  for(int i=0;i<quests.length;i++)
  {
  text(quests[i],width/2,height/2+(i*(height*0.04)));
  }
}

void skillTree()
{
  background(255);
  line(width*0.25,height*0.9,width*0.25,height);
  line(width*0.5,height*0.9,width*0.5,height);
  line(width*0.75,height*0.9,width*0.75,height);
  line(0,height*0.9,width,height*0.9);
  rect(0,height*0.9,width*0.25,height);
  fill(0);
  text("SkillTree",width/2,height*0.2);
}

void rewards()
{
  background(255);
  line(width*0.25,height*0.9,width*0.25,height);
  line(width*0.5,height*0.9,width*0.5,height);
  line(width*0.75,height*0.9,width*0.75,height);
  line(0,height*0.9,width,height*0.9);
  rect(width*0.25,height*0.9,width*0.25,height);
  fill(0);
  text("Rewards",width/2,height*0.2);
}


void level()
{
  background(255);
  line(width*0.25,height*0.9,width*0.25,height);
  line(width*0.5,height*0.9,width*0.5,height);
  line(width*0.75,height*0.9,width*0.75,height);
  line(0,height*0.9,width,height*0.9);
  rect(width*0.75,height*0.9,width*0.25,height);
  fill(0);
  text("Level",width/2,height*0.2);
}

void keyPressed()
{
  if(screen==2)
  {
    if(keyCode==BACKSPACE)
    {
      if(typed.length()>0)typed = typed.substring(0,typed.length()-1);
    }
    
    else if(key == '1')
    {
      typed = "";
      saveStrings("quests.txt",empty);
      saveStrings("questNumber.txt",empty);
      for(int i=0;i<quests.length;i++)quests[i]="";
    }
    
    else if(keyCode==ENTER)
    {
      questNumber++;
      quests[questNumber] = typed;
      typed = "";
      String []questNum = {""+questNumber};
      saveStrings("quests.txt",quests);
      saveStrings("questNumber.txt",questNum);
    }
    
    else if(key != CODED) typed+=key;
  }
}
