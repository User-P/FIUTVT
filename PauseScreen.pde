//Modulo PauseScreen
//elaborado por: Pedro Angel Gomez Dimas
//fecha de creación: 17 de septiembre de 2021
//fecha de ultima modificación: 1 de noviembre de 2021
//comentario:

class PauseScreen{
  Button exit;
  Button back;
  
  PauseScreen(){
    exit=new Button(200,600,200,100,23);
    back=new Button(600,600,200,100,5);
  }
  
  void display(){
    fill(255);
    text(lf.showString(15),400,100);
    exit.display();
    back.display();
  }
  
  void mouseProcess(int x,int y,int b){
    if(exit.isClicked(x,y) && b==LEFT){
      gc.musicManager(MSCOFF);
      gc.setActiveScreen(START);
    }  
    if(back.isClicked(x,y) && b==LEFT){
      gc.setActiveScreen(MAP); 
    }  
  }
}
