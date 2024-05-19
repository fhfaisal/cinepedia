import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinepedia/app/theme/theme.dart';
import 'package:cinepedia/app/utils/buttons/primary_button.dart';
import 'package:cinepedia/app/utils/constants.dart';
import 'package:cinepedia/app/utils/design_elements.dart';
import 'package:cinepedia/app/utils/widgets/loader/trending_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/gradiant_text.dart';
import '../../../utils/section_separation.dart';
import '../../../utils/widgets/loader/now_playing.dart';
import '../../../utils/widgets/loader/shimmer_loading.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //appBar: _homeAppbar(context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSection(controller: controller),
              SectionSeparation(
                separationText: 'trending'.tr,
                actionText: 'show_all'.tr,
              ),
              Trending(controller: controller),
              SectionSeparation(
                separationText: 'now_showing'.tr,
                actionText: 'show_all'.tr,
              ),
              NowPlaying(controller: controller),
              SectionSeparation(
                separationText: 'Tv Series'.tr,
                actionText: 'show_all'.tr,
              ),
              TopTvSeries(controller: controller),
              // SectionSeparation(
              //   separationText: 'popular'.tr,
              //   actionText: 'show_all'.tr,
              // ),
              // PopularMovie(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}

class CarouselSection extends StatelessWidget {
  const CarouselSection({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading.value
        ? Container(
            height: 300.h,
            foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(begin: AlignmentDirectional.center, end: AlignmentDirectional.bottomCenter, colors: [
              Colors.transparent,
              Theme.of(context).scaffoldBackgroundColor,
            ], stops: const [
              0.0,
              0.8
            ])),
            child: const ShimmerLoading())
        : SizedBox(
            height: 300.h,
            child: Stack(
              children: [
                CarouselSlider.builder(
                  enableAutoSlider: true,
                  unlimitedMode: true,
                  controller: controller.sliderController,
                  slideTransform: StackTransform(),
                  slideIndicator: CircularSlideIndicator(
                      itemSpacing: 10,
                      padding: EdgeInsets.only(bottom: 20.h),
                      indicatorRadius: 3.r,
                      indicatorBackgroundColor: Theme.of(context).colorScheme.secondary,
                      currentIndicatorColor: Theme.of(context).colorScheme.primary),
                  itemCount: controller.nowPlayingResponse.value.results!.length - 10,
                  slideBuilder: (index) {
                    controller.selectedIndex.value = index;
                    return GestureDetector(
                      onTap: () => controller.navigateToMovieDetails(index),
                      child: Stack(
                        children: [
                          Container(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            foregroundDecoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: AlignmentDirectional.center,
                                    end: AlignmentDirectional.bottomCenter,
                                    colors: [Colors.transparent, Theme.of(context).scaffoldBackgroundColor],
                                    stops: const [0.0, 0.9])),
                            child: CachedNetworkImage(
                              imageUrl:
                                  '${Constants.posterUrl}${controller.nowPlayingResponse.value.results!.elementAt(index).backdropPath ?? controller.nowPlayingResponse.value.results!.elementAt(index).posterPath}',
                              fit: BoxFit.fitHeight,
                              width: double.maxFinite,
                              height: 300.h,
                              placeholder: (context, url) => SizedBox(
                                height: 300.h,
                                child: const ShimmerLoading(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 30,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        // Card(
                        //   elevation: 6,
                        //   color: Theme.of(context).colorScheme.secondary,
                        //   shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
                        //   child: Container(
                        //     padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 5),
                        //     //color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                        //     child: GradientText('coming_soon'.tr.toUpperCase(),style: Theme.of(context).textTheme.titleLarge!.copyWith(letterSpacing: 0.5)),
                        //   ),
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                                child: Text('adventure'.tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(decoration: TextDecoration.underline, letterSpacing: 1.5))),
                            Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: CircleAvatar(
                                  radius: 3.r,
                                )),
                            GestureDetector(
                                child: Text('family'.tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(decoration: TextDecoration.underline, letterSpacing: 1.5))),
                            Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: CircleAvatar(
                                  radius: 3.r,
                                )),
                            GestureDetector(
                                child: Text('fantasy'.tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(decoration: TextDecoration.underline, letterSpacing: 1.5))),
                          ],
                        ),
                        separationGap(),
                        PrimaryButton(
                          height: 20.h,
                          controller: controller,
                          text: 'more_info'.tr,
                          textStyle: Theme.of(context).textTheme.bodyLarge,
                          onTap: () => controller.navigateToMovieDetails(controller.selectedIndex.value),
                        )
                      ],
                    ),
                  ),
                ),

              ],
            )));
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
    return Obx(() => controller.isLoading.value
        ? SizedBox(
            height: 150.h,
            child: const TrendingLoader(),
          )
        : SizedBox(
            height: 150.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.nowPlayingResponse.value.results!.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => controller.navigateToMovieDetails(index),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  width: 90.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: CachedNetworkImage(
                            height: 115.h,
                            width: 90.w,
                            imageUrl:
                                '${Constants.posterUrl}${controller.nowPlayingResponse.value.results!.elementAt(index).posterPath!}',
                            placeholder: (context, url) => SizedBox(height: 115.h, width: 90.w, child: const ShimmerLoading()),
                            errorWidget: (context, url, error) => const Icon(Icons.error_outline),
                            imageBuilder: (context, imageProvider) => Image(image: imageProvider),
                            fit: BoxFit.fitWidth,
                          )),
                      Text(
                        controller.nowPlayingResponse.value.results!.elementAt(index).title!,
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ));
  }
}

