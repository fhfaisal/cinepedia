import 'package:cinepedia/app/data/now_playing.dart';
import 'package:cinepedia/app/repository/home_repository.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';

class HomeController extends GetxController {
  final isLoading = false.obs;
  final Rx<NowPlayingResponse> nowPlayingResponse = NowPlayingResponse().obs;
  final Rx<NowPlayingResponse> popularResponse = NowPlayingResponse().obs;

  @override
  void onInit() {
    nowPlayingResponseDataCall();
    popularDataCall();
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


}
