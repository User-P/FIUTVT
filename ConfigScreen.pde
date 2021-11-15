//Modulo ConfigScreen
//elaborado por: Pedro Angel Gomez Dimas
//fecha de creación: 17 de septiembre de 2021
//fecha de ultima modificación: 29 de octubre de 2021
//comentario:

class ConfigScreen{
  Button btnidio;
  Button btnacep;
  Button btnback;
  
  ConfigScreen(){
    btnidio=new Button(550,250,200,100,3);
    btnacep=new Button(250,500,200,100,4);
    btnback=new Button(550,500,200,100,5);
    btnidio.activate();
    btnacep.activate();
    btnback.activate();
  }
  
  void display(){
    background(imgbackgr);
    fill(255);
    text(lf.showString(8),400,100);
    btnidio.display();
    btnacep.display();
    btnback.display();
  }
  
  void mouseProcess(int x, int y, int b){
    if(btnidio.isClicked(x,y) && b==LEFT)  
      lf.toggleLang();
    if(btnacep.isClicked(x,y) && b==LEFT)  
      cf.saveConfig(lf);
    if(btnback.isClicked(x,y) && b==LEFT)  
      gc.setPantAct(START);
  }
}
