import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData lightMode = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      color: Colors.white,
      titleTextStyle: TextStyle(color: Colors.black),
      iconTheme: IconThemeData(color: Colors.black),
    ),
    primaryColor: AppColor.primaryColor,
    colorScheme: ColorScheme.light(
        brightness: Brightness.light,
        // primary: primary,
        // onPrimary: onPrimary,
        // secondary: secondary,
        // onSecondary: onSecondary,
        // error: error,
        // onError: onError,
        // background: background,
        // onBackground: onBackground,
        // surface: surface,
        // onSurface: onSurface
        ),
    scaffoldBackgroundColor: AppColor.bgLight,
    textTheme: textTheme
);

ThemeData darkMode = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColor.blueLightTextColor,
    colorScheme: ColorScheme.light(
      background: AppColor.bgDark,
    )
);

final textStyle = TextStyle(color: Colors.black);
final textTheme = TextTheme(
  bodySmall: textStyle,
  bodyMedium: textStyle,
  bodyLarge: textStyle,
);