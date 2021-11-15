//Modulo PantCombate
//elaborado por: Pedro Angel Gomez Dimas
//fecha de creación: 17 de septiembre de 2021
//fecha de ultima modificación: 12 de noviembre de 2021
//comentario:

class PantCombate{
  PImage pasto;
  PImage desrt;
  PImage woods;
  Boton btnback;
  Boton btnatk;
  Boton btndef;
  Boton btnitem;
  boolean battleactive;
  boolean actionactive;
  Enemigo enemy;
  CoolDownTimer cdt;
  boolean turn;
  int action;
  
  PantCombate(){
    pasto=loadImage("sprite/backgr/pasto_ok.png");
    desrt=loadImage("sprite/backgr/desierto_ok.png");
    woods=loadImage("sprite/backgr/bosque_ok.png");
    btnback=new Boton(400,700,200,100,23);
    btnatk=new Boton(150,550,150,80,30);
    btndef=new Boton(400,550,150,80,31);
    btnitem=new Boton(650,550,150,80,32);
    btnback.activate();
    battleactive=BATTLEOFF;
    actionactive=ACTOFF;
    cdt=new CoolDownTimer(180);
}
  
  void display(){
    music();
    startBattle();
    selectBackgr(pers.terr);
    fill(255);
    text(lf.showString(7),400,100);
    displayPlanoControl();
    displayPlanoBatalla();
    displayPlanoHUD();
    if(cdt.isActive())
      cdt.coolingDown();    
    if(pers.cdtturn.isOff()){
      btnatk.activate();
      btndef.activate();
      btnitem.activate();
      if(enemy.cdtturn.isActive())
        enemy.cdtturn.toggleCoolDown();
    }
    if(enemy.cdtturn.isOff()){
      if(pers.cdtturn.isActive())
        pers.cdtturn.toggleCoolDown();
      enemyAction();
    }
    if(cdt.isActive())
      cdt.coolingDown();
    if (cdt.isOff()){
      if(turn)
        endAction();
      else
        enemyEndAction();
    }
  }
  
  void selectBackgr(int t){
    switch(t){
      case CLBSQ: background(woods);
                  break;
      case CLPST: background(pasto);
                  break;
      case CLTRR: background(desrt);
                  break;            
    }
  }
  
  void displayPlanoBatalla(){
    pers.battleDisplay();
    displayEnemies();
  }
  
  void displayPlanoHUD(){}
  
  void displayPlanoControl(){
    btnback.display();
    btnatk.display();
    btndef.display();
    btnitem.display();
  }
  
  void displayEnemies(){
    enemy.display();
  }
  
  void mouseProcess(int x,int y,int b){
    if(btnback.isClicked(x,y) && b==LEFT){
      gc.musicManager(MSCOFF);
      battleactive=BATTLEOFF;
      gc.setPantAct(PNMAP);
    }
    if(!actionactive && btnatk.isClicked(x,y) && b==LEFT){
      println("ataque");
      btnatk.toggleMark();
      toggleAction();
      combatAction(ACATK);
    }
    if(!actionactive && btndef.isClicked(x,y) && b==LEFT){
      println("defensa");
      btndef.toggleMark();
      toggleAction();
      combatAction(ACDEF);
    }
    if(!actionactive && btnitem.isClicked(x,y) && b==LEFT){
      println("item");
      btnitem.toggleMark();
      toggleAction();
      combatAction(ACITM);
    }
  }
  
  void startBattle(){
    if(!battleactive){
      createEnemies();
      battleactive=BATTLEON;
      turn=TURNP;
      pers.activateCombat();
      enemy.activateCombat();
    }  
  }
  
  void createEnemies(){
    enemy=new Enemigo(pers.terr);  
  }
  
  void toggleAction(){
    actionactive=!actionactive;
  }
  
  void combatAction(int a){
    action=a;
    switch(action){
      case ACATK: println("acción de ataque");
                  //btnatk.toggleMark(); 
                  break;
      case ACDEF: println("acción defensiva"); 
                  //btndef.toggleMark();
                  break;
      case ACITM: println("acción de item");
                  //btnitem.toggleMark();
    }
    cdt.activate();
  }
  
  void endAction(){
    println("fin de acción");
    btnatk.deactive();
    btndef.deactive();
    btnitem.deactive();
    toggleMarks();
    pers.cdtturn.activate();
    toggleAction();
    enemy.cdtturn.toggleCoolDown();
    toggleTurn();
  }
  
  void toggleTurn(){
    turn=!turn;
  }
  
  void enemyAction(){
    println("acción del enemigo");
    cdt.activate();
    //pers.cdtturn.toggleCoolDown();
  }
  
  void enemyEndAction(){
    println("fin acción del enemigo");
    enemy.cdtturn.activate();
    pers.cdtturn.toggleCoolDown();
    toggleTurn();
  }
  
  void toggleMarks(){
    switch(action){
      case ACATK: btnatk.toggleMark(); break;
      case ACDEF: btndef.toggleMark(); break;
      case ACITM: btnitem.toggleMark();
    }
  }
}
