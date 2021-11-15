//Modulo CreationScreen
//elaborado por: Pedro Angel Gomez Dimas
//fecha de creación: 17 de septiembre de 2021
//fecha de ultima modificación: 6 de noviembre de 2021
//comentario:

class CreationScreen{
  Button btnatkp;
  Button btndefp;
  Button btnhpmp;
  Button btnatkm;
  Button btndefm;
  Button btnhpmm;
  Button btnexit;
  Button btnplay;
  PImage imgcreat;
  int ppa;
  int minatr;
  int maxatr;
  boolean rst;
  int atk;
  int def;
  int hpm;
    
  CreationScreen(ConfigFile cf){
    btnatkp=new Button(630,250,50,50,17);
    btnatkm=new Button(200,250,50,50,18);
    btndefp=new Button(630,310,50,50,17);
    btndefm=new Button(200,310,50,50,18);
    btnhpmp=new Button(630,370,50,50,17);
    btnhpmm=new Button(200,370,50,50,18);
    btnexit=new Button(200,600,200,100,5);
    btnplay=new Button(600,600,200,100,2);
    btnatkp.activate();
    btnatkm.activate();
    btndefp.activate();
    btndefm.activate();
    btnhpmp.activate();
    btnhpmm.activate();
    btnexit.activate();
    imgcreat=loadImage("sprite/backgr/creation.jpg");
    ppa=cf.ppa;
    atk=def=hpm=minatr=cf.minatr;
    maxatr=cf.maxatr;
    rst=false;
  }
  
  void display(){
    music();
    if(rst){
      resetAttr();
      rst=false;
    }
    background(imgcreat);
    fill(255);
    btnatkp.display();
    btnatkm.display();
    btndefp.display();
    btndefm.display();
    btnhpmp.display();
    btnhpmm.display();
    btnexit.display();
    btnplay.display();
    textAlign(CENTER,CENTER);
    text(lf.showString(9),400,100);
    text(lf.showString(22)+ppa,400,500);
    textAlign(LEFT,CENTER);
    text(lf.showString(19),50,250);
    text(lf.showString(20),50,310);
    text(lf.showString(21),50,370);
    imageMode(CENTER);
    for(int i=0;i<atk;i++)
      image(imgatk,260+50*i,250);
    for(int i=0;i<def;i++)
      image(imgdef,260+50*i,310);
    for(int i=0;i<hpm;i++)
      image(imghpm,260+50*i,370);
  }
  
  void mouseProcess(int x,int y, int b){
    if(btnatkp.isClicked(x,y) && b==LEFT)
      addPoint(ATATK);
    if(btnatkm.isClicked(x,y) && b==LEFT)
      subPoint(ATATK);
    if(btndefp.isClicked(x,y) && b==LEFT)
      addPoint(ATDEF);
    if(btndefm.isClicked(x,y) && b==LEFT)
      subPoint(ATDEF);
    if(btnhpmp.isClicked(x,y) && b==LEFT)
      addPoint(ATHPM);
    if(btnhpmm.isClicked(x,y) && b==LEFT)
      subPoint(ATHPM);
    if(btnexit.isClicked(x,y) && b==LEFT){
      rst=true;
      gc.musicManager(MSCOFF);
      gc.setActiveScreen(START);
    }
    if(btnplay.isClicked(x,y) && b==LEFT){
      pers=new Personaje(atk,def,hpm,cf.cash,4,5);
      rst=true;
      gc.musicManager(MSCOFF);
      gc.setActiveScreen(MAP);
    }
  } 
    
  void addPoint(int a){
    if(ppa>0 && getAttr(a)<maxatr){
      modAttr(a,ATUP);
      ppa--;
    }
    if(ppa==0)
      btnplay.activate();
  }
    
  void subPoint(int a){
    if(getAttr(a)>minatr){
      modAttr(a,ATDN);
      ppa++;
    }
    if(ppa>0)
      btnplay.deactivate();
  }
  
  int getAttr(int a){
    return (a==ATATK)?atk:(a==ATDEF)?def:hpm;
  }
  
  void modAttr(int a, boolean e){
    switch(a){
      case ATATK: atk+=(e)?1:-1;
                  break;
      case ATDEF: def+=(e)?1:-1;
                  break;
      case ATHPM: hpm+=(e)?1:-1;
                  break;
    }
  }
  
  void resetAttr(){
    btnplay.deactivate();
    ppa=cf.ppa;
    atk=def=hpm=minatr;
  }
}
