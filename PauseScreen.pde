//Modulo PauseScreen
//elaborado por: Pedro Angel Gomez Dimas
//fecha de creación: 17 de septiembre de 2021
//fecha de ultima modificación: 1 de noviembre de 2021
//comentario:

class PauseScreen{
  Button btnexit;
  Button btncont;
  
  PauseScreen(){
    btnexit=new Button(200,600,200,100,23);
    btncont=new Button(600,600,200,100,5);
    btnexit.activate();
    btncont.activate();
  }
  
  void display(){
    fill(255);
    text(lf.showString(15),400,100);
    btnexit.display();
    btncont.display();
  }
  
  void mouseProcess(int x,int y,int b){
    if(btnexit.isClicked(x,y) && b==LEFT){
      gc.musicManager(MSCOFF);
      gc.setPantAct(START);
    }  
    if(btncont.isClicked(x,y) && b==LEFT){
      gc.map.toggleBlur();
      gc.setPantAct(MAP); 
    }  
  }
}
