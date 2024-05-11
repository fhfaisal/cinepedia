import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  RxInt selectedIndex=0.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeTabIndex(int index) {
    selectedIndex.value = index;
    update();
  }



}
