//This class will allow the user to make quests, randomly get given a daily quest, to get rewards, complete quests to earn level xp and skillTree xp
class Quests
{
  String typed = ""; //Word currently being typed
  String [] quests = new String[20]; //Array of quests to go on screen
  String[] empty = {}; //empty array for resetting .txt files
  String[] savedQuests = new String[20]; //Array of saved quests from .txt file
  String[] previousNumber = new String[1]; //Array of saved quest number from .txt file
  float xposX;
  float xposY1;
  float xposY2;
  PrintWriter output; //Used to open the .txt files if they don't exist
  int questNumber = 0; //Used to index quests
  boolean typing = false;
  String [] randomQuests = {"code in Python", "ask for chores", "walk dogs", "go out in rain", "lower back exercises", "take a break", "relax at 10",
    "get out of bed quick", "bed only for sleep", "do core exercises", "rehab exercises", "hybrid routine", "Don't answer back",
    "do requests ASAP", "Do less today", "Breakfast before work", "Take time in morning", "3 meals minimum", "self care", "Do chores",
    "put clothes away", "Go to sleep early", "Go to sleep when you say", "Read", "Code for fun", "Talk with family", "Spend time with family",
    "Clean room", "See friends", "Do jack knives", "Start Game", "Gamify feature", "Github upload", "Play with dogs", "Go outside",
    "Hoover Car", "Meditate", "Get up early", "Healing through words", "Deep Journaling", "8 hours sleep", "TypeRacer"};

  void setup()
  {
    for (int i=0; i<quests.length; i++) quests[i] = ""; //Ensures screen is empty and null won't display
    xposX = width*0.9;
  }

  void show()
  {
    background(255);
    fill(255);
    drawButtons();
    fill(0);
    textSize(width*0.05);
    textAlign(LEFT);
    textAlign(CENTER);
    line(width*0.25, height*0.9, width*0.25, height);
    line(width*0.5, height*0.9, width*0.5, height);
    line(width*0.75, height*0.9, width*0.75, height);
    line(0, height*0.9, width, height*0.9);
    rect(width*0.5, height*0.9, width*0.25, height);
    title("Quests");
    text(typed, width/2, height*0.2);
    //Loads string array from file
    savedQuests = loadStrings("quests.txt");
    //if it doesn't exist
    if (savedQuests==null)
    {
      //Creates the file
      output = createWriter("quests.txt");
      //closes the writer
      output.close();
      //Loads array
      savedQuests = loadStrings("quests.txt");
    }
    //Same again
    previousNumber = loadStrings("questNumber.txt");
    if (previousNumber==null)
    {
      output = createWriter("questNumber.txt");
      //closes the writer if not closed
      output.close();
      previousNumber = loadStrings("questNumber.txt");
    }
    //if there is any text
    if (savedQuests.length>0)
    {
      //while there's text in the file and space to move them
      for (int i=0; i<quests.length&& i<savedQuests.length; i++)
      {
        //if not null, move
        if (savedQuests[i]!="null")quests[i] = savedQuests[i];
        //show empty string
        else quests[i] = "";
      }
      //if you're not on the first index, update index
      if (Integer.parseInt(previousNumber[0])>0)questNumber = Integer.parseInt(previousNumber[0]);
    }
    //prints quests
    //line(0,height/2,width,height/2); Where text should start appearing
    for (int i=0; i<quests.length; i++)
    {
      text(quests[i], width/2, height*0.25+(i*(height*0.04)));
      if (i==0 && quests[i]!="")
      {
        xposY1 = height*0.25+(i*(height*0.04));
        Button.x(width*0.9, xposY1);
      } else if ((i==questNumber &&i!=1) && quests[i]!="")
      {
        xposY2 = height*0.22+(i*(height*0.04));
        Button.x(xposX,xposY2);
      }
    }
    //stand in for keyboard while debugging
    //if(typing)text("ON",width/2,height/2);
    //else if(!typing) text("OFF",width/2,height/2);
  }

  void typing()
  {
    //Slices off last letter
    if (keyCode==BACKSPACE)
    {
      if (typed.length()>0)typed = typed.substring(0, typed.length()-1);
    } else if (key == '2') save("Screenshot.png");

    else if (key == '3') deleteLast();

    else if (key == '4') deleteFirst();

    //Clears current word and saves it to .txt files
    else if (keyCode==ENTER)
    {
      questNumber++;
      quests[questNumber] = typed;
      typed = "";
      String []questNum = {""+questNumber};
      saveStrings("quests.txt", quests);
      saveStrings("questNumber.txt", questNum);
    }

    //Adds to the current word
    else if (key != CODED) typed+=key;
  }

  void toggleKeyboard()
  {
    if (mouseY<height*0.9 && mouseY>height*0.6)
    {
      //openKeyboard(); //for android
      typing = true;
    } else if (mouseY<height*0.6)
    {
      //closeKeyboard(); //for android
      typing = false;
    }
    if (!typing)
    {
      if (mouseY>height*0.9 && mouseX<width*0.25) screen = 0;
      else if (mouseY>height*0.9 && mouseX>width*0.25 && mouseX<width*0.5) screen = 1;
      else if (mouseY>height*0.9 && mouseX>width*0.5 && mouseX<width*0.75) screen = 2;
      else if (mouseY>height*0.9 && mouseX>width*0.75 && mouseX<width) screen = 3;
    }
  }

  void mousePressed()
  {
    if (Button.press(0, 0, width*0.4, height*0.0625))randomQuest();
    if (Button.press(width*0.5, 0, width, height*0.0625))clear();
    if (Button.press(xposX, xposY1, xposX+25, xposY1+25))deleteFirst();
    if (Button.press(xposX, xposY2, xposX+25, xposY2+25))deleteLast();
  }

  void randomQuest()
  {
    questNumber++;
    quests[questNumber] = randomQuests[int(random(randomQuests.length))];
    String []questNum = {""+questNumber};
    saveStrings("quests.txt", quests);
    saveStrings("questNumber.txt", questNum);
  }
  void deleteLast()
  {
    quests[questNumber] = "";
    if (questNumber>0)questNumber--;
    String []questNum = {""+questNumber};
    saveStrings("quests.txt", quests);
    saveStrings("questNumber.txt", questNum);
  }

  void deleteFirst()
  {
    for (int i=2; i<=questNumber; i++)
    {
      quests[i-1] = quests[i];
    }
    quests[questNumber] = "";
    if (questNumber>0)questNumber--;
    String []questNum = {""+questNumber};
    saveStrings("quests.txt", quests);
    saveStrings("questNumber.txt", questNum);
  }

  void drawButtons()
  {
    Button.show(0, 0, width*0.5, height*0.0625, "Random Quest!");
    Button.show(width*0.5, 0, width, height*0.0625, "Clear");
  }

  void clear()
  {
    typed = "";
    saveStrings("quests.txt", empty);
    saveStrings("questNumber.txt", empty);
    questNumber = 0;
    for (int i=0; i<quests.length; i++)quests[i]="";
  }
}
