import 'package:cinepedia/app/repository/actor_details.dart';
import 'package:get/get.dart';

import '../../../data/actor_details.dart';

class ActorDetailsController extends GetxController {
  late int personId;
  final selectedIndex=0.obs;
  final isLoading = false.obs;
  final Rx<ActorDetailsResponse> peopleResponse = ActorDetailsResponse().obs;

  final count = 0.obs;
  @override
  void onInit() {
    initializePersonId();
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
  // Function to initialize movieId with Get.arguments
  void initializePersonId() {
    // Get.arguments should be used after the widget is pushed with navigation
    final getId = Get.arguments;
    if (getId != null && getId is int) {
      personId = getId;
      // Fetch movie details using the received movieId
      fetchDetails();
    } else {
      // Handle the case where no arguments are received or they are of unexpected type
      // You can show an error message or navigate back to the previous page
    }
  }

  Future<ActorDetailsResponse?> fetchDetails() async {
    isLoading.value = true;
    await actorDetailsResponseApi(personId).then((response) {
      if(response != null){
        peopleResponse.value = response;
      }
      isLoading.value = false;
    });
    update();
    return null;
  }
}
