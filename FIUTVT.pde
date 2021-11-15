//Proyecto First Illusion UTVT Última versión
//elaborado por: Pedro Angel Gomez Dimas
//fecha de creación: 17 de septiembre de 2021 
//fecha de ultima modificación: 12 de noviembre de 2021 
//comentario:

import processing.sound.*;
import ddf.minim.*;
//Screens
final int LOADING=1;   
final int COMBAT=2;   
final int CONFIG=3;   
final int CREATION=4;  
final int CREDITS=5;  
final int END=6;   
final int START=7; 
final int LVLUP=8; 
final int MAP=9;   
final int PAUSE=10; 
final int STORE=11;

//languages
final int LGSPA=0;
final int LGENG=1;

final int ATTACK=1;
final int DEFENSE=2;
final int HP=3;

final boolean ATTRUP=true;
final boolean ATTRDOWN=false;

final int WATER=0;
final int GROUND=1;
final int FOREST=2;
final int GRASS=3;
final int SHOP=4;

final boolean MSCON=true;
final boolean MSCOFF=false;
final int ITPTN=0;
final int ITFPT=1;
final int ITTNC=2;
final boolean TMBUY=true;
final boolean TMSELL=false;
final boolean BATTLEON=true;
final boolean BATTLEOFF=false;
final boolean ACTON=true;
final boolean ACTOFF=false;
final int ACATK=0;
final int ACDEF=1;
final int ACITM=2;
final boolean TURNP=true;
final boolean TURNE=false;

color palette[];
PImage terreno[];
PImage imgbackgr;
PImage imgatk;
PImage imgdef;
PImage imghp;
PImage imgpotn;
PImage imgfptn;
PImage imgtonic;
PImage imgcash;
boolean gmode;

Minim minim;

AudioPlayer mscintro;
AudioPlayer msccreds;
AudioPlayer mscstore;
AudioPlayer msccreat;
AudioPlayer mscvctry;
AudioPlayer msccombt;
AudioPlayer mscmundo;
SoundFile sfxfight; 
SoundFile sfxclick;
SoundFile sfxcash;

GameControl gc;
PFont fbase;
LangFiles lf;
ConfigFile cf;
Character player;

void setup(){
  size(800,800);
  frameRate(60);
  createPalette();
  createTerrain();
  gmode=true;
  
  fbase=createFont("MesloLGS NF",24);
  textFont(fbase);

  imgatk=loadImage("sprite/icon/icon_atk.png");
  imgdef=loadImage("sprite/icon/icon_def.png");
  imghp=loadImage("sprite/icon/icon_hpm.png");
  imgpotn=loadImage("sprite/items/potion.png");
  imgfptn=loadImage("sprite/items/full potion.png");
  imgtonic=loadImage("sprite/items/tonic.png");
  imgcash=loadImage("sprite/items/cash.png");
  imgbackgr=loadImage("sprite/backgr/backgr.png");
  cf=new ConfigFile();
  lf=new LangFiles(cf.lang,cf.ns);
  gc=new GameControl();
  minim=new Minim(this);
  thread("loadAudio");
}

void draw(){
  gc.display();
}

void mouseReleased(){
  gc.mouseProcess(mouseX,mouseY,mouseButton);
}

void keyReleased(){
  gc.keyProcess(key);
}

void createPalette(){
  palette=new color[5];
  palette[WATER]=color(164,218,247);
  palette[GROUND]=color(150,113, 75);
  palette[FOREST]=color( 88,138, 87);
  palette[GRASS]=color( 91,244,103);
  palette[SHOP]=color(105, 37,231);
}

void createTerrain(){
  terreno=new PImage[5];
  terreno[WATER]=loadImage("sprite/terreno/agua_ok.png");
  terreno[GROUND]=loadImage("sprite/terreno/tierra_ok.png");
  terreno[FOREST]=loadImage("sprite/terreno/bosque_ok.png");
  terreno[GRASS]=loadImage("sprite/terreno/pasto_ok.png");
  terreno[SHOP]=loadImage("sprite/terreno/tienda_ok.png");
}

void loadAudio(){
  gc.loading.message=lf.showString(27);
  sfxfight=new SoundFile(this,"sound/fx/enter battle.mp3");
  sfxclick=new SoundFile(this,"sound/fx/click.mp3");
  sfxcash=new SoundFile(this,"sound/fx/cash.mp3");
  sfxfight.amp(0.45);
  sfxcash.amp(0.45);
  sfxclick.amp(0.25);
  gc.loading.message=lf.showString(28);
  mscintro=minim.loadFile("sound/music/intro.mp3");
  msccreds=minim.loadFile("sound/music/credits.mp3");
  mscstore=minim.loadFile("sound/music/store.mp3");
  msccreat=minim.loadFile("sound/music/creation.mp3");
  mscvctry=minim.loadFile("sound/music/victory.mp3");
  msccombt=minim.loadFile("sound/music/combate.mp3");
  mscmundo=minim.loadFile("sound/music/map.mp3");
  mscintro.setGain(0.05);
  //mscintro.shiftGain(mscintro.getGain(),0.1,100);
  /*msccreds.shiftGain(msccreds.getGain(),0,1);
  mscstore.shiftGain(mscstore.getGain(),0,1);
  msccreat.shiftGain(msccreat.getGain(),0,1);
  mscvctry.shiftGain(mscvctry.getGain(),0,1);
  msccombt.shiftGain(msccombt.getGain(),0,1);
  mscmundo.shiftGain(mscmundo.getGain(),0,1);*/
  gc.loading.message=lf.showString(29);
  gc.loading.loading=false;
}

void music(){
  if(!gc.getMusicStatus())
      gc.musicManager(MSCON);
}
