
import 'package:cinepedia/app/data/cradits.dart';
import 'package:cinepedia/app/data/image.dart';
import 'package:cinepedia/app/data/movie_details.dart';
import 'package:cinepedia/app/data/reviews.dart';
import 'package:cinepedia/app/data/similar.dart';
import 'package:cinepedia/app/repository/home.dart';
import 'package:cinepedia/app/repository/movie_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';

class MovieDetailsController extends GetxController with GetTickerProviderStateMixin {
  late int movieId; // Declare movieId variable
  late TabController tabController;
  final myTabs = [
    Tab(text: 'Overview'),
    Tab(text: 'Details'),
    Tab(text: 'Reviews'),
    Tab(text: 'Suggestions'),
  ];

  final isLoading = false.obs;
  final Rx<MovieDetailsResponse> movieDetailsResponse = MovieDetailsResponse().obs;
  final Rx<CreditsResponse> creditsResponse = CreditsResponse().obs;
  final Rx<ImagesResponse> imageResponse = ImagesResponse().obs;
  final Rx<ReviewsResponse> reviewsResponse = ReviewsResponse().obs;
  final Rx<SimilarResponse> similarResponse = SimilarResponse().obs;

  @override
  void onInit() {
    initializeMovieId(); // Call initialization method onInit
    tabController = TabController(vsync: this, length: myTabs.length);
    fetchCredits();
    fetchImages();
    fetchReviews();
    fetchSimilar();
    super.onInit();
  }

  @override
  void onReady() {
    tabController = TabController(vsync: this, length: myTabs.length,initialIndex: 0);
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Function to initialize movieId with Get.arguments
  void initializeMovieId() {
    // Get.arguments should be used after the widget is pushed with navigation
    final getId = Get.arguments;
    if (getId != null && getId is int) {
      movieId = getId;
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
  Future<void> fetchCredits() async {
    isLoading.value = true;
    await creditsResponseApi(movieId).then((response) {
      if (response != null) {
        creditsResponse.value = response;
      }
      isLoading.value = false;
    });
    update();
  }
  Future<void> fetchImages()async {
    isLoading.value==true;
    await imageResponseApi(movieId).then((response){
      if(response !=null){
        imageResponse.value=response;
      }
    });
  }
  Future<void> fetchReviews()async {
    isLoading.value==true;
    await reviewsResponseApi(movieId).then((response){
      if(response !=null){
        reviewsResponse.value=response;
      }
    });
  }
  Future<void> fetchSimilar()async {
    isLoading.value==true;
    await similarResponseApi(movieId).then((response){
      if(response !=null){
        similarResponse.value=response;
      }
    });
  }
}
