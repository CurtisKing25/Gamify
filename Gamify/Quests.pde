//This class will allow the user to make quests, randomly get given a daily quest, to get rewards, complete quests to earn level xp and skillTree xp
class Quests
{
  String typed = ""; //Word currently being typed
  String [] quests = new String[20]; //Array of quests to go on screen
  String[] empty = {}; //empty array for resetting .txt files
  String[] savedQuests = new String[20]; //Array of saved quests from .txt file
  String[] previousNumber = new String[1]; //Array of saved quest number from .txt file
  PrintWriter output; //Used to open the .txt files if they don't exist
  int questNumber = 0; //Used to index quests
  boolean typing = false;

   void setup()
  {
    for(int i=0;i<quests.length;i++) quests[i] = ""; //Ensures screen is empty and null won't display
  }
  
  void show()
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
    //Loads string array from file
      savedQuests = loadStrings("quests.txt");
      //if it doesn't exist
      if(savedQuests==null)
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
     if(previousNumber==null)
     {
      output = createWriter("questNumber.txt");
      //closes the writer if not closed
      output.close();
      previousNumber = loadStrings("questNumber.txt");
     }
     //if there is any text
    if(savedQuests.length>0)
    {
      //while there's text in the file and space to move them
      for(int i=0;i<quests.length&& i<savedQuests.length;i++)
      {
        //if not null, move
        if(savedQuests[i]!="null")quests[i] = savedQuests[i];
        //show empty string
        else quests[i] = "";
      }
      //if you're not on the first index, update index
      if(Integer.parseInt(previousNumber[0])>0)questNumber = Integer.parseInt(previousNumber[0]);
    }
    //prints quests
    for(int i=0;i<quests.length;i++)
    {
    text(quests[i],width/2,height/2+(i*(height*0.04)));
    }
    //stand in for keyboard while debugging
    //if(typing)text("ON",width/2,height/2);
    //else if(!typing) text("OFF",width/2,height/2);
  }
  
  void typing()
  {
    //Slices off last letter
    if(keyCode==BACKSPACE)
    {
      if(typed.length()>0)typed = typed.substring(0,typed.length()-1);
    }
    
    //clears all data
    else if(key == '1')
    {
      typed = "";
      saveStrings("quests.txt",empty);
      saveStrings("questNumber.txt",empty);
      questNumber = 0;
      for(int i=0;i<quests.length;i++)quests[i]="";
    }
    
    else if(key == '2')
    {
      save("Screenshot.png");
    }
    
    //Clears current word and saves it to .txt files
    else if(keyCode==ENTER)
    {
      questNumber++;
      quests[questNumber] = typed;
      typed = "";
      String []questNum = {""+questNumber};
      saveStrings("quests.txt",quests);
      saveStrings("questNumber.txt",questNum);
    }
    
    //Adds to the current word
    else if(key != CODED) typed+=key;
  }
  
  void toggleKeyboard()
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
}
