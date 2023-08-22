//This class will allow the user to visualise their current skills and add skills. They will be able to track their progress and improve their skills by completing quests
class SkillTree
{
  void show()
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
}
