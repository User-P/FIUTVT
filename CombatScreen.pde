//Modulo CombatScreen
//elaborado por: Pedro Angel Gomez Dimas
//fecha de creación: 17 de septiembre de 2021
//fecha de ultima modificación: 12 de noviembre de 2021
//comentario:

class CombatScreen{
  PImage grass;
  PImage ground;
  PImage forest;

  Button back;
  Button attack;
  Button defense;
  Button btnitem;
  
  boolean battleactive;
  boolean actionactive;
  
  Enemy enemy;
  
  CoolDownTimer cdt;
  boolean turn;
  int action;
  
  CombatScreen(){
    grass=loadImage("sprite/backgr/pasto_ok.png");
    ground=loadImage("sprite/backgr/desierto_ok.png");
    forest=loadImage("sprite/backgr/bosque_ok.png");
    back=new Button(400,700,200,100,23);
    attack=new Button(150,550,150,80,30);
    defense=new Button(400,550,150,80,31);
    btnitem=new Button(650,550,150,80,32);
    battleactive=BATTLEOFF;
    actionactive=ACTOFF;
    cdt=new CoolDownTimer(180);
}
  
  void display(){
    music();
    startBattle();
    selectBackgr(player.terrain);
    fill(255);
    text(lf.showString(7),400,100);
    displayPlanoControl();
    displayPlanoBatalla();
    displayPlanoHUD();
    if(cdt.isActive())
      cdt.coolingDown();    
    if(player.cdtturn.isOff()){
      attack.activate();
      defense.activate();
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
      case FOREST: background(forest);
                  break;
      case GRASS: background(grass);
                  break;
      case GROUND: background(ground);
                  break;            
    }
  }
  
  void displayPlanoBatalla(){
    player.battleDisplay();
    displayEnemies();
  }
  
  void displayPlanoHUD(){}
  
  void displayPlanoControl(){
    back.display();
    attack.display();
    defense.display();
    btnitem.display();
  }
  
  void displayEnemies(){
    enemy.display();
  }
  
  void mouseProcess(int x,int y,int b){
    if(back.isClicked(x,y) && b==LEFT){
      gc.musicManager(MSCOFF);
      battleactive=BATTLEOFF;
      gc.setActiveScreen(MAP);
    }
    if(!actionactive && attack.isClicked(x,y) && b==LEFT){
      println("ataque");
      attack.toggleMark();
      toggleAction();
      combatAction(ACATK);
    }
    if(!actionactive && defense.isClicked(x,y) && b==LEFT){
      println("defensa");
      defense.toggleMark();
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
    enemy=new Enemy(player.terrain);  
  }
  
  void toggleAction(){
    actionactive=!actionactive;
  }
  
  void combatAction(int a){
    action=a;
    switch(action){
      case ACATK: println("acción de ataque");
                  //attack.toggleMark(); 
                  break;
      case ACDEF: println("acción defensiva"); 
                  //defense.toggleMark();
                  break;
      case ACITM: println("acción de item");
                  //btnitem.toggleMark();
    }
    cdt.activate();
  }
  
  void endAction(){
    println("fin de acción");
    attack.deactivate();
    defense.deactivate();
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
      case ACATK: attack.toggleMark(); break;
      case ACDEF: defense.toggleMark(); break;
      case ACITM: btnitem.toggleMark();
    }
  }
}
