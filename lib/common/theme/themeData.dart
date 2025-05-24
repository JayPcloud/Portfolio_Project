import 'package:flutter/material.dart';
import 'package:portfolio/common/constants/colors.dart';
import 'package:portfolio/common/theme/custom_theme/text_theme.dart';

class PTheme {

  PTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: PTextTheme.lightTextTheme,
    scaffoldBackgroundColor: PColors.backgroundLT,
    primaryColor: PColors.primaryLT,
    primaryColorLight: PColors.primaryAccentLT,
    primaryColorDark: PColors.white,
    iconTheme: IconThemeData(
      color: PColors.black
    ),

    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: PColors.primaryLT,
        onPrimary: Colors.black,
        secondary: PColors.primaryAccentLT,
        onSecondary: Colors.black,
        error: Colors.red,
        onError: Colors.white,
        surface: PColors.onBackgroundColorLT,
        onSurface: PColors.white,
        outline: PColors.outlineLT,
        outlineVariant: PColors.outlineVariantLT
    )
  );


  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: PTextTheme.darkTextTheme,
      scaffoldBackgroundColor: PColors.backgroundDT,
      primaryColor: PColors.primaryDT,
      primaryColorLight: PColors.primaryAccentDT,
      iconTheme: IconThemeData(
          color: PColors.white
      ),

      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: PColors.primaryDT,
        onPrimary: Colors.white,
        secondary: PColors.primaryAccentDT,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        surface: PColors.onBackgroundColorDT,
        onSurface: PColors.black,
        outline: PColors.outlineDT,
        outlineVariant: PColors.outlineVariantDT
      )
  );
}
