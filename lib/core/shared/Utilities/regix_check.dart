class REGEXCheck {
  static bool isNumeric(String string) {
    final numericRegex =
    RegExp(r'^-?(([0-9]*)|(([0-9]*)))$');
    return numericRegex.hasMatch(string);
  }

 static bool isUrl(String string) {
    final numericRegex =
    RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
    return numericRegex.hasMatch(string);
  }
 static bool isName(String string,{int minNameSections = 4}) {
  if(minNameSections <0) throw const FormatException('name can\'t be less than one section');
  String nameSectionRegex = '([a-z\\p{sc=Arabic}]{2,}\\s)';
  String lastSection = '([a-z\\p{sc=Arabic}]{1,})(.+)';
  late RegExp regex;
  String sections = '';
  if(minNameSections != 1) sections = List.generate(minNameSections-1, (index) => nameSectionRegex).join();
  regex = RegExp('^(?!.*\\d)$sections$lastSection\$',unicode: true,caseSensitive: false);
    return regex.hasMatch(string);
  }
}