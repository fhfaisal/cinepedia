import 'package:cinepedia/app/utils/language.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/theme/theme.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      locale: const Locale('en', 'US'),
      translations: LanguageTranslations(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: darkMode,
      darkTheme: darkMode,
    ),
  );
}
