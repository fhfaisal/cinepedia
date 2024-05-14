import 'package:cinepedia/app/theme/text_style_dark.dart';
import 'package:cinepedia/app/theme/text_style_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

ThemeData lightMode = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      color: AppColor.bgLight,
      titleTextStyle: TextStyle(color: Colors.black),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    primaryColor: AppColor.primary,
    cardColor: AppColor.secondary,
    iconTheme: IconThemeData(),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        // padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 16,vertical: 0)),
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        side: MaterialStateProperty.all<BorderSide>(
            BorderSide(color: AppColor.secondary)),
        elevation: MaterialStatePropertyAll(4)
      ),

    ),
    primaryColorDark: AppColor.primary,
    colorScheme: const ColorScheme.light(
      primary: AppColor.primary,
      onPrimary: Colors.black,
      secondary: AppColor.secondaryDark,
      onSecondary: Colors.white,
      error: AppColor.error,
      onError: Colors.red,
      background: AppColor.bgDark,
      onBackground: Colors.black,
      surface: AppColor.surface,
      onSurface: Colors.black,
        ),
    scaffoldBackgroundColor: AppColor.surface,
    textTheme: textThemeLight,
);
ThemeData darkMode = ThemeData.dark().copyWith(
  appBarTheme: const AppBarTheme(
  color: AppColor.bgDark,
  titleTextStyle: TextStyle(color: Colors.white),
  systemOverlayStyle: SystemUiOverlayStyle.dark,
  iconTheme: IconThemeData(color: Colors.white),
),
  primaryColor: AppColor.primary,
  iconTheme: const IconThemeData(color: Colors.white),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(color: AppColor.secondaryDark)),
    ),
  ),
  primaryColorDark: AppColor.primary,
  colorScheme: const ColorScheme.dark(
    primary: AppColor.primaryDark,
    onPrimary: AppColor.darkLinear1,
    secondary: AppColor.secondaryDark,
    onSecondary: AppColor.darkLinear2,
    error: AppColor.error,
    onError: Colors.red,
    background: AppColor.bgDark,
    onBackground: Colors.black,
    surface: AppColor.surface,
    onSurface: Colors.black,
    errorContainer: AppColor.errorContainer,
  ),
  scaffoldBackgroundColor: AppColor.surfaceDark,
  textTheme: textThemeDark,
);
