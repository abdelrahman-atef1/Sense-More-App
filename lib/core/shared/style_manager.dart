import 'package:sense_more/core/shared/color_manager.dart';
import 'font_manager.dart';
import 'package:flutter/material.dart';



TextStyle _getTextStyle(double fontSize,FontWeight fontWeight,Color color,double? height,{TextDecoration? decoration}){
  return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: FontConstants.fontFamily,
      height: height,
      decoration: decoration
      );
}

// Regular Style
TextStyle getRegularStyle({double fontSize = FontSize.s10, required Color color,double? height}){
return _getTextStyle(fontSize, FontWeightManager.regular, color,height);
}
// Regular Style
TextStyle getLinkStyle({double fontSize = FontSize.s10,Color? color,double? height,TextDecoration? decoration}){
return _getTextStyle(fontSize, FontWeightManager.regular,
      color ?? ColorManager.primaryExtraDark.withOpacity(0.6), 
      height,
      decoration: decoration ?? TextDecoration.underline);
}
// Medium Style
TextStyle getMediumStyle({double fontSize = FontSize.s10, required Color color,double? height}){
return _getTextStyle(fontSize, FontWeightManager.medium, color,height);
}
// Light Style
TextStyle getLightStyle({double fontSize = FontSize.s10, required Color color,double? height}){
return _getTextStyle(fontSize, FontWeightManager.light, color,height);
}
// Bold Style
TextStyle getBoldStyle({double fontSize = FontSize.s10, required Color color,double? height}){
return _getTextStyle(fontSize, FontWeightManager.bold, color,height);
}
// Extra Bold Style
TextStyle getExtraBoldStyle({double fontSize = FontSize.s14, required Color color,double? height}){
return _getTextStyle(fontSize, FontWeightManager.black, color,height);
}
// Black Style
TextStyle getBlackStyle({double fontSize = FontSize.s18, required Color color,double? height}){
return _getTextStyle(fontSize, FontWeightManager.black, color,height);
}
// SemiBold Style
TextStyle getSemiBoldStyle({double fontSize = FontSize.s10, required Color color,double? height}){
return _getTextStyle(fontSize, FontWeightManager.semiBold, color,height);
}