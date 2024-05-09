import 'package:cinepedia/app/theme/text_style_dark.dart';
import 'package:cinepedia/app/theme/text_style_light.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData lightMode = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      color: AppColor.bgLight,
      titleTextStyle: TextStyle(color: Colors.black),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    primaryColor: AppColor.primary,
    iconTheme: IconThemeData(color: Colors.white),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        side: MaterialStateProperty.all<BorderSide>(
            BorderSide(color: AppColor.secondary)),
      ),
    ),
    primaryColorDark: AppColor.primary,
    colorScheme: const ColorScheme.light(
      primary: AppColor.primaryDark,
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
    onPrimary: Color(0xFF381E72),
    secondary: AppColor.secondaryDark,
    onSecondary: Colors.white,
    error: AppColor.error,
    onError: Colors.red,
    background: AppColor.bgDark,
    onBackground: Colors.black,
    surface: AppColor.surface,
    onSurface: Colors.black,
  ),
  scaffoldBackgroundColor: AppColor.surfaceDark,
  textTheme: textThemeDark,
);
