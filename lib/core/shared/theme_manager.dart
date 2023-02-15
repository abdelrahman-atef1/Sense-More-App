

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'style_manager.dart';
import 'values_manager.dart';
import 'package:flutter/material.dart';


ThemeData getApplicationTheme() {
  return ThemeData(
    useMaterial3: true,
    // main colors
    // primaryColor: ColorManager.primary,
    // primaryColorLight: ColorManager.primaryLight,
    // primaryColorDark: ColorManager.primaryDark,
    // highlightColor: ColorManager.primary,
    // indicatorColor: ColorManager.primary,
    // visualDensity: VisualDensity.adaptivePlatformDensity,
    // disabledColor: ColorManager.grey1,
    // splashColor: ColorManager.primaryLight,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorManager.primary,
      background: ColorManager.white,
      ),
    // ripple effect color
    scrollbarTheme: ScrollbarThemeData(
      thumbColor:MaterialStateProperty.all(ColorManager.primary),
      trackColor:MaterialStateProperty.all(ColorManager.white),
      // trackBorderColor:MaterialStateProperty.all(ColorManager.lightGrey),
    ),
    // cardview theme
    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4),
    // app bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.white,
        elevation: AppSize.s0,
        titleTextStyle:
            getRegularStyle(fontSize: FontSize.s14, color: ColorManager.white)),
    // button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.primaryLight),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s14),
            side: const BorderSide(color: ColorManager.primary)
        )),
        backgroundColor: MaterialStateProperty.all(ColorManager.primary),
        foregroundColor: MaterialStateProperty.all(ColorManager.white),
        shadowColor: MaterialStateProperty.all(ColorManager.primaryExtraDark.withOpacity(0.1)),
        elevation: MaterialStateProperty.all(2),
      ),
        ),
    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(color: ColorManager.white, fontSize: FontSize.s17), 
            backgroundColor: ColorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),

    // text theme
    textTheme: TextTheme(
        displayLarge: getSemiBoldStyle(
            color: ColorManager.primary, fontSize: FontSize.s20),
        headlineLarge: getSemiBoldStyle(
            color: ColorManager.header, fontSize: FontSize.s14),
        headlineMedium: getSemiBoldStyle(
            color: ColorManager.primary, fontSize: FontSize.s14),
        titleLarge: getBoldStyle(
            color: ColorManager.primary, fontSize: FontSize.s14),
        titleMedium: getBoldStyle(
            color: ColorManager.primary, fontSize: FontSize.s12),
        titleSmall: getBoldStyle(
            color: ColorManager.primary, fontSize: FontSize.s10),
        bodyLarge: getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s16),
        bodyMedium: getRegularStyle(color: ColorManager.primary,height: 1.8 ,fontSize: FontSize.s14),
        bodySmall: getRegularStyle(color: ColorManager.grey)),
    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
        // content padding
        contentPadding: const EdgeInsets.all(AppPadding.p12),
        // hint style
        hintStyle: getRegularStyle(color: ColorManager.primary.withOpacity(0.3), fontSize: FontSize.s10),
        labelStyle: getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s12),
        errorStyle: getRegularStyle(color: ColorManager.error),
        activeIndicatorBorder: const BorderSide(color: ColorManager.primary),
        outlineBorder: const BorderSide(color: ColorManager.primary),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s12),
            borderSide: const BorderSide(color: ColorManager.primary),
            ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s12),
            borderSide: const BorderSide(color: ColorManager.grey),
            ),
        enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: ColorManager.primary, width: AppSize.s1),
            borderRadius: BorderRadius.circular(AppSize.s12),
            ),
        focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: ColorManager.primaryLight, width: AppSize.s1),
            borderRadius: BorderRadius.circular(AppSize.s12),
            ),
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.error, width: AppSize.s1),
            borderRadius: BorderRadius.circular(AppSize.s12),
            ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: ColorManager.primaryLight, width: AppSize.s1),
            borderRadius: BorderRadius.circular(AppSize.s16.r),
            )),
    // label style
  );
}