import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinepedia/app/theme/colors.dart';
import 'package:cinepedia/app/utils/imagePath/movieDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/design_elements.dart';
import '../../../utils/widgets/loader/shimmer_loading.dart';
import '../controllers/movie_details_controller.dart';

class MovieDetailsView extends GetView<MovieDetailsController> {
  const MovieDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Obx(() => SafeArea(
              child: DefaultTabController(
                length: controller.myTabs.length,
                child: Scaffold(
                    //appBar: AppBar(backgroundColor: Colors.transparent,),
                    body: ListView(
                  children: [
                    imageSection(context),
                    countingSection(context),
                    separationGap(),
                    ticketsSection(context),
                    TabBar(
                        controller: controller.tabController,
                        isScrollable: true,
                        unselectedLabelColor: AppColor.textGray,
                        tabAlignment: TabAlignment.center,
                        tabs: controller.myTabs),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height / 1.8,
                      child: TabBarView(
                        controller: controller.tabController,
                        children: [
                          TabOverView(controller: controller),
                          TabDetails(controller: controller),
                          TabReviews(controller: controller),
                          TabSuggestions(controller: controller)
                        ],
                      ),
                    )
                  ],
                )),
              ),
            )));
  }

  Container ticketsSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 44.h,
      child: Row(
        children: [
          Expanded(
            child: Container(
                height: 44.h,
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: const [0.1, 1],
                        colors: [Theme.of(context).colorScheme.onPrimary, Theme.of(context).colorScheme.onSecondary])),
                child: Row(
                  children: [
                    Expanded(child: SvgPicture.asset(MovieDetailsImg.ticket)),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'see_showtime'.tr,
                            style:
                                Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.background),
                          ),
                          Text(
                            'and_tickets'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(color: Theme.of(context).colorScheme.background),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Icon(Icons.arrow_forward_ios_rounded, color: Theme.of(context).colorScheme.background),
                    ),
                  ],
                )),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
                height: 44.h,
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: const [0.1, 1],
                        colors: [Theme.of(context).colorScheme.background, Theme.of(context).colorScheme.background])),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(child: Icon(Icons.add)),
                    Expanded(
                        flex: 3,
                        child: Text(
                          'add_to_my_list'.tr,
                          style: Theme.of(context).textTheme.titleSmall,
                        )),
                    const Expanded(child: Icon(Icons.arrow_drop_down)),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Row countingSection(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Text(
                    controller.movieDetailsResponse.value.voteAverage!.toStringAsFixed(1),
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                ],
              ),
              Text(
                'vote_average'.tr,
                style: Theme.of(context).textTheme.labelSmall,
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star_border,
                    color: Colors.blueAccent,
                  ),
                  Text(
                    controller.movieDetailsResponse.value.voteCount.toString(),
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                ],
              ),
              Text(
                'vote_count'.tr,
                style: Theme.of(context).textTheme.labelSmall,
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.favorite_border,
                    color: Colors.redAccent,
                  ),
                  Text(
                    controller.movieDetailsResponse.value.popularity!.toStringAsFixed(0),
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                ],
              ),
              Text(
                'popularity'.tr,
                style: Theme.of(context).textTheme.labelSmall,
              )
            ],
          ),
        ),
      ],
    );
  }

  Stack imageSection(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 300.h,
          child: Obx(
            () => CarouselSlider.builder(
              enableAutoSlider: true,
              unlimitedMode: true,
              slideTransform: const ParallaxTransform(),
              itemCount: controller.imageResponse.value.backdrops!.length,
              slideBuilder: (index) {
                controller.selectedIndex.value = index;
                return Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: AlignmentDirectional.center,
                          end: AlignmentDirectional.bottomCenter,
                          colors: [Colors.transparent, Theme.of(context).scaffoldBackgroundColor],
                          stops: const [0.0, 0.9])),
                  child: CachedNetworkImage(
                    imageUrl: '${Constants.posterUrl}${controller.imageResponse.value.backdrops!.elementAt(index).filePath}',
                    fit: BoxFit.fitHeight,
                    width: double.maxFinite,
                    height: 300.h,
                    placeholder: (context, url) => SizedBox(
                      height: 300.h,
                      child: const ShimmerLoading(),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        // Container(
        //   color: Theme.of(context).scaffoldBackgroundColor,
        //   foregroundDecoration: BoxDecoration(
        //       gradient: LinearGradient(
        //           begin: AlignmentDirectional.center,
        //           end: AlignmentDirectional.bottomCenter,
        //           colors: [Colors.transparent, Theme.of(context).scaffoldBackgroundColor.withOpacity(0.93)],
        //           stops: const [0.0, 0.9])),
        //   child: CachedNetworkImage(
        //     imageUrl: '${Constants.posterUrl}${controller.movieDetailsResponse.value.backdropPath}',
        //     fit: BoxFit.fitHeight,
        //     width: double.maxFinite,
        //     height: 300.h,
        //     placeholder: (context, url) => SizedBox(
        //       height: 300.h,
        //       child: const ShimmerLoading(),
        //     ),
        //   ),
        // ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 20,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  controller.movieDetailsResponse.value.originalTitle!,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${'released'.tr} ${formatOnlyDate(controller.movieDetailsResponse.value.releaseDate)}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(' | ', style: Theme.of(context).textTheme.titleSmall),
                    Text('${'runtime'.tr} ${formatRuntime(controller.movieDetailsResponse.value.runtime!)}',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class TabSuggestions extends StatelessWidget {
  const TabSuggestions({super.key, required this.controller});

  final MovieDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          separationGap(),
          // Text('suggestions'.tr,style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold)),
          // Obx(() => controller.isLoading.value?const Center(child: CircularProgressIndicator())
          // :SizedBox(
          //   height: 130.h,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: controller.similarResponse.value.results!.length,
          //     itemBuilder: (context, index) => GestureDetector(
          //       onTap: () => controller.navigateToMovieDetails(index),
          //       child: SizedBox(
          //         // color: Theme.of(context).scaffoldBackgroundColor,
          //         width: 150.w,
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: ClipRRect(
          //                   borderRadius: BorderRadius.circular(5),
          //                   child: CachedNetworkImage(
          //                     height: 75.h,
          //                     width: 150.w,
          //                     imageUrl:
          //                     '${Constants.posterUrl}${controller.similarResponse.value.results!.elementAt(index).backdropPath??controller.similarResponse.value.results!.elementAt(index).posterPath}',
          //                     placeholder: (context, url) => SizedBox(height: 75.h, width: 150.w, child: const ShimmerLoading()),
          //                     errorWidget: (context, url, error) => const Icon(Icons.error_outline),
          //                     imageBuilder: (context, imageProvider) => Image(image: imageProvider),
          //                     fit: BoxFit.cover,
          //                   )),
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Row(
          //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                     children: [
          //                       Row(
          //                         children: [
          //                           Icon(
          //                             Icons.favorite,
          //                             color: Colors.redAccent,
          //                             size: 8.h,
          //                           ),
          //                           SizedBox(width: 2.w),
          //                           Text(
          //                             controller.similarResponse.value.results!.elementAt(index).popularity.toString(),
          //                             style: Theme.of(context).textTheme.bodySmall,
          //                             maxLines: 2,
          //                             overflow: TextOverflow.fade,
          //                           ),
          //                         ],
          //                       ),
          //                       Row(
          //                         children: [
          //                           Icon(
          //                             Icons.star_half,
          //                             color: Colors.amberAccent,
          //                             size: 8.h,
          //                           ),
          //                           SizedBox(
          //                             width: 2.w,
          //                           ),
          //                           Text(
          //                             controller.similarResponse.value.results!.elementAt(index).voteAverage!.toStringAsFixed(1)??'',
          //                             style: Theme.of(context).textTheme.bodySmall,
          //                             overflow: TextOverflow.fade,
          //                           ),
          //                         ],
          //                       ),
          //                     ],
          //                   ),
          //                   Text(
          //                     controller.similarResponse.value.results!.elementAt(index).title!??'',
          //                     style: Theme.of(context).textTheme.bodyMedium,
          //                     maxLines: 2,
          //                     overflow: TextOverflow.fade,
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // )),
          Text('recommendations'.tr, style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold)),
          Obx(() => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : SizedBox(
                  height: 150.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.recommendationsResponse.value.results!.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        //print(controller.recommendationsResponse.value.results!.elementAt(index).id);
                        //controller.movieId = controller.recommendationsResponse.value.results!.elementAt(index).id!;
                        //controller.fetchAllData();
                        controller.reloadPage(controller.recommendationsResponse.value.results!.elementAt(index).id);
                      },
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
                                      '${Constants.posterUrl}${controller.recommendationsResponse.value.results!.elementAt(index).posterPath}',
                                  placeholder: (context, url) =>
                                      SizedBox(height: 115.h, width: 90.w, child: const ShimmerLoading()),
                                  errorWidget: (context, url, error) => const Icon(Icons.error_outline),
                                  imageBuilder: (context, imageProvider) => Image(image: imageProvider),
                                  fit: BoxFit.fitWidth,
                                )),
                            Text(
                              controller.recommendationsResponse.value.results!.elementAt(index).title!,
                              style: Theme.of(context).textTheme.bodyMedium,
                              maxLines: 2,
                              overflow: TextOverflow.fade,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ))
        ],
      ),
    );
  }
}

