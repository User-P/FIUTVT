//Modulo CreationScreen
//elaborado por: Pedro Angel Gomez Dimas
//fecha de creación: 17 de septiembre de 2021
//fecha de ultima modificación: 6 de noviembre de 2021
//comentario:

class CreationScreen{
  Button increaseatk;
  Button increasedef;
  Button increasehp;
  Button decreaseatk;
  Button decreasedef;
  Button decreasehp;
  Button exit;
  Button play;

  PImage imgcreat;
  boolean reset;
  int minimumpoints;
  int maximunpoints;  
  int pointsnotassigned;
  int atk;
  int def;
  int hp;
    
  CreationScreen(ConfigFile cf){
    increaseatk=new Button(630,250,50,50,17);
    decreaseatk=new Button(200,250,50,50,18);
    increasedef=new Button(630,310,50,50,17);
    decreasedef=new Button(200,310,50,50,18);
    increasehp=new Button(630,370,50,50,17);
    decreasehp=new Button(200,370,50,50,18);
    exit=new Button(200,600,200,100,5);
    play=new Button(600,600,200,100,2);
    play.deactivate();
    imgcreat=loadImage("sprite/backgr/creation.jpg");
    pointsnotassigned=cf.pointsnotassigned;
    atk=def=hp=minimumpoints=cf.minimumpoints;
    maximunpoints=cf.maximunpoints;
    reset=false;
  }
  
  void display(){
    music();
    if(reset)
      resetAttr();
    background(imgcreat);
    fill(255);
    increaseatk.display();
    decreaseatk.display();
    increasedef.display();
    decreasedef.display();
    increasehp.display();
    decreasehp.display();
    exit.display();
    play.display();

    textAlign(CENTER,CENTER);
    text(lf.showString(9),400,100);
    text(lf.showString(22)+pointsnotassigned,400,500);
    textAlign(LEFT,CENTER);
    text(lf.showString(19),50,250);
    text(lf.showString(20),50,310);
    text(lf.showString(21),50,370);
    imageMode(CENTER);

    for(int i=0;i<atk;i++)
      image(imgatk,260+50*i,250);
    for(int i=0;i<def;i++)
      image(imgdef,260+50*i,310);
    for(int i=0;i<hp;i++)
      image(imghp,260+50*i,370);
  }
  
  void mouseProcess(int x,int y, int b){
    if(increaseatk.isClicked(x,y) && b==LEFT)
      addPoint(ATTACK);
    if(decreaseatk.isClicked(x,y) && b==LEFT)
      subPoint(ATTACK);
    if(increasedef.isClicked(x,y) && b==LEFT)
      addPoint(DEFENSE);
    if(decreasedef.isClicked(x,y) && b==LEFT)
      subPoint(DEFENSE);
    if(increasehp.isClicked(x,y) && b==LEFT)
      addPoint(HP);
    if(decreasehp.isClicked(x,y) && b==LEFT)
      subPoint(HP);
    if(exit.isClicked(x,y) && b==LEFT){
      reset=true;
      gc.musicManager(MSCOFF);
      gc.setActiveScreen(START);
    }
    if(play.isClicked(x,y) && b==LEFT){
      player=new Character(atk,def,hp,cf.cash,4,5);
      reset=true;
      gc.musicManager(MSCOFF);
      gc.setActiveScreen(MAP);
    }
  } 
    
  void addPoint(int a){
    if(pointsnotassigned>0 && getAttr(a)<maximunpoints){
      modAttr(a,ATTRUP);
      pointsnotassigned--;
    }
    if(pointsnotassigned==0)
      play.activate();
  }
    
  void subPoint(int a){
    if(getAttr(a)>minimumpoints){
      modAttr(a,ATTRDOWN);
      pointsnotassigned++;
    }
    if(pointsnotassigned>0)
      play.deactivate();
  }
  
  int getAttr(int a){
    return (a==ATTACK)?atk:(a==DEFENSE)?def:hp;
  }
  
  void modAttr(int a, boolean e){
    switch(a){
      case ATTACK: atk+=(e)?1:-1;
                  break;
      case DEFENSE: def+=(e)?1:-1;
                  break;
      case HP: hp+=(e)?1:-1;
                  break;
    }
  }
  
  void resetAttr(){
    play.deactivate();
    pointsnotassigned=cf.pointsnotassigned;
    atk=def=hp=minimumpoints;
    reset=false;
  }
}
