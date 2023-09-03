//This class will allow users to put a system in place to motivate themselves to work on quests and skills, they will recieve different rariety of rewards that will encourage them
//to relax, see friends or maybe buy something they've been saving towards as a treat and other things that will improve their mental health and wellbeing without feeling like a chore
class Rewards
{
  void show()
  {
    background(255);
    line(width*0.25,height*0.9,width*0.25,height);
    line(width*0.5,height*0.9,width*0.5,height);
    line(width*0.75,height*0.9,width*0.75,height);
    line(0,height*0.9,width,height*0.9);
    rect(width*0.25,height*0.9,width*0.25,height);
    fill(0);
    title("Rewards");
  }
}
