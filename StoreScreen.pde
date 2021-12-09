//Modulo StoreScreen
//elaborado por: Pedro Angel Gomez Dimas
//fecha de creación: 17 de septiembre de 2021 
//fecha de ultima modificación: 8 de noviembre de 2021 
//comentario:

class StoreScreen{
  Button buy;
  Button sell;
  Button back;

  ClickItem citpotn;
  ClickItem citfptn;
  ClickItem cittonic;
  
  PImage tienda;
  PImage imgtrademode;
  boolean trademode;   //TMBUY=el jugador VENDE, TMSELL=el jugador COMPRA
  
  StoreScreen(){
    buy=new Button(200,600,200,100,24);
    sell=new Button(600,600,200,100,25);
    back=new Button(400,720,200,100,5);
    citpotn=new ClickItem(300,270,50,50,ITPTN);
    citfptn=new ClickItem(400,270,50,50,ITFPT);
    cittonic=new ClickItem(500,270,50,50,ITTNC);
    tienda=loadImage("sprite/backgr/store_ok.png");
    imgtrademode=loadImage("sprite/items/trademode.png");
    trademode=TMBUY;
    buy.toggleMark();
  }
  
  void display(){
    music();
    background(tienda);
    fill(255);
    text(lf.showString(16),400,100);

    citpotn.display();
    citfptn.display();
    cittonic.display();

    buy.display();
    sell.display();
    back.display();
    
    player.drawTradeData();
    if(trademode)
      flipYImage(imgtrademode,400,400);
    else
      image(imgtrademode,400,400);
    text("$"+(trademode?cf.potionsale:cf.potionpurchase),300,300);
    text("$"+(trademode?cf.fullpotionsale:cf.fullpotionpurchase),400,300);
    text("$"+(trademode?cf.tonicsale:cf.tonicpurchase),500,300);
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
    if(buy.isClicked(x,y) && b==LEFT){
      buy.toggleMark();
      sell.toggleMark();
      trademode=TMBUY;
    }  
    if(sell.isClicked(x,y) && b==LEFT){
      buy.toggleMark();
      sell.toggleMark();
      trademode=TMSELL;
    }  
    if(back.isClicked(x,y) && b==LEFT){
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
    return ((i==ITPTN?cf.potionsale:(i==ITFPT)?cf.fullpotionsale:cf.tonicsale));
  }
  
  int getItemCCost(int i){
    return ((i==ITPTN?cf.potionpurchase:(i==ITFPT)?cf.fullpotionpurchase:cf.tonicpurchase));
  }
  
}
