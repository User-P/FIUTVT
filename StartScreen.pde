//Modulo StartScreen
//elaborado por: Pedro Angel Gomez Dimas
//fecha de creación: 17 de septiembre de 2021 
//fecha de ultima modificación: 5 de noviembre de 2021 
//comentario:

class StartScreen{
  Button btncred;
  Button btnconf;
  Button play;
  Button exit;
  
  StartScreen(){
    btncred=new Button(400,250,200,100,0);
    btnconf=new Button(400,400,200,100,1);
    play=new Button(400,550,200,100,2);
    exit=new Button(400,700,200,100,23);
  }
  
  void display(){
    music();
    background(imgbackgr);
    fill(255);
    text(lf.showString(12),400,100);
    btncred.display();
    btnconf.display();
    play.display();
    exit.display();
  }
  
  void mouseProcess(int x,int y,int b){
    if(btncred.isClicked(x,y) && b==LEFT){
      gc.musicManager(MSCOFF);
      gc.setActiveScreen(CREDITS);
    }  
    if(btnconf.isClicked(x,y) && b==LEFT)
      gc.setActiveScreen(CONFIG);  
    if(play.isClicked(x,y) && b==LEFT){
      gc.musicManager(MSCOFF);
      gc.setActiveScreen(CREATION);
    }  
    if(exit.isClicked(x,y) && b==LEFT)
      exit();  
  }
}
