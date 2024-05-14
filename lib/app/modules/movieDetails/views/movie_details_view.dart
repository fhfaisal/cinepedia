import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/design_elements.dart';
import '../../../utils/widgets/loader/shimmer_loading.dart';
import '../controllers/movie_details_controller.dart';

class MovieDetailsView extends GetView<MovieDetailsController> {
  const MovieDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MovieDetailsView'),
          centerTitle: true,
        ),
        body: Obx(() => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
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
                    imageUrl:
                    '${Constants.posterUrl}${controller.movieDetailsResponse.value.backdropPath}',
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
                  bottom: 30,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(controller.movieDetailsResponse.value.originalTitle!,style: Theme.of(context).textTheme.titleSmall,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${'released'.tr} ${formatOnlyDate(controller.movieDetailsResponse.value.releaseDate)}',style: Theme.of(context).textTheme.labelLarge,),
                          Text(' | ',style: Theme.of(context).textTheme.headlineSmall),
                          Text('${'runtime'.tr} ${formatRuntime(controller.movieDetailsResponse.value.runtime!)}',style: Theme.of(context).textTheme.titleSmall,),
                        ],
                      ),
                    ],
                                    ),
                  ),)
              ],
            )));
  }
}
