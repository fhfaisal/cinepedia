import 'package:cinepedia/app/utils/language.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/routes/app_pages.dart';
import 'app/theme/theme.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>  GetMaterialApp(
        title: "Application",
        locale: const Locale('en', 'US'),
        translations: LanguageTranslations(),
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: darkMode,
        darkTheme: darkMode,
      ),
    ),
  );
}
