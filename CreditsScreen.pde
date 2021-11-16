//Modulo CreditsScreen
//elaborado por: Pedro Angel Gomez Dimas
//fecha de creación: 17 de septiembre de 2021
//fecha de ultima modificación: 6 de noviembre de 2021
//comentario:

class CreditsScreen{  
  Button back;
  
  CreditsScreen(){
    back=new Button(400,600,200,100,5);
    back.activate();
  }
  
  void display(){
    music();
    background(0);
    fill(255);
    text(lf.showString(10),400,400);
    back.display();
  }
  
  void mouseProcess(int x,int y,int b){
    if(back.isClicked(x,y) && b==LEFT){
      gc.musicManager(MSCOFF);
      gc.setActiveScreen(START);
    }     
  }
}
