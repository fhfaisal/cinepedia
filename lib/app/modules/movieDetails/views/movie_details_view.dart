import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinepedia/app/utils/buttons/primary_button.dart';
import 'package:cinepedia/app/utils/imagePath/movieDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    return DefaultTabController(
        length: controller.myTabs.length,
        child: Scaffold(
          body: Obx(() => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: [
                    imageSection(context),
                    countingSection(context),
                    separationGap(),
                    ticketsSection(context),
                    TabBar(
                      controller: controller.tabController,
                      isScrollable: true,
                      unselectedLabelColor: Colors.green,
                      tabAlignment: TabAlignment.center,
                      tabs: controller.myTabs
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height,
                      child: TabBarView(
                        controller: controller.tabController,
                        children: [
                          Flexible(child: Placeholder()),
                          Icon(Icons.directions_transit, size: 350),
                          Icon(Icons.directions_transit, size: 350),
                          Icon(Icons.directions_transit, size: 350),
                        ],
                      ),
                    )
                  ],
                )),
        ));
  }

  SizedBox ticketsSection(BuildContext context) {
    return SizedBox(
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
        Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: AlignmentDirectional.center,
                  end: AlignmentDirectional.bottomCenter,
                  colors: [Colors.transparent, Theme.of(context).scaffoldBackgroundColor.withOpacity(0.93)],
                  stops: const [0.0, 0.9])),
          child: CachedNetworkImage(
            imageUrl: '${Constants.posterUrl}${controller.movieDetailsResponse.value.backdropPath}',
            fit: BoxFit.fitHeight,
            width: double.maxFinite,
            height: 300.h,
            placeholder: (context, url) => SizedBox(
              height: 300.h,
              child: const ShimmerLoading(),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
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
