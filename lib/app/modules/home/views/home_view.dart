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
        systemOverlayStyle: Get.isDarkMode
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        title: Text(
          Get.isDarkMode ? 'Dark Theme' : 'Light Theme',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            Get.changeTheme(
              Get.isDarkMode ? lightMode : ThemeData.dark(),
            );
          },
          child: Text('Change Theme',style: Theme.of(context).textTheme.bodyLarge,),
        ),
      ),
    );
  }
}