class NowPlaying extends StatelessWidget {
  final HomeController controller;

  const NowPlaying({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading.value
        ? SizedBox(height: 130.h, child: const NowPlayingLoader())
        : SizedBox(
            height: 120.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.nowPlayingResponse.value.results!.length,
              itemBuilder: (context, index) => SizedBox(
                // color: Theme.of(context).scaffoldBackgroundColor,
                width: 150.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: CachedNetworkImage(
                            height: 75.h,
                            width: 150.w,
                            imageUrl:
                                '${Constants.posterUrl}${controller.nowPlayingResponse.value.results!.elementAt(index).backdropPath ?? controller.nowPlayingResponse.value.results!.elementAt(index).posterPath}',
                            placeholder: (context, url) => SizedBox(height: 75.h, width: 150.w, child: const ShimmerLoading()),
                            errorWidget: (context, url, error) => const Icon(Icons.error_outline),
                            imageBuilder: (context, imageProvider) => Image(image: imageProvider),
                            fit: BoxFit.cover,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.redAccent,
                                    size: 8.h,
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    controller.nowPlayingResponse.value.results!.elementAt(index).popularity!.toString(),
                                    style: Theme.of(context).textTheme.bodySmall,
                                    maxLines: 2,
                                    overflow: TextOverflow.fade,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star_half,
                                    color: Colors.amberAccent,
                                    size: 8.h,
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    controller.nowPlayingResponse.value.results!.elementAt(index).voteAverage!.toStringAsFixed(1),
                                    style: Theme.of(context).textTheme.bodySmall,
                                    overflow: TextOverflow.fade,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            controller.nowPlayingResponse.value.results!.elementAt(index).title!,
                            style: Theme.of(context).textTheme.bodyMedium,
                            maxLines: 2,
                            overflow: TextOverflow.fade,
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ));
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
          ? ListView.builder(
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
                          ),
                        ),
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
                            imageUrl: controller.popularResponse.value.results!.elementAt(index).backdropPath != null
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
class TopTvSeries extends StatelessWidget {
  const TopTvSeries({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Obx(() => controller.isLoading.value
          ? ListView.builder(
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
                    ),
                  ),
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
        itemCount: controller.topTvSeriesResponse.value.results!.length,
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
                      imageUrl: controller.topTvSeriesResponse.value.results!.elementAt(index).backdropPath != null
                          ? '${Constants.posterUrl}${controller.topTvSeriesResponse.value.results!.elementAt(index).backdropPath}'
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
                controller.topTvSeriesResponse.value.results!.elementAt(index).name!,
                style: Theme.of(context).textTheme.labelMedium,
                maxLines: 2,
                overflow: TextOverflow.fade,
              ),
              Text(
                '${'release_date'.tr} ${formatOnlyDate(controller.topTvSeriesResponse.value.results!.elementAt(index).firstAirDate!)}',
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
