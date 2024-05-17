import 'package:cinepedia/app/theme/text_style_dark.dart';
import 'package:cinepedia/app/theme/text_style_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';
ThemeData darkMode = ThemeData.dark().copyWith(
  appBarTheme: const AppBarTheme(
  color: AppColor.bgDark,
  titleTextStyle: TextStyle(color: Colors.white),
  systemOverlayStyle: SystemUiOverlayStyle.dark,
  iconTheme: IconThemeData(color: Colors.white),
),
  cardTheme: CardTheme(
    color: AppColor.errorContainer
  ),
  primaryColor: AppColor.primaryDark,
  iconTheme: const IconThemeData(color: Colors.white),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(color: AppColor.secondaryDark)),
    ),
  ),
  primaryColorDark: AppColor.primaryDark,
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
