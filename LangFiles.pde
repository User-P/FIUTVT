//Modulo LangFiles
//elaborado por: Pedro Angel Gomez Dimas
//fecha de creación: 27 de septiembre de 2021
//fecha de ultima modificación: 27 de septiembre de 2021
//comentario:

class LangFiles{
  String langs[][];
  String file[];
  int activelang;
  int ns;

  LangFiles(int l,int n){
    activelang=l;
    ns=n;
    langs=new String [ns][2];

    loadLang(0);
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
    activelang=l;
  }
  
  int getLang(){
    return activelang;
  }
  
  String showString(int i){
    return langs[i][activelang];
  }
  
  void toggleLang(){
    activelang=(activelang==LGSPA)?LGENG:LGSPA;
  }
}
