import 'color_manager.dart';
import 'font_manager.dart';
import 'style_manager.dart';
import 'values_manager.dart';
import 'package:flutter/material.dart';

MaterialStateColor defaultMaterialStateColor = MaterialStateColor.resolveWith((states) {
      if(states.contains(MaterialState.focused) || states.contains(MaterialState.selected)) {
        return ColorManager.primary;
      } else {
        return ColorManager.disabled;
      }
    });
ThemeData getApplicationTheme() {
  return ThemeData(
    useMaterial3: true,
    // main colors
    primaryColor: ColorManager.primary,
    primarySwatch: ColorManager.createMaterialColor(ColorManager.primary),
    // primaryColorLight: ColorManager.primaryLight,
    // primaryColorDark: ColorManager.primaryDark,
    // highlightColor: ColorManager.primary,
    // indicatorColor: ColorManager.primary,
    // visualDensity: VisualDensity.adaptivePlatformDensity,
    // disabledColor: ColorManager.grey1,
    // splashColor: ColorManager.primaryLight,
    colorScheme: ColorScheme.fromSeed(
      primary: ColorManager.primary,
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
    cardTheme: const CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4),
    // app bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.white,
        elevation: AppSize.s0,
        scrolledUnderElevation: AppSize.s0,
        titleTextStyle:
            getRegularStyle(fontSize: FontSize.s14, color: ColorManager.white)),
    // button theme
    buttonTheme: const ButtonThemeData(
        shape: StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.primaryLight),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s8),
            side: const BorderSide(color: ColorManager.primary)
        )),
        backgroundColor: MaterialStateProperty.all(ColorManager.primary),
        foregroundColor: MaterialStateProperty.all(ColorManager.white),
        shadowColor: MaterialStateProperty.all(ColorManager.primaryDark.withOpacity(0.1)),
        elevation: MaterialStateProperty.all(2),
      ),
        ),
    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(color: ColorManager.white, fontSize: FontSize.s17), 
            backgroundColor: ColorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s8)))),
    radioTheme: RadioThemeData(
      fillColor: defaultMaterialStateColor
    ),
    // text theme
    textTheme: TextTheme(
        displayLarge: getSemiBoldStyle(
            color: ColorManager.primary, fontSize: FontSize.s20),
        headlineLarge: getSemiBoldStyle(
            color: ColorManager.grey1, fontSize: FontSize.s14),
        headlineMedium: getSemiBoldStyle(
            color: ColorManager.primary, fontSize: FontSize.s14),
        titleLarge: getBoldStyle(
            color: ColorManager.primary, fontSize: FontSize.s14),
        titleMedium: getMediumStyle(
            color: ColorManager.grey1, fontSize: FontSize.s10),
        titleSmall: getRegularStyle(
            color: ColorManager.primary, fontSize: FontSize.s10),
        //Input Field Text
        bodyLarge: getMediumStyle(color: ColorManager.enabled, fontSize: FontSize.s16),
        bodyMedium: getMediumStyle(color: ColorManager.primary,height: 1.8 ,fontSize: FontSize.s14),
        bodySmall: getRegularStyle(color: ColorManager.grey),
        labelLarge: getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s14),
        labelMedium: getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s12),
        labelSmall: getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s10),
        ),
    iconTheme: IconThemeData(color:defaultMaterialStateColor),
    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: defaultMaterialStateColor,
        suffixIconColor: defaultMaterialStateColor,
        // content padding
        contentPadding: const EdgeInsets.all(AppPadding.p12),
        // hint style
        hintStyle: getRegularStyle(color: ColorManager.disabled, fontSize: FontSize.s12),
        labelStyle: getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s12),
        errorStyle: getRegularStyle(color: ColorManager.error),
        activeIndicatorBorder: const BorderSide(color: ColorManager.primary),
        outlineBorder: const BorderSide(color: ColorManager.primary),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s8),
            borderSide: const BorderSide(color: ColorManager.disabled),
            ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s8),
            borderSide: const BorderSide(color: ColorManager.disabled),
            ),
        enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: ColorManager.disabled, width: AppSize.s1),
            borderRadius: BorderRadius.circular(AppSize.s8),
            ),
        focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: ColorManager.primary, width: AppSize.s1),
            borderRadius: BorderRadius.circular(AppSize.s8),
            ),
        errorBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: ColorManager.error, width: AppSize.s1),
            borderRadius: BorderRadius.circular(AppSize.s8),
            ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: ColorManager.primary, width: AppSize.s1),
            borderRadius: BorderRadius.circular(AppSize.s8),
            )),
    // label style
  );

}