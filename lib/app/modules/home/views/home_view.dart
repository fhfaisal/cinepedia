import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinepedia/app/theme/theme.dart';
import 'package:cinepedia/app/utils/constants.dart';
import 'package:cinepedia/app/utils/design_elemints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/section_separation.dart';
import '../../../utils/widgets/loader/now_playing.dart';
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
              // SectionSeparation(
              //   separationText: 'trending'.tr,
              //   actionText: 'see_more'.tr,
              // ),
              // Trending(controller: controller)
            ],
          ),
        ),
      ),
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
      child: Obx(
        () => controller.isLoading.value
            ? const NowPlayingLoader()
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.nowPlayingResponse.value.results!.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => controller.navigateToMovieDetails(index),
                  child: Container(
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
                                height: 220,
                                fit: BoxFit.cover,
                                imageUrl:
                                    '${Constants.posterUrl}${controller.nowPlayingResponse.value.results!.elementAt(index).posterPath!}',
                                placeholder: (context, url) => SizedBox(
                                  height: 220,
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.red,
                                    highlightColor: Colors.yellow,
                                    direction: ShimmerDirection.ltr,
                                    child: Center(
                                      child: Text(
                                        'Loading',
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context).textTheme.titleMedium,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          controller.nowPlayingResponse.value.results!.elementAt(index).title!.isEmpty
                              ? controller.nowPlayingResponse.value.results!.elementAt(index).title!
                              : controller.nowPlayingResponse.value.results!.elementAt(index).originalTitle!,
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
                ),
              ),
      ),
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
      child: Obx(() => controller.isLoading.value
        ?ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          width: 150,
          margin: const EdgeInsets.only(right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: Theme.of(context).colorScheme.errorContainer,
                highlightColor: Theme.of(context).highlightColor,
                direction: ShimmerDirection.ltr,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation: 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: SizedBox(
                      height: 90,
                      child: Shimmer.fromColors(
                        baseColor: Colors.red,
                        highlightColor: Colors.yellow,
                        direction: ShimmerDirection.ltr,
                        child: Center(
                          child: Text(
                            'Loading',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                    ),),
                ),
              ),
              const SizedBox(height: 8),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade200,
                child: Container(
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      )
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.popularResponse.value.results!.length,
              itemBuilder: (context, index) => Container(
                width: 150,
                height: 150,
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
                            height: 90,
                            imageUrl:controller.popularResponse.value.results!.elementAt(index).backdropPath != null
                                ? '${Constants.posterUrl}${controller.popularResponse.value.results!.elementAt(index).backdropPath}'
                                : 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/640px-Image_not_available.png',
                            placeholder: (context, url) => SizedBox(
                              height: 120,
                              child: Shimmer.fromColors(
                                baseColor: Colors.red,
                                highlightColor: Colors.yellow,
                                direction: ShimmerDirection.ltr,
                                child: Center(
                                  child: Text(
                                    'Loading',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                ),
                              ),
                            ),
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
            )),
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
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.red,
                              highlightColor: Colors.yellow,
                              child: Text(
                                'Shimmer',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) => Image.asset('assets/logo/logo.png'),
                            imageBuilder: (context, imageProvider) => Image(image: imageProvider),
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