class TabReviews extends StatelessWidget {
  const TabReviews({super.key, required this.controller});

  final MovieDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('reviews'.tr, style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold)),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, stops: const [
                    0.1,
                    1
                  ], colors: [
                    Theme.of(context).colorScheme.onPrimary.withOpacity(1),
                    Theme.of(context).colorScheme.onSecondary.withOpacity(1)
                  ])),
              child: Text('top_review'.tr, style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold))),
          separationGap(),
          Expanded(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: ListView.separated(
                itemCount: controller.reviewsResponse.value.results!.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Get.bottomSheet(
                        isScrollControlled: true,
                        SingleChildScrollView(
                            child: Container(
                          color: Theme.of(context).colorScheme.background,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          child: Obx(
                            () => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 8.0),
                                          child: CircleAvatar(
                                            radius: 15,
                                            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                            backgroundImage: CachedNetworkImageProvider(
                                                '${Constants.posterUrl}${controller.reviewsResponse.value.results!.elementAt(index).authorDetails!.avatarPath}'),
                                            child: controller.reviewsResponse.value.results!
                                                        .elementAt(index)
                                                        .authorDetails!
                                                        .avatarPath !=
                                                    null
                                                ? const SizedBox()
                                                : const Icon(Icons.error),
                                          ),
                                        ),
                                        Text(
                                          controller.reviewsResponse.value.results!.elementAt(index).author.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium!
                                              .copyWith(color: Theme.of(context).colorScheme.primary),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                                          child: CircleAvatar(
                                            radius: 2,
                                            backgroundColor: AppColor.white,
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(right: 3.0),
                                          child: Icon(Icons.star, size: 15, color: Colors.yellow),
                                        ),
                                        Text(
                                          controller.reviewsResponse.value.results!.elementAt(index).authorDetails!.rating != null
                                              ? controller.reviewsResponse.value.results!
                                                  .elementAt(index)
                                                  .authorDetails!
                                                  .rating!
                                                  .toStringAsFixed(1)
                                              : "Not Rated",
                                          style: Theme.of(context).textTheme.labelMedium,
                                          overflow: TextOverflow.fade,
                                        ),
                                      ],
                                    ),
                                    separationGap(),
                                    Text(
                                      formatOnlyDate(controller.reviewsResponse.value.results!.elementAt(index).createdAt!),
                                      style: Theme.of(context).textTheme.labelMedium,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      controller.reviewsResponse.value.results!.elementAt(index).content!,
                                      style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColor.textGray),
                                      textAlign: TextAlign.justify,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )));
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.errorContainer, borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                  backgroundImage: CachedNetworkImageProvider(
                                      '${Constants.posterUrl}${controller.reviewsResponse.value.results!.elementAt(index).authorDetails!.avatarPath}'),
                                  child:
                                      controller.reviewsResponse.value.results!.elementAt(index).authorDetails!.avatarPath != null
                                          ? const SizedBox()
                                          : const Icon(Icons.error),
                                ),
                              ),
                              Text(
                                controller.reviewsResponse.value.results!.elementAt(index).author.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(color: Theme.of(context).colorScheme.primary),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: CircleAvatar(
                                  radius: 2,
                                  backgroundColor: AppColor.white,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 3.0),
                                child: Icon(Icons.star, size: 15, color: Colors.yellow),
                              ),
                              Text(
                                controller.reviewsResponse.value.results!.elementAt(index).authorDetails!.rating != null
                                    ? controller.reviewsResponse.value.results!
                                        .elementAt(index)
                                        .authorDetails!
                                        .rating!
                                        .toStringAsFixed(1)
                                    : "Not Rated",
                                style: Theme.of(context).textTheme.labelMedium,
                                overflow: TextOverflow.fade,
                              ),
                            ],
                          ),
                          separationGap(),
                          Column(
                            children: [
                              Text(
                                controller.reviewsResponse.value.results!.elementAt(index).content!,
                                style: Theme.of(context).textTheme.labelSmall!.copyWith(color: AppColor.textGray),
                                maxLines: 5,
                              )
                            ],
                          )
                        ],
                      )),
                ),
              ),
            ),
          ),
          Container(
              height: 44.h,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: const [0.1, 1],
                      colors: [Theme.of(context).colorScheme.primary, Theme.of(context).colorScheme.onSecondary])),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(child: Icon(Icons.add)),
                  Expanded(
                      flex: 3,
                      child: Text(
                        'add_to_my_review'.tr,
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.center,
                      )),
                  const Expanded(child: Icon(Icons.arrow_drop_down)),
                ],
              )),
        ],
      ),
    );
  }
}

