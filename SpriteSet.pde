//Modulo SpriteSet
//elaborado por: Pedro Angel Gomez Dimas
//fecha de creación: 15 de octubre de 2021
//fecha de ultima modificación: 18 de octubre de 2021
//comentario:
class SpriteSet{
  PImage sprt[];
  String ruta;
  String nomb;
  String frmt;
  int size;
  int frc;
  int frl;
  int spr;
  boolean onan;
  
  SpriteSet(String r, String n,String f,int s,int fl,boolean oa, int sp){
    ruta=r;
    nomb=n;
    frmt=f;
    size=s;
    frl=fl;
    frc=0;
    spr=sp;
    onan=oa;
    sprt=new PImage[size];
    for(int i=0;i<size;i++)
      sprt[i]=loadImage(ruta+nomb+i+frmt);
  }
  
  void controlAnimacion(){
    if(frc==frl){
      if(spr<size-1)
        spr++;
      else
        spr=0;
      frc=0;  
    }
    else
      frc++;
  }
  
  void display(int x,int y,int w,int h){
    image(sprt[spr],x,y,w,h);
    if(onan)
      controlAnimacion(); //Monty Python
  }
  
  void flipDisplay(int x,int y,int w,int h){
    pushMatrix();
    scale(-1,1);
    image(sprt[spr],-x,y,w,h);
    popMatrix();
    if(onan)
      controlAnimacion();
  }
  
  void toggleAnimation(){
    onan=!onan;
  }
}