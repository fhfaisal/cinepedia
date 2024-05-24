import 'package:cinepedia/app/modules/home/controllers/home_controller.dart';
import 'package:cinepedia/app/modules/searchPage/controllers/search_page_controller.dart';
import 'package:cinepedia/app/modules/searchPage/views/search_page_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/widgets/empty.dart';
import '../../home/views/home_view.dart';
import '../controllers/bottom_navigation_bar_controller.dart';

class BottomNavigationBarView extends GetView<BottomNavigationBarController> {
  const BottomNavigationBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: getPage(controller.selectedIndex.value),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).navigationBarTheme.backgroundColor,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: controller.selectedIndex.value,
        onTap: (value) => controller.changeTabIndex(value),

        items:  [
          BottomNavigationBarItem(
            label:'home'.tr,
            icon: Icon(Icons.movie),
          ),
          BottomNavigationBarItem(
            label:'categories'.tr,
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            label:'search'.tr,
            icon: Icon(Icons.search),
          ),
        ],
      ),
    ));
  }
}

Widget getPage(int index) {
  switch (index) {
    case 0:
      Get.put(HomeController());
      return const HomeView();
    case 1:
      return EmptyPage(
        buttonText: 'go_back'.tr,
        title: 'search_empty_title'.tr,
        subtitle: 'search_empty_message'.tr,
        isButton: false,
      );
    case 2:
      Get.put(SearchPageController());
      return const SearchPageView();
    default:
      return Container(
        child:  Center(
          child: Text("something_wrong".tr),
        ),
      );
  }
}