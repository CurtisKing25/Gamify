//This class will shows name, level, stats, maybe some sort of character customisation eventually or a profile picture feature?
class Profile
{
  void show()
  {
    background(255);
    line(width*0.25,height*0.9,width*0.25,height);
    line(width*0.5,height*0.9,width*0.5,height);
    line(width*0.75,height*0.9,width*0.75,height);
    line(0,height*0.9,width,height*0.9);
    rect(width*0.75,height*0.9,width*0.25,height);
    fill(0);
    title("profile");
  }
}
