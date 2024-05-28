import 'package:cinepedia/app/data/search.dart';
import 'package:cinepedia/app/repository/movie_details.dart';
import 'package:cinepedia/app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SearchPageController extends GetxController {
  final searchController = TextEditingController().obs;
  final isLoading=false.obs;

  final Rx<SearchResponse> searchResponse = SearchResponse().obs;
  final count = 0.obs;

  @override
  void onInit() {
    searchController.value.clear();
    super.onInit();
  }

  @override
  void onReady() {
    searchController.value.clear();
    super.onReady();
  }
  @override
  void onClose() {
    searchController.value.clear();
    super.onClose();
  }
  Future<SearchResponse?> fetchSearchData() async {
    isLoading.value = true;
    Map<String, dynamic> values = {};
    values['query'] = searchController.value.text.toString();
    values['api_key'] = Constants.apiKey;
    await searchResponseApi(values).then((response) {
      if(response != null){
        searchResponse.value = response;
        print(response);
      }
      isLoading.value = false;
    });
    update();
    return null;
  }
  navigateToMovieDetails(index){
    Get.toNamed(Routes.MOVIE_DETAILS,arguments: searchResponse.value.results!.elementAt(index).id);
  }
}
