//Modulo LangFiles
//elaborado por: Pedro Angel Gomez Dimas
//fecha de creación: 27 de septiembre de 2021
//fecha de ultima modificación: 27 de septiembre de 2021
//comentario:

class LangFiles{
  String langs[][];
  String file[];
  int actlang;
  int ns;

  LangFiles(int l,int n){
    actlang=l;
    ns=n;
    langs=new String [ns][2];

    //cargaspa
    loadLang(0);
    //cargaing
    loadLang(1);
  }
  
  void loadLang(int i){
    int n;
    if(i==LGSPA)
      file=loadStrings("spa.lang");
    else
      file=loadStrings("eng.lang");
    for(n=0; n<ns;n++){
      langs[n][i]=split(file[n],'=')[1];
    }  
  }
  
  void setLang(int l){
    actlang=l;
  }
  
  int getLang(){
    return actlang;
  }
  
  String showString(int i){
    return langs[i][actlang];
  }
  
  void toggleLang(){
    actlang=(actlang==LGSPA)?LGENG:LGSPA;
  }
}
