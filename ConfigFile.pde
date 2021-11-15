//Modulo ConfigFile 
//elaborado por: Pedro Angel Gomez Dimas
//fecha de creación: 28 de septiembre de 2021 
//fecha de ultima modificación: 12 de noviembre de 2021 
//comentario:

class ConfigFile{
  String file[];
  int lang;
  int ns;
  int pointsnotassigned;
  int minimumpoints;
  int maximunpoints;
  int bsqodd;
  int pstodd;
  int trrodd;
  int cash;
  int potnv;
  int fptnv;
  int tonicv;
  int potnc;
  int fptnc;
  int tonicc;
  int cdtenemy;
  int cdtplayr;
  
  ConfigFile(){
    file=loadStrings("config.dat");
    loadConfig();
  }
  
  void loadConfig(){
    int i;
    
    for(i=0;i<file.length;i++){
      if(split(file[i],'=')[0].equals("#language"))
        lang=(int(split(file[i],'=')[1]));
      if(split(file[i],'=')[0].equals("#langstr"))
        ns=(int(split(file[i],'=')[1]));
      if(split(file[i],'=')[0].equals("#pointsnotassigned"))
        pointsnotassigned=(int(split(file[i],'=')[1]));
      if(split(file[i],'=')[0].equals("#minimumpoints"))
        minimumpoints=(int(split(file[i],'=')[1]));  
      if(split(file[i],'=')[0].equals("#maximunpoints"))
        maximunpoints=(int(split(file[i],'=')[1]));
      if(split(file[i],'=')[0].equals("#bsqodd"))
        bsqodd=(int(split(file[i],'=')[1]));
      if(split(file[i],'=')[0].equals("#pstodd"))
        pstodd=(int(split(file[i],'=')[1]));
      if(split(file[i],'=')[0].equals("#trrodd"))
        trrodd=(int(split(file[i],'=')[1]));
      if(split(file[i],'=')[0].equals("#cash"))
        cash=(int(split(file[i],'=')[1]));
      if(split(file[i],'=')[0].equals("#potnv"))
        potnv=(int(split(file[i],'=')[1]));
      if(split(file[i],'=')[0].equals("#fptnv"))
        fptnv=(int(split(file[i],'=')[1]));
      if(split(file[i],'=')[0].equals("#tonicv"))
        tonicv=(int(split(file[i],'=')[1]));
      if(split(file[i],'=')[0].equals("#potnc"))
        potnc=(int(split(file[i],'=')[1]));
      if(split(file[i],'=')[0].equals("#fptnc"))
        fptnc=(int(split(file[i],'=')[1]));
      if(split(file[i],'=')[0].equals("#tonicc"))
        tonicc=(int(split(file[i],'=')[1]));
      if(split(file[i],'=')[0].equals("#cdtenemy"))
        cdtenemy=(int(split(file[i],'=')[1]));
      if(split(file[i],'=')[0].equals("#cdtplayr"))
        cdtplayr=(int(split(file[i],'=')[1]));  
    }
  }
  
  void saveConfig(LangFiles lf){
    lang=lf.getLang();
    String save="";
    save=save+"#language="+lang+";";
    save=save+"#langstr="+ns+";";
    save=save+"#pointsnotassigned="+pointsnotassigned+";";
    save=save+"#minimumpoints="+minimumpoints+";";
    save=save+"#maximunpoints="+maximunpoints+";";
    save=save+"#bsqodd="+bsqodd+";";
    save=save+"#pstodd="+pstodd+";";
    save=save+"#trrodd="+trrodd+";";
    save=save+"#cash="+cash+";";
    save=save+"#potnv="+potnv+";";
    save=save+"#fptnv="+fptnv+";";
    save=save+"#tonicv="+tonicv+";";
    save=save+"#potnc="+potnc+";";
    save=save+"#fptnc="+fptnc+";";
    save=save+"#tonicc="+tonicc+";";
    save=save+"#cdtenemy="+cdtenemy+";";
    save=save+"#cdtplayr="+cdtplayr+";";
    file=split(save,';');
    saveStrings("data/config.dat",file);
  }
}
