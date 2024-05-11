import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinepedia/app/theme/theme.dart';
import 'package:cinepedia/app/utils/constants.dart';
import 'package:cinepedia/app/utils/design_elemints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../../../utils/section_separation.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: Get.isDarkMode ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
        title: Text(
          'app_name'.tr,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () => Get.changeTheme(
                    Get.isDarkMode ? lightMode : darkMode,
                  ),
              icon: Icon(Get.isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: fixMargin().copyWith(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionSeparation(
                separationText: 'now_showing'.tr,
                actionText: 'see_more'.tr,
              ),
              NowPlaying(controller: controller),
              SectionSeparation(
                separationText: 'popular'.tr,
                actionText: 'see_more'.tr,
              ),
              PopularMovie(controller: controller),
              SectionSeparation(
                separationText: 'trending'.tr,
                actionText: 'see_more'.tr,
              ),
              Trending(controller: controller)
            ],
          ),
        ),
      ),
    );
  }
}

class Trending extends StatelessWidget {
  const Trending({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Obx(() => controller.isLoading.value == false
          ? ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.nowPlayingResponse.value.results!.length,
        itemBuilder: (context, index) => Container(
          width: 70,
          margin: const EdgeInsets.only(right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                elevation: 5,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CachedNetworkImage(
                      imageUrl:
                      '${Constants.posterUrl}${controller.nowPlayingResponse.value.results!.elementAt(index).posterPath!}',
                      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Image.asset('assets/logo/logo.png'),
                      imageBuilder: (context, imageProvider) => Image(image: imageProvider),
                      placeholderFadeInDuration: const Duration(milliseconds: 500),
                      fit: BoxFit.fitHeight,
                      height: 90,
                    )),
              ),
              Text(
                controller.nowPlayingResponse.value.results!.elementAt(index).title!,
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 1,
                overflow: TextOverflow.fade,
              ),
            ],
          ),
        ),
      )
          : const Center(
        child: CircularProgressIndicator(),
      )),
    );
  }
}

class PopularMovie extends StatelessWidget {
  const PopularMovie({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Obx(() => controller.isLoading.value == false
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.popularResponse.value.results!.length,
              itemBuilder: (context, index) => Container(
                width: 150,
                margin: const EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      elevation: 5,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: CachedNetworkImage(
                            imageUrl:
                                '${Constants.posterUrl}${controller.popularResponse.value.results!.elementAt(index).backdropPath}',
                            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => const Center(child: CircularProgressIndicator()),
                            imageBuilder: (context, imageProvider) => Image(image: imageProvider),
                            placeholderFadeInDuration: const Duration(milliseconds: 500),
                            fit: BoxFit.cover,
                          )),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      controller.popularResponse.value.results!.elementAt(index).title!,
                      style: Theme.of(context).textTheme.labelMedium,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                    ),
                    Text(
                      '${'release_date'.tr} ${formatOnlyDate(controller.popularResponse.value.results!.elementAt(index).releaseDate!)}',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(height: 2),
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                    ),
                  ],
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            )),
    );
  }
}

class NowPlaying extends StatelessWidget {
  final HomeController controller;

  const NowPlaying({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Obx(() => controller.isLoading.value == false
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.nowPlayingResponse.value.results!.length,
              itemBuilder: (context, index) => Container(
                width: 150,
                margin: const EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      elevation: 5,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: CachedNetworkImage(
                            imageUrl:
                                '${Constants.posterUrl}${controller.nowPlayingResponse.value.results!.elementAt(index).posterPath!}',
                            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => Image.asset('assets/logo/logo.png'),
                            imageBuilder: (context, imageProvider) => Image(image: imageProvider),
                            placeholderFadeInDuration: const Duration(milliseconds: 500),
                            fit: BoxFit.cover,
                          )),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      controller.nowPlayingResponse.value.results!.elementAt(index).title!,
                      style: Theme.of(context).textTheme.labelMedium,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                    ),
                    Text(
                      '${'release_date'.tr} ${formatOnlyDate(controller.nowPlayingResponse.value.results!.elementAt(index).releaseDate!)}',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(height: 2),
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                    ),
                  ],
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            )),
    );
  }
}
