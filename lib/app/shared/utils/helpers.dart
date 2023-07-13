class HelpersApp{

  static String getInicials(String name){
    List nameSplit = name.split(' ');
    String firstLetter = nameSplit[0][0];
    String firstSecoundLetter = nameSplit[1][0];
    return firstLetter+firstSecoundLetter;
  }

}