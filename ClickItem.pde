//Modulo ClickItem 
//elaborado por: Pedro Angel Gomez Dimas
//fecha de creación: 4 de noviembre de 2021
//fecha de ultima modificación: 5 de noviembre de 2021
//comentario:

class ClickItem{
  int cx;
  int cy;
  int an;
  int al;
  int t;
  
  ClickItem(int x,int y,int b, int a, int s){
    cx=x;
    cy=y;
    an=b;
    al=a;
    t=s;
  }
  
  void display(){
    textAlign(CENTER,CENTER);
    image(getItemImage(t),cx,cy);
  }
  
  boolean isClicked(int x,int y){
    boolean r=(((x>=cx-(an/2))&&(x<=cx+(an/2))) && ((y>=cy-(al/2))&&(y<=cy+(al/2))));
    if(r)
      sfxclick.play();
    return r;    
  }  
  
  PImage getItemImage(int i){
    PImage p=null;
    switch(i){
      case ITPTN: p=imgpotn;break;
      case ITFPT: p=imgfptn;break;
      case ITTNC: p=imgtonic;
    }
    return p;
  }
}
