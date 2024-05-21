import 'package:get/get.dart';

import '../controllers/actor_details_controller.dart';

class ActorDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActorDetailsController>(
      () => ActorDetailsController(),
    );
  }
}
