import 'package:flutter/material.dart';

import 'colors.dart';
///Display
final displayLarge = TextStyle(fontFamily: 'Nunito',color: AppColor.primary,fontSize: 57);
final displayMedium = TextStyle(fontFamily: 'Nunito',color: AppColor.primary,fontSize: 45);
final displaySmall = TextStyle(fontFamily: 'Nunito',color: AppColor.primary,fontSize: 36);
///Headline
final headlineLarge = TextStyle(fontFamily: 'Nunito',color: AppColor.primary,fontSize: 32);
final headlineMedium = TextStyle(fontFamily: 'Nunito',color: AppColor.primary,fontSize: 28);
final headlineSmall = TextStyle(fontFamily: 'Nunito',color: AppColor.primary,fontSize: 24);
///title
final titleLarge = TextStyle(fontFamily: 'Nunito',color: AppColor.primary,fontSize: 22);
final titleMedium = TextStyle(fontFamily: 'Nunito',color: AppColor.primary,fontSize: 18,fontWeight: FontWeight.w500);
final titleSmall = TextStyle(fontFamily: 'Nunito',color: AppColor.primary,fontSize: 16);
///Label
final labelLarge = TextStyle(fontFamily: 'Nunito',color: AppColor.primary,fontSize: 14);
final labelMedium = TextStyle(fontFamily: 'Nunito',color: AppColor.primary,fontSize: 12);
final labelSmall = TextStyle(fontFamily: 'Nunito',color: AppColor.primary,fontSize: 11);
///Body
final bodyLarge = TextStyle(fontFamily: 'Nunito',color: AppColor.primary,fontSize: 10,);
final bodyMedium = TextStyle(fontFamily: 'Nunito',color: AppColor.primary,fontSize: 9);
final bodySmall = TextStyle(fontFamily: 'Nunito',color: AppColor.primary,fontSize: 8,);

final button = TextStyle(fontFamily: 'Nunito',color: AppColor.primary,fontSize: 12,);

final textThemeLight = TextTheme(
  displayLarge: displayLarge,
  displayMedium: displayMedium,
  displaySmall: displaySmall,
  headlineLarge: headlineLarge,
  headlineMedium: headlineMedium,
  headlineSmall: headlineSmall,
  titleLarge: titleLarge,
  titleMedium: titleMedium,
  titleSmall: titleSmall,
  labelLarge: labelLarge,
  labelMedium: labelMedium,
  labelSmall: labelSmall,
  bodyLarge: bodyLarge,
  bodyMedium: bodyMedium,
  bodySmall: bodySmall,
);