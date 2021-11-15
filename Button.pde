//Modulo Button
//elaborado por: Pedro Angel Gomez Dimas
//fecha de creación: 24 de septiembre de 2021
//fecha de ultima modificación: 12 de noviembre de 2021
//comentario:

class Button{
  int cx;          //coordenada x
  int cy;          //coordenada y
  int an;          //ancho del botón
  int al;          //alto del botón
  int t;        //texto que contendrá
  boolean active;  //true=visible false=invisible
  boolean marked;
  
  Button(int x,int y, int b, int a,int s){
    cx=x;
    cy=y;
    an=b;
    al=a;
    t=s;
    active=false;
    marked=false;
  }
  
  void display(){
    if(active){
      rectMode(CENTER);
      fill(color(225,48,35));
      stroke(color(234,239,34));
      rect(cx,cy,an,al);
      fill(255);
      textAlign(CENTER,CENTER);
      text(lf.showString(t),cx,cy);
      if(marked){
        noFill();
        stroke(color(0,250,0));
        strokeWeight(10);
        rect(cx,cy,an,al);
        strokeWeight(1);
      }
    }    
  }
  
  void activate(){
    active=true;
  }
  
  void deactive(){
    active=false;
  }
  
  boolean isClicked(int x,int y){
    return (active && (((x>=(cx-(an/2)))&&(x<=(cx+(an/2))) && ((y>=(cy-(al/2)))&&(y<=(cy+(al/2)))))));
  }
  
  void toggleMark(){
    marked=!marked;
  }
  
}
