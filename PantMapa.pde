//Modulo PantMapa 
//elaborado por: Pedro Angel Gomez Dimas
//fecha de creación: 11 de octubre de 2021 
//fecha de ultima modificación: 6 de noviembre de 2021 
//comentario:
class PantMapa{
  int mapa[][]={{0,0,0,0,0,0,0,0,0,0},
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
  
  PantMapa(){
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
    displayPlanoMapa();
    displayPlanoPers();
    displayPlanoSky();
    displayPlanoHUD(); //Heads-Up Display
  }
  
  void displayPlanoMapa(){
    for(int i=0;i<mx;i++)
      for(int j=0;j<my;j++)
        if(gmode)
          image(terreno[mapa[j][i]],40+i*80,40+j*80);
        else{
          stroke(paleta[mapa[j][i]]);
          fill(paleta[mapa[j][i]]);
          rect(40+i*80,40+j*80,80,80);
        }
  }
  
  void displayPlanoPers(){
    pers.display();
  }
  
  void displayPlanoSky(){
    if(gmode){
      tint(255,64);
      image(imgsky,400,400);
      noTint();
      displayClouds();
    }  
  }
  
  void displayPlanoHUD(){
    image(imgcash,50,740);
    image(imgatk,130,740);
    image(imgdef,210,740);
    image(imghpm,290,740);
    image(imgpotn,590,740);
    image(imgfptn,670,740);
    image(imgtonic,750,740);
    fill(255);
    text("$"+pers.cash,50,780);
    text(pers.atk,130,780);
    text(pers.def,210,780);
    text(pers.potn,590,780);
    text(pers.fptn,670,780);
    text(pers.tonic,750,780);
    textAlign(LEFT,CENTER);
    text(pers.hp+"/"+pers.hpp,315,740);
    pers.drawLifeBar(265,768);
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
      case 'W': if(revisaRestringido(pers,UP))
                  move(UP);
                break;
      case 'a':
      case 'A': if(revisaRestringido(pers,LEFT))
                  move(LEFT);
                break;
      case 's':
      case 'S': if(revisaRestringido(pers,DOWN))
                  move(DOWN);
                break;
      case 'd':
      case 'D': if(revisaRestringido(pers,RIGHT))
                  move(RIGHT);
                break;
      case 'q':
      case 'Q': toggleBlur();
                tint(255,128);
                image(imgblur,400,400);
                noTint();
                gc.setPantAct(PNPAU);
                break;
      case ' ': if(mapa[pers.py][pers.px]==CLTND){
                  gc.musicManager(MSCOFF);
                  gc.setPantAct(PNTND);
                }  
    }
  }
  
  boolean revisaRestringido(Personaje p,int d){
    boolean r=false;
    switch(d){
      case UP:    r=mapa[p.py-1][p.px]!=CLAWA;
                  break;
      case DOWN:  r=mapa[p.py+1][p.px]!=CLAWA;
                  break;
      case LEFT:  r=mapa[p.py][p.px-1]!=CLAWA;
                  break;
      case RIGHT: r=mapa[p.py][p.px+1]!=CLAWA;
                  break;         
    }
    return r;
  }
  
  void move(int d){
    pers.move(d);
    pers.setTerrain(mapa[pers.py][pers.px]);
    if(generaCombate()){
      sfxfight.play();
      gc.musicManager(MSCOFF);
      gc.setPantAct(PNCBT);
    }  
  }
  
  boolean generaCombate(){
    boolean r=false;
    switch(pers.terr){
      case CLBSQ: r=random(1,100)<cf.bsqodd;
                  break;
      case CLPST: r=random(1,100)<cf.pstodd;
                  break;
      case CLTRR: r=random(1,100)<cf.trrodd;
                  break;
    }
    return r;
  }
  
  void toggleBlur(){
    blur=!blur;
  }
}
