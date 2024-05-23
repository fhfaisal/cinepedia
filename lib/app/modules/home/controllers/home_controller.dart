import 'dart:ui';

import 'package:cinepedia/app/data/now_playing.dart';
import 'package:cinepedia/app/data/tvseries.dart';
import 'package:cinepedia/app/repository/home.dart';
import 'package:cinepedia/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';


import '../../../utils/constants.dart';

class HomeController extends GetxController {
  final isLoading = false.obs;
  final isNowPlaying = false.obs;
  final Rx<NowPlayingResponse> nowPlayingResponse = NowPlayingResponse().obs;
  final Rx<NowPlayingResponse> popularResponse = NowPlayingResponse().obs;
  final Rx<TvSeriesResponse> topTvSeriesResponse = TvSeriesResponse().obs;
  var selectedIndex = 0.obs;

  late final CarouselSliderController sliderController;

  @override
  void onInit() {
   // WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchTopRatedTvSeries();
      nowPlayingResponseDataCall();
      sliderController = CarouselSliderController();
      // popularDataCall();
    // });
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

  Future<NowPlayingResponse?> nowPlayingResponseDataCall() async {
    isNowPlaying.value = true;
    Map<String, dynamic> values = {};
    await nowPlayingResponseApi(values).then((response) {
      if(response != null){
        nowPlayingResponse.value = response;
      }
      isNowPlaying.value = false;
    });
    update();
    return null;
  }
  Future<NowPlayingResponse?> popularDataCall() async {
    isLoading.value = true;
    Map<String, dynamic> values = {};
    await nowPlayingResponseApi(values).then((response) {
      if(response != null){
        popularResponse.value = response;
      }
      isLoading.value = false;
    });
    update();
    return null;
  }
  Future<TvSeriesResponse?> fetchTopRatedTvSeries() async {
    isLoading.value = true;
    Map<String, dynamic> values = {};
    await topRatedTvSeriesResponseApi(values).then((response) {
      if(response != null){
        topTvSeriesResponse.value = response;
      }
      isLoading.value = false;
    });
    update();
    return null;
  }
  navigateToMovieDetails(index){
    Get.toNamed(Routes.MOVIE_DETAILS,arguments: nowPlayingResponse.value.results!.elementAt(index).id);
  }


}
