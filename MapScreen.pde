//Modulo MapScreen 
//elaborado por: Pedro Angel Gomez Dimas
//fecha de creación: 11 de octubre de 2021 
//fecha de ultima modificación: 6 de noviembre de 2021 
//comentario:
class MapScreen{
  int map[][]={{0,0,0,0,0,0,0,0,0,0},
                {0,1,1,1,1,1,1,1,1,0},
                {0,1,2,2,2,3,3,3,1,0},
                {0,1,2,0,2,3,4,3,1,0},
                {0,1,2,2,2,3,3,3,1,0},
                {0,1,3,3,3,3,3,1,0,0},
                {0,1,3,1,1,1,1,1,0,0},
                {0,1,3,3,3,3,3,3,1,0},
                {0,1,1,1,1,1,1,1,1,0},
                {0,0,0,0,0,0,0,0,0,0}};
  int mx=10; 
  int my=10;
  PImage imgsky;
  PImage imgcloud;
  PImage imgblur;
  int clouds[][];
  boolean blur;
  
  MapScreen(){
    imgsky=loadImage("sprite/sky.jpg");
    imgcloud=loadImage("sprite/cloud.png");
    imgblur=loadImage("sprite/backgr/blur.jpg");
    blur=false;
    clouds=new int[3][3];
    for(int i=0;i<3;i++){
      clouds[i][0]=-160-int(random(1,300));
      clouds[i][1]=int(random(40,700));
      clouds[i][2]=int(random(2,5));
    }
  }
  
  void display(){
    music();
    background(0);
    fill(255);
    textAlign(CENTER,CENTER);
    text(lf.showString(14),400,100);
    rectMode(CENTER);
    imageMode(CENTER);
    displayPlaneMap();
    displayPlaneCharacter();
    displayPlaneSky();
    displayPlaneHUD();
  }
  
  void displayPlaneMap(){
    for(int i=0;i<mx;i++)
      for(int j=0;j<my;j++)
        if(gmode)
          image(terrain[map[j][i]],40+i*80,40+j*80);
        else{
          stroke(palette[map[j][i]]);
          fill(palette[map[j][i]]);
          rect(40+i*80,40+j*80,80,80);
        }
  }
  
  void displayPlaneCharacter(){
    player.display();
  }
  
  void displayPlaneSky(){
    if(gmode){
      tint(255,64);
      image(imgsky,400,400);
      noTint();
      displayClouds();
    }  
  }
  
  void displayPlaneHUD(){
    image(imgcash,50,740);
    image(imgatk,130,740);
    image(imgdef,210,740);
    image(imghp,290,740);
    image(imgpotn,590,740);
    image(imgfptn,670,740);
    image(imgtonic,750,740);
    fill(255);
    text("$"+player.cash,50,780);
    text(player.atk,130,780);
    text(player.def,210,780);
    text(player.potn,590,780);
    text(player.fptn,670,780);
    text(player.tonic,750,780);
    textAlign(LEFT,CENTER);
    text(player.hp+"/"+player.hpp,315,740);
    player.drawLifeBar(265,768);
    textAlign(CENTER,CENTER);
  }
  
  void displayClouds(){
    for(int i=0;i<3;i++){
      image(imgcloud,clouds[i][0],clouds[i][1]);
      clouds[i][0]+=clouds[i][2];
      if(clouds[i][0]>900){
        clouds[i][0]=-160-int(random(1,300));
        clouds[i][1]=int(random(40,700));
        clouds[i][2]=int(random(2,5));
      }
    }
  }
  
  void keyProcess(char k){
    switch(k){
      case 'g':
      case 'G': gmode=!gmode;
                break;
      case 'w':
      case 'W': if(checkTerrain(player,UP))
                  move(UP);
                break;
      case 'a':
      case 'A': if(checkTerrain(player,LEFT))
                  move(LEFT);
                break;
      case 's':
      case 'S': if(checkTerrain(player,DOWN))
                  move(DOWN);
                break;
      case 'd':
      case 'D': if(checkTerrain(player,RIGHT))
                  move(RIGHT);
                break;
      case 'q':
      case 'Q': gc.setActiveScreen(PAUSE);
                break;
      case ' ': if(map[player.py][player.px]==SHOP){
                  gc.musicManager(MSCOFF);
                  gc.setActiveScreen(STORE);
                }  
    }
  }
  
  boolean checkTerrain(Character p,int d){
    boolean r=false;
    switch(d){
      case UP:    r=map[p.py-1][p.px]!=WATER;
                  break;
      case DOWN:  r=map[p.py+1][p.px]!=WATER;
                  break;
      case LEFT:  r=map[p.py][p.px-1]!=WATER;
                  break;
      case RIGHT: r=map[p.py][p.px+1]!=WATER;
                  break;         
    }
    return r;
  }
  
  void move(int d){
    player.move(d);
    player.setTerrain(map[player.py][player.px]);
    if(spawnCombat()){
      sfxfight.play();
      gc.musicManager(MSCOFF);
      gc.setActiveScreen(COMBAT);
    }  
  }
  
  boolean spawnCombat(){
    boolean r=false;
    switch(player.terr){
      case FOREST: r=random(1,100)<cf.inForest;
                  break;
      case GRASS: r=random(1,100)<cf.inGrass;
                  break;
      case GROUND: r=random(1,100)<cf.inGround;
                  break;
    }
    return r;
  }
  
  void toggleBlur(){
    blur=!blur;
  }
}
