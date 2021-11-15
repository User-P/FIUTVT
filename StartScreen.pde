//Modulo StartScreen
//elaborado por: Pedro Angel Gomez Dimas
//fecha de creación: 17 de septiembre de 2021 
//fecha de ultima modificación: 5 de noviembre de 2021 
//comentario:

class StartScreen{
  Button btncred;
  Button btnconf;
  Button btnplay;
  Button btnexit;
  
  StartScreen(){
    btncred=new Button(400,250,200,100,0);
    btnconf=new Button(400,400,200,100,1);
    btnplay=new Button(400,550,200,100,2);
    btnexit=new Button(400,700,200,100,23);
    btncred.activate();
    btnconf.activate();
    btnplay.activate();
    btnexit.activate();
  }
  
  void display(){
    music();
    background(imgbackgr);
    fill(255);
    text(lf.showString(12),400,100);
    btncred.display();
    btnconf.display();
    btnplay.display();
    btnexit.display();
  }
  
  void mouseProcess(int x,int y,int b){
    if(btncred.isClicked(x,y) && b==LEFT){
      gc.musicManager(MSCOFF);
      gc.setPantAct(CREDITS);
    }  
    if(btnconf.isClicked(x,y) && b==LEFT)
      gc.setPantAct(CONFIG);  
    if(btnplay.isClicked(x,y) && b==LEFT){
      gc.musicManager(MSCOFF);
      gc.setPantAct(CREATION);
    }  
    if(btnexit.isClicked(x,y) && b==LEFT)
      exit();  
  }
}
