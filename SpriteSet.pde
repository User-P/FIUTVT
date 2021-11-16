//Modulo SpriteSet
//elaborado por: Pedro Angel Gomez Dimas
//fecha de creación: 15 de octubre de 2021
//fecha de ultima modificación: 18 de octubre de 2021
//comentario:
class SpriteSet{
  PImage sprite[];
  String route;
  String name;
  String format;
  int size;
  int framecount;
  int framelimit;
  int currentsprite;
  boolean animation;
  
  SpriteSet(String r, String n,String f,int s,int fl,boolean oa, int sp){
    route=r;
    name=n;
    format=f;
    size=s;
    framelimit=fl;
    framecount=0;
    currentsprite=sp;
    animation=oa;
    sprite=new PImage[size];
    for(int i=0;i<size;i++)
      sprite[i]=loadImage(route+name+i+format);
  }
  
  void controlAnimacion(){
    if(framecount==framelimit){
      if(currentsprite<size-1)
        currentsprite++;
      else
        currentsprite=0;
      framecount=0;  
    }
    else
      framecount++;
  }
  
  void display(int x,int y,int w,int h){
    image(sprite[currentsprite],x,y,w,h);
    if(animation)
      controlAnimacion();
  }
  
  void flipDisplay(int x,int y,int w,int h){
    pushMatrix();
    scale(-1,1);
    image(sprite[currentsprite],-x,y,w,h);
    popMatrix();
    if(animation)
      controlAnimacion();
  }
  
  void toggleAnimation(){
    animation=!animation;
  }
}
