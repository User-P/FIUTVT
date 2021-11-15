//Modulo LoadingScreen
//elaborado por: Pedro Angel Gomez Dimas
//fecha de creación: 17 de septiembre de 2021
//fecha de ultima modificación: 12 de noviembre de 2021
//comentario:

class LoadingScreen{
  boolean loading;
  CoolDownTimer cdt;
  SpriteSet diamond;
  String message;
  
  LoadingScreen(){
    loading=true;
    cdt=new CoolDownTimer(120);
    diamond=new SpriteSet("sprite/diamond/","diamond",".png",6,10,true,0);
    message=lf.showString(26);
  }
  
  void display(){
    background(200);
    fill(255);
    imageMode(CENTER);
    diamond.display(400,350,50,50);
    textAlign(CENTER,CENTER);
    text(lf.showString(6),400,400);
    text(message,400,500);
    if(!loading && !cdt.isActive())
      cdt.activate();
    if(cdt.isActive())
      cdt.coolingDown();
    if(cdt.isOff())
      gc.setActiveScreen(START);
  }
}
