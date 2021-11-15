//Modulo CombatScreen
//elaborado por: Pedro Angel Gomez Dimas
//fecha de creación: 17 de septiembre de 2021
//fecha de ultima modificación: 12 de noviembre de 2021
//comentario:

class CombatScreen{
  PImage pasto;
  PImage desrt;
  PImage woods;
  Button btnback;
  Button btnatk;
  Button btndef;
  Button btnitem;
  boolean battleactive;
  boolean actionactive;
  Enemigo enemy;
  CoolDownTimer cdt;
  boolean turn;
  int action;
  
  CombatScreen(){
    pasto=loadImage("sprite/backgr/pasto_ok.png");
    desrt=loadImage("sprite/backgr/desierto_ok.png");
    woods=loadImage("sprite/backgr/bosque_ok.png");
    btnback=new Button(400,700,200,100,23);
    btnatk=new Button(150,550,150,80,30);
    btndef=new Button(400,550,150,80,31);
    btnitem=new Button(650,550,150,80,32);
    btnback.activate();
    battleactive=BATTLEOFF;
    actionactive=ACTOFF;
    cdt=new CoolDownTimer(180);
}
  
  void display(){
    music();
    startBattle();
    selectBackgr(player.terr);
    fill(255);
    text(lf.showString(7),400,100);
    displayPlanoControl();
    displayPlanoBatalla();
    displayPlanoHUD();
    if(cdt.isActive())
      cdt.coolingDown();    
    if(player.cdtturn.isOff()){
      btnatk.activate();
      btndef.activate();
      btnitem.activate();
      if(enemy.cdtturn.isActive())
        enemy.cdtturn.toggleCoolDown();
    }
    if(enemy.cdtturn.isOff()){
      if(player.cdtturn.isActive())
        player.cdtturn.toggleCoolDown();
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
      case FOREST: background(woods);
                  break;
      case GRASS: background(pasto);
                  break;
      case GROUND: background(desrt);
                  break;            
    }
  }
  
  void displayPlanoBatalla(){
    player.battleDisplay();
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
      gc.setActiveScreen(MAP);
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
      player.activateCombat();
      enemy.activateCombat();
    }  
  }
  
  void createEnemies(){
    enemy=new Enemigo(player.terr);  
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
    btnatk.deactivate();
    btndef.deactivate();
    btnitem.deactivate();
    toggleMarks();
    player.cdtturn.activate();
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
    //player.cdtturn.toggleCoolDown();
  }
  
  void enemyEndAction(){
    println("fin acción del enemigo");
    enemy.cdtturn.activate();
    player.cdtturn.toggleCoolDown();
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