class TabDetails extends StatelessWidget {
  const TabDetails({
    super.key,
    required this.controller,
  });

  final MovieDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('storyline'.tr, style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold)),
          Text(
            controller.movieDetailsResponse.value.overview!,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColor.textGray),
            textAlign: TextAlign.justify,
          ),
          separationGap(),
          Text('images'.tr, style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: controller.imageResponse.value.backdrops!.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CachedNetworkImage(
                      height: 75.h,
                      width: 150.w,
                      imageUrl: '${Constants.posterUrl}${controller.imageResponse.value.backdrops!.elementAt(index).filePath}',
                      placeholder: (context, url) => SizedBox(height: 75.h, width: 150.w, child: const ShimmerLoading()),
                      errorWidget: (context, url, error) => const Icon(Icons.error_outline),
                      imageBuilder: (context, imageProvider) => Image(image: imageProvider),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TabOverView extends StatelessWidget {
  const TabOverView({
    super.key,
    required this.controller,
  });

  final MovieDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('overview'.tr, style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold)),
          Flexible(
            child: Text(
              controller.movieDetailsResponse.value.overview??'NO DATA FOUND',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColor.textGray),
              textAlign: TextAlign.justify,
            ),
          ),
          separationGap(),
          Row(
            children: List.generate(
                controller.movieDetailsResponse.value.genres!.length,
                (index) => Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: CircleAvatar(
                              radius: 3.r,
                            )),
                        Text(
                          controller.movieDetailsResponse.value.genres!.elementAt(index).name!,
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColor.textGray, letterSpacing: 1),
                        ),
                        index == controller.movieDetailsResponse.value.genres!.length - 1
                            ? Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: CircleAvatar(
                                  radius: 3.r,
                                ))
                            : const SizedBox(),
                      ],
                    )),
          ),
          separationGap(),
          Text('cast'.tr, style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold)),
          Flexible(
            child: Obx(() => controller.isLoadingCredits.value
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.creditsResponse.value.cast!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => controller.navigationToActorDetails(controller.creditsResponse.value.cast!.elementAt(index).id),
                    child: SizedBox(
                      width: 90.w,
                      //padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30.r,
                            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                            backgroundImage: controller.creditsResponse.value.cast!.elementAt(index).profilePath != null
                                ? CachedNetworkImageProvider(
                                    '${Constants.posterUrl}${controller.creditsResponse.value.cast!.elementAt(index).profilePath}')
                                : const CachedNetworkImageProvider(''),
                            child: controller.creditsResponse.value.cast!.elementAt(index).profilePath != null
                                ? const SizedBox()
                                : const Icon(
                                    Icons.error,
                                    size: 50,
                                  ),
                          ),
                          Text(
                            controller.creditsResponse.value.cast!.elementAt(index).character!,
                            style: Theme.of(context).textTheme.labelMedium,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                          ),
                          Text(controller.creditsResponse.value.cast!.elementAt(index).originalName!,
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColor.textGray)),
                        ],
                      ),
                    ),
                  ),
                )),
          ),
          Text('crew'.tr, style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold)),
          Flexible(
            child: Obx(() => controller.isLoadingCredits.value
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.creditsResponse.value.crew!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => controller.navigationToActorDetails(controller.creditsResponse.value.crew!.elementAt(index).id),
                    child: SizedBox(
                      width: 90.w,
                      //padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30.r,
                            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                            backgroundImage: controller.creditsResponse.value.crew!.elementAt(index).profilePath != null
                                ? CachedNetworkImageProvider(
                                    '${Constants.posterUrl}${controller.creditsResponse.value.crew!.elementAt(index).profilePath}')
                                : const CachedNetworkImageProvider(''),
                            child: controller.creditsResponse.value.crew!.elementAt(index).profilePath != null
                                ? const SizedBox()
                                : const Icon(
                                    Icons.error,
                                    size: 50,
                                  ),
                          ),
                          Text(
                            controller.creditsResponse.value.crew!.elementAt(index).name??'NOT MENTIONED',
                            style: Theme.of(context).textTheme.labelMedium,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                          ),
                          Text(controller.creditsResponse.value.crew!.elementAt(index).department??'',
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColor.textGray)),
                        ],
                      ),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
