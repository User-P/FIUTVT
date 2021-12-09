//Modulo GameControl
//elaborado por: Pedro Angel Gomez Dimas
//fecha de creación: 17 de septiembre de 2021
//fecha de ultima modificación: 6 de noviembre de 2021
//comentario:

class GameControl{
  LoadingScreen loading;
  CombatScreen combat;
  ConfigScreen config;
  CreationScreen creation;
  CreditsScreen credits;
  EndGameScreen end;
  StartScreen start;
  LvlUpScreen lvlup;
  MapScreen map;
  PauseScreen pause;
  StoreScreen store;
  int activeScreen;

  boolean music;
  
  GameControl(){
    loading=new LoadingScreen();
    combat=new CombatScreen();
    config=new ConfigScreen();
    creation=new CreationScreen(cf);
    credits=new CreditsScreen();
    end=new EndGameScreen();
    start=new StartScreen();
    lvlup=new LvlUpScreen();
    map=new MapScreen();
    pause=new PauseScreen();
    store=new StoreScreen();
    activeScreen=LOADING;
    music=false;
  }
  
  void display(){
    switch(activeScreen){
      case LOADING: loading.display();
                  break;
      case COMBAT: combat.display();
                  break;
      case CONFIG: config.display();
                  break;
      case CREATION: creation.display();
                  break;
      case CREDITS: credits.display();
                  break;
      case END: end.display();
                  break;
      case START: start.display();
                  break; 
      case LVLUP: lvlup.display();
                  break; 
      case MAP: map.display();
                  break;
      case PAUSE: pause.display();
                  break;
      case STORE: store.display();
                  break;            
    }
  }
  
  void mouseProcess(int x,int y,int b){
    switch(activeScreen){
      case COMBAT: combat.mouseProcess(x,y,b);
                  break;
      case CONFIG: config.mouseProcess(x,y,b);
                  break;            
      case CREDITS: credits.mouseProcess(x,y,b);
                  break;
      case CREATION: creation.mouseProcess(x,y,b);
                  break;
      case START: start.mouseProcess(x,y,b);
                  break;
      case PAUSE: pause.mouseProcess(x,y,b);
                  break;            
      case STORE: store.mouseProcess(x,y,b);
                  break;            
      default:    if(b==LEFT)
                    nextScreen();//avanzo una pantalla
                  if(b==RIGHT)
                    prevScreen();//retrocedo una pantalla
    }  
  }
  
  void keyProcess(char k){
    switch(activeScreen){
      case MAP: map.keyProcess(k);
                  break;
      default:    if(key=='+')
                    gc.nextScreen();
                  if(key=='-')
                    gc.prevScreen();
    }
  }
  
  void nextScreen(){
    activeScreen++;
    if(activeScreen==12)
      activeScreen=1;
  }
  
  void prevScreen(){
    activeScreen--;
    if(activeScreen==0)
      activeScreen=11;
  }
  
  void setActiveScreen(int p){
    activeScreen=p;
  }
  
  void musicManager(boolean s){
    music=s;
    playTrack((music?activeScreen:0));
  }
  
  void playTrack(int t){
    if(t==COMBAT) msccombt.play(); else {msccombt.pause();msccombt.rewind();}
    if(t==CREDITS) msccreds.play(); else {msccreds.pause();msccreds.rewind();}
    if(t==CREATION) msccreat.play(); else {msccreat.pause();msccreat.rewind();}
    if(t==START) mscintro.play(); else {mscintro.pause();mscintro.rewind();}
    if(t==MAP) mscmundo.play(); else {mscmundo.pause();mscmundo.rewind();}
    if(t==STORE) mscstore.play(); else {mscstore.pause();mscstore.rewind();}
  }
  
  boolean getMusicStatus(){
    return music;
  }
}
