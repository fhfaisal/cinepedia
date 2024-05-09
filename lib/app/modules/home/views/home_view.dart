import 'package:cinepedia/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: Get.isDarkMode ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
        title: Text(
          'app_name'.tr,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () => Get.changeTheme(
                    Get.isDarkMode ? lightMode : darkMode,
                  ),
              icon: Icon(Get.isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined))
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            Text('Hello Flutter',
              style: Theme.of(context).textTheme.displayLarge,),
            Text('Hello Flutter',
              style: Theme.of(context).textTheme.displayMedium,),
            Text('Hello Flutter',
              style: Theme.of(context).textTheme.displaySmall,),

            Text('Hello Flutter',
              style: Theme.of(context).textTheme.headlineLarge,),
            Text('Hello Flutter',
              style: Theme.of(context).textTheme.headlineMedium,),
            Text('Hello Flutter',
              style: Theme.of(context).textTheme.headlineSmall,),

            Text('Hello Flutter',
              style: Theme.of(context).textTheme.titleLarge,),
            Text('Hello Flutter',
              style: Theme.of(context).textTheme.titleMedium,),
            Text('Hello Flutter',
              style: Theme.of(context).textTheme.titleSmall,),

            Text('Hello Flutter',
              style: Theme.of(context).textTheme.labelLarge,),
            Text('Hello Flutter',
              style: Theme.of(context).textTheme.labelMedium,),
            Text('Hello Flutter',
              style: Theme.of(context).textTheme.labelSmall,),


            Text('Hello Flutter',
              style: Theme.of(context).textTheme.bodyLarge,),
            Text('Hello Flutter',
              style: Theme.of(context).textTheme.bodyMedium,),
            Text('Hello Flutter',
              style: Theme.of(context).textTheme.bodySmall),
            OutlinedButton(
              onPressed: () {
                Get.changeTheme(
                  Get.isDarkMode ? lightMode : darkMode,
                );
                print(Get.isDarkMode);
              },
              child: Text(
                'Change Theme',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
