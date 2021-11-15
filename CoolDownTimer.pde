//Modulo CoolDownTimer
//elaborado por: Pedro Angel Gomez Dimas
//fecha de creación: 15 de octubre de 2021
//fecha de ultima modificación: 12 de noviembre de 2021
//comentario:
class CoolDownTimer{
  int count;
  int limitcount;
  float currenttime;
  float cotime;
  boolean active;
  boolean off;
  
  CoolDownTimer(int cl){
    count=0;
    limitcount=cl;
    currenttime=0f;
    cotime=0f;
    active=false;
    off=false;
  }
  
  void activate(){
    active=true;
    currenttime=millis();
    cotime=0f;
    count=0;
  }
  
  void deactivate(){
    active=false;
    currenttime=0f;
    count=0;
  }
  
  boolean isActive(){
    return active;
  }
  
  boolean isOff(){
    return off;
  }
  
  void setTime(int t){
    limitcount=t;
    deactivate();
  }
  
  void coolingDown(){
    if(active){
      if(count<limitcount)
        count++;
      else{
        active=false;
        count=0;
        off=true;
      }  
    }
  }
  
  void coolingDownM(){
    if(active){
      cotime=millis()-currenttime;
      if(cotime>=limitcount){
        active=false;
        currenttime=0f;
        off=true;
      }  
    }
  }
  
  int countLeft(){
    return limitcount-count;
  }
  
  float timeLeft(){
    return (limitcount-count)*1.0/60;
  }
  
  void toggleCoolDown(){
    active=!active;
  }
  
  void drawTimeBar(int x,int y){
    rectMode(CORNER);
    fill(0);
    stroke(0);
    rect(x,y,160,28);
    fill(color(0,220,0));
    stroke(color(0,220,0));
    rect(x+2,y+2,int((count*1.0/limitcount)*156),24);
    rectMode(CENTER);
  }
}
