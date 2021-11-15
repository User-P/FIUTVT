//Modulo Enemigo 
//elaborado por: Pedro Angel Gomez Dimas
//fecha de creación: 8 de noviembre de 2021 
//fecha de ultima modificación: 12 de noviembre de 2021 
//comentario:
class Enemigo{
  int atk;  //puntos de ataque
  int def;  //puntos de defensa
  int hp;   //puntos de vida actuales
  int hpp;  //puntos de vida máximo (puntos)
  int exp;  //experiencia que otorga
  int lvl;  //nivel del enemigo
  int cx;   //posición x en combate
  int cy;   //posicion y en combate
  int terr; //terreno que pisa
  int cash; //cuanto dinero da al ser vencido
  CoolDownTimer cdtturn; //turno del enemigo
  
  Enemigo(int t){
    cx=200;
    cy=350;
    terr=t;
    cdtturn=new CoolDownTimer(cf.cdtenemy);
  }
  
  void display(){
    switch(terr){
      case FOREST: fill(color(0,120,0));stroke(color(0,120,0));break;
      case GRASS: fill(color(0,200,0));stroke(color(0,200,0));break;
      case GROUND: fill(color(170,0,0));stroke(color(170,0,0));break;
    }
    cdtturn.drawTimeBar(cx-80,cy+45);
    rect(cx,cy,40,80);  
    if(cdtturn.isActive()){
      cdtturn.coolingDown();
    }  
    if(cdtturn.isOff()){
      
    }  
  }
  
  void activateCombat(){
    cdtturn.activate();
  }
}
