import 'dart:ui';

import 'package:cinepedia/app/data/now_playing.dart';
import 'package:cinepedia/app/repository/home.dart';
import 'package:cinepedia/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../utils/constants.dart';

class HomeController extends GetxController {
  final isLoading = false.obs;
  final Rx<NowPlayingResponse> nowPlayingResponse = NowPlayingResponse().obs;
  final Rx<NowPlayingResponse> popularResponse = NowPlayingResponse().obs;
  var selectedIndex = 0.obs;


  final RxList<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ].obs;
  final RxList<String> letters = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
  ].obs;
  RxBool isPlaying = false.obs;

  @override
  void onInit() {
    nowPlayingResponseDataCall();
    // popularDataCall();
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
    isLoading.value = true;
    Map<String, dynamic> values = {};
    await nowPlayingResponseApi(values).then((response) {
      if(response != null){
        nowPlayingResponse.value = response;
      }
      isLoading.value = false;
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
  navigateToMovieDetails(index){
    Get.toNamed(Routes.MOVIE_DETAILS,arguments: nowPlayingResponse.value.results!.elementAt(index).id);
  }


}
