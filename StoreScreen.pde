//Modulo StoreScreen
//elaborado por: Pedro Angel Gomez Dimas
//fecha de creación: 17 de septiembre de 2021 
//fecha de ultima modificación: 8 de noviembre de 2021 
//comentario:

class StoreScreen{
  
  Button btncomp;
  Button btnvend;
  Button btncont;
  ClickItem citpotn;
  ClickItem citfptn;
  ClickItem cittonic;
  PImage tienda;
  PImage imgtrademode;
  boolean trademode;   //TMBUY=el jugador VENDE, TMSELL=el jugador COMPRA
  
  StoreScreen(){
    btncomp=new Button(200,600,200,100,24);
    btnvend=new Button(600,600,200,100,25);
    btncont=new Button(400,720,200,100,5);
    btncomp.activate();
    btnvend.activate();
    btncont.activate();
    citpotn=new ClickItem(300,270,50,50,ITPTN);
    citfptn=new ClickItem(400,270,50,50,ITFPT);
    cittonic=new ClickItem(500,270,50,50,ITTNC);
    tienda=loadImage("sprite/backgr/store_ok.png");
    imgtrademode=loadImage("sprite/items/trademode.png");
    trademode=TMBUY;
    btncomp.toggleMark();
  }
  
  void display(){
    music();
    background(tienda);
    fill(255);
    text(lf.showString(16),400,100);
    citpotn.display();
    citfptn.display();
    cittonic.display();
    btncomp.display();
    btnvend.display();
    btncont.display();
    player.drawTradeData();
    if(trademode)
      flipYImage(imgtrademode,400,400);
    else
      image(imgtrademode,400,400);
    text("$"+(trademode?cf.potnv:cf.potnc),300,300);
    text("$"+(trademode?cf.fptnv:cf.fptnc),400,300);
    text("$"+(trademode?cf.tonicv:cf.tonicc),500,300);
  }
  
  void toggleTM(){
    trademode=!trademode;
  }
  
  void flipYImage(PImage i,int x,int y){
    pushMatrix();
    scale(1,-1);
    image(i,x,-y);
    popMatrix();
  }
  
  void mouseProcess(int x,int y, int b){
    if(btncomp.isClicked(x,y) && b==LEFT){
      btncomp.toggleMark();
      btnvend.toggleMark();
      trademode=TMBUY;
    }  
    if(btnvend.isClicked(x,y) && b==LEFT){
      btncomp.toggleMark();
      btnvend.toggleMark();
      trademode=TMSELL;
    }  
    if(btncont.isClicked(x,y) && b==LEFT){
      gc.musicManager(MSCOFF);
      gc.setActiveScreen(MAP);
    } 
    if(citpotn.isClicked(x,y) && b==LEFT){
      trade(ITPTN);
    }  
    if(citfptn.isClicked(x,y) && b==LEFT){
      trade(ITFPT);
    }  
    if(cittonic.isClicked(x,y) && b==LEFT){
      trade(ITTNC);
    }  
  }
  
  void trade(int i){
    if(trademode)
      buyItem(i);
    else
      sellItem(i);
}
  
  void buyItem(int i){
    if(player.cash>=getItemVCost(i)){
      player.cash-=getItemVCost(i);
      player.updateInv(i,trademode);
      sfxcash.play(); 
    }
  }
  
  void sellItem(int i){
    if(player.getItemInv(i)>0){
      player.cash+=getItemCCost(i);
      player.updateInv(i,trademode);
      sfxcash.play();
    }
  }
  
  int getItemVCost(int i){
    return ((i==ITPTN?cf.potnv:(i==ITFPT)?cf.fptnv:cf.tonicv));
  }
  
  int getItemCCost(int i){
    return ((i==ITPTN?cf.potnc:(i==ITFPT)?cf.fptnc:cf.tonicc));
  }
  
}
