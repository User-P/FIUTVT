//Modulo Character 
//elaborado por: Pedro Angel Gomez Dimas
//fecha de creación: 11 de octubre de 2021 
//fecha de ultima modificación: 12 de noviembre de 2021 
//comentario:
class Character{
  int atk;  
  int def;  
  int hp;   
  int hpm;  
  int hpp;  
  int weapon;  
  int shield;  
  int dir;  
  int exp; 
  int lvl;  
  int px;   
  int py;   
  
  int cx;  
  int cy;  
  
  int terrain; 
  int cash; 
  CoolDownTimer cdtturn;
  int potn;
  int fptn;
  int tonic;
  
  Character(int a,int d,int h,int c,int x,int y){
    atk=a;
    def=d;
    hpm=h;
    hp=hpp=25*hpm;
    exp=0;
    lvl=1;
    dir=DOWN;
    px=x;
    py=y;
    cx=600;
    cy=350;
    terrain=GRASS;
    cash=c;
    potn=0;
    fptn=0;
    tonic=0;
    cdtturn=new CoolDownTimer(cf.cdtplayr);
  }
  
  void display(){
    if(gmode){
      stroke(color(150,0,0));
      fill(color(150,0,0));
      circle(40+px*80,40+py*80,80);
    }
    else{
      stroke(color(150,150,0));
      fill(color(150,150,0));
      circle(40+px*80,40+py*80,80);
    }
  }
  
  void battleDisplay(){
    if(gmode){
      stroke(color(150,0,0));
      fill(color(150,0,0));
      circle(cx,cy,80);
    }
    else{
      stroke(color(150,150,0));
      fill(color(150,150,0));
      circle(cx,cy,80);
    }
    drawLifeBar(cx-80,cy+45);
    cdtturn.drawTimeBar(cx-80,cy+75);
    if(cdtturn.isActive()){
      cdtturn.coolingDown();
    }  
    if(cdtturn.isOff()){
      
    }  
  }
  
  void move(int d){
    dir=d;
    switch(dir){
      case UP:    py--;
                  break;
      case DOWN:  py++;
                  break;
      case LEFT:  px--;
                  break;
      case RIGHT: px++;
                  break;
    }
  }
  
  void setTerrain(int t){
    terrain=t;  
  }
  
  void drawLifeBar(int x,int y){
    rectMode(CORNER);
    fill(0);
    stroke(0);
    rect(x,y,160,28);
    fill(color(250,0,0));
    stroke(color(250,0,0));
    rect(x+2,y+2,int((hp*1.0/hpp)*156),24);
    rectMode(CENTER);
  }
  
  void drawTradeData(){
    image(imgcash,280,470);
    image(imgpotn,360,470);
    image(imgfptn,440,470);
    image(imgtonic,520,470);
    fill(255);
    text("$"+cash,280,510);
    text(potn,360,510);
    text(fptn,440,510);
    text(tonic,520,510);
    textAlign(CENTER,CENTER);
  }
  
  int getItemInv(int i){
    return (i==ITPTN?potn:(i==ITFPT?fptn:tonic));
  }
  
  void updateInv(int i,boolean tm){
    switch(i){
      case ITPTN: potn+=tm?1:-1; break;
      case ITFPT: fptn+=tm?1:-1; break;
      case ITTNC: tonic+=tm?1:-1; break;
    }
  }
  
  void activateCombat(){
    cdtturn.activate();
  }
}
