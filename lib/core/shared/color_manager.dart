import 'package:flutter/material.dart';

class ColorManager {
  static const LinearGradient defaultGradient =   LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors:  [ColorManager.primary,ColorManager.primaryLight]);
  static BoxShadow defaultShadow =  const BoxShadow(color: Colors.black26,offset: Offset(0, 3),blurRadius: 10);
  // static const Color primaryExtraLight = Color(0xFFEE4540);
  // static const Color primaryLight = Color(0xFFC72C41);
  // static const Color primary = Color(0xFF801336);
  // static const Color primaryDark = Color(0xFF510A32);
  // static const Color primaryExtraDark = Color(0xFF2D142C);
  // static const Color primaryExtraLight = Color.fromARGB(255, 125, 64, 238);
  static const Color primaryLight = Color(0xFFf9de35);
  static const Color primary = Color(0xFFfab43f);
  static const Color primaryDark = Color(0xFFd79b36);
  // static const Color primaryExtraDark = Color.fromARGB(255, 33, 20, 45);
  static const Color lightPink = Color(0xFFDFC3CC);
  static const Color darkGrey = Color(0xFF525252);
  static const Color grey = Color(0xFF737477);
  static const Color greyText = Color(0xFF949494);
  static const Color greyTextOpacity = Color(0xFFc3c3c3);
  static const Color lightGrey = Color(0xFFf3f3f3);
  static const Color shadow = Color(0x29000000);

  // // new colors
  // static const Color darkPrimary = Color(0xFFE0AB28);
  // static Color lightPrimary = const Color(0xCCf9be2d); // color with 80% opacity
  // static Color lightPrimary = const Color(0xFFf8f0c5); // glow
  static const Color defaultGrey = Color(0xfff5f5f5);
  static const Color grey1 = Color(0xff707070);
  static const Color grey2 = Color(0xff797979);
  static const Color greyDark = Color(0xff797979);
  static const Color white = Color(0xffFFFFFF);
  static const Color enabled = Color(0xFF707070);
  static const Color disabled = Color(0xFFc4c4c4);
  static const Color error = Color(0xffff4646); // red color
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;

  //Glow
  static const Color glow1 = Color(0xfff5efc5);
  static const Color glow2 = Color(0xffc7c5c7);

//Fonts
  static const Color header = Color(0xff151f46);
  static const Color title1 = Color(0xff404040);
  static const Color title2 = Color(0xff274260);
  static const Color subTitle = Color(0xff8d8d8d);
  
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
