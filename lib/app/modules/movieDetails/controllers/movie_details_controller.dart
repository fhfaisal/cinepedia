import 'package:cinepedia/app/data/movie_details.dart';
import 'package:cinepedia/app/repository/home_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';

class MovieDetailsController extends GetxController {
  late int movieId; // Declare movieId variable

  final isLoading = false.obs;
  final Rx<MovieDetailsResponse> movieDetailsResponse = MovieDetailsResponse().obs;

  @override
  void onInit() {
    initializeMovieId(); // Call initialization method onInit
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
  void initializeMovieId() {
    // Get.arguments should be used after the widget is pushed with navigation
    final args = Get.arguments;
    if (args != null && args is int) {
      movieId = args;
      // Fetch movie details using the received movieId
      fetchMovieDetails();
    } else {
      // Handle the case where no arguments are received or they are of unexpected type
      // You can show an error message or navigate back to the previous page
    }
  }

  Future<void> fetchMovieDetails() async {
    isLoading.value = true;
    // Fetch movie details using movieId
    await movieDetailsResponseApi(movieId).then((response) {
      if (response != null) {
        movieDetailsResponse.value = response;
      }
      isLoading.value = false;
    });
    update();
  }
}
