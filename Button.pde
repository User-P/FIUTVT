//Modulo Button
//elaborado por: Pedro Angel Gomez Dimas
//fecha de creación: 24 de septiembre de 2021
//fecha de ultima modificación: 12 de noviembre de 2021
//comentario:

class Button{
  int cx;          
  int cy;          
  int width;        
  int high;         
  int text;       
  boolean active;  
  boolean marked;
  
  Button(int x,int y, int b, int a,int s){
    cx=x;
    cy=y;
    width=b;
    high=a;
    text=s;
    active=true;
    marked=false;
  }
  
  void display(){
    if(active){
      rectMode(CENTER);
      fill(color(225,48,35));
      stroke(color(234,239,34));
      rect(cx,cy,width,high);
      fill(255);
      textAlign(CENTER,CENTER);
      text(lf.showString(text),cx,cy);
      if(marked){
        noFill();
        stroke(color(0,250,0));
        strokeWeight(10);
        rect(cx,cy,width,high);
        strokeWeight(1);
      }
    }    
  }
  
  void activate(){
    active=true;
  }
  
  void deactivate(){
    active=false;
  }
  
  boolean isClicked(int x,int y){
    return (active && (((x>=(cx-(width/2)))&&(x<=(cx+(width/2))) && ((y>=(cy-(high/2)))&&(y<=(cy+(high/2)))))));
  }
  
  void toggleMark(){
    marked=!marked;
  }
  
}
