import 'package:animated_read_more_text/animated_read_more_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinepedia/app/utils/design_elements.dart';
import 'package:cinepedia/app/utils/imagePath/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../theme/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/widgets/loader/shimmer_loading.dart';
import '../../../utils/widgets/loader/shimmer_text.dart';
import '../controllers/actor_details_controller.dart';

class ActorDetailsView extends GetView<ActorDetailsController> {
  const ActorDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
            body: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 2.5,
              child: Stack(
                children: [
                  Obx(() => Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    foregroundDecoration: BoxDecoration(
                        gradient: RadialGradient(
                          colors: [Colors.transparent, Theme.of(context).scaffoldBackgroundColor],
                          stops: const [0.5, 1],
                        )),
                    child:controller.peopleResponse.value.profilePath==null?
                    const ShimmerText(): CachedNetworkImage(
                      imageUrl: '${Constants.posterUrl}${controller.peopleResponse.value.profilePath}',
                      fit: BoxFit.cover,
                      width: double.maxFinite,
                      placeholder: (context, url) => const SizedBox(
                        height: double.maxFinite,
                        child: ShimmerLoading(),
                      ),
                    ),
                  )),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                      color: Colors.black.withOpacity(0.3),
                      child: Obx(() => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(controller.peopleResponse.value.name??'',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontWeight: FontWeight.w900, fontStyle: FontStyle.italic)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: CircleAvatar(
                                    radius: 3.r,
                                  )),
                              Text(
                                controller.peopleResponse.value.knownForDepartment??'',
                                style:
                                Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColor.textGray, letterSpacing: 1),
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: CircleAvatar(
                                    radius: 3.r,
                                  )),
                            ],
                          ),
                          separationGap(),
                        ],
                      )),
                    ),
                  )
                ],
              ),
            ),
            Obx(() =>controller.isLoading.value? const SizedBox()
                :Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Gender'.tr,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            controller.peopleResponse.value.gender==2? const Icon(
                              Icons.male,
                              color: Colors.blueAccent,
                            ):const Icon(
                              Icons.female,
                              color: Colors.pink,
                            ),
                            Text(
                              controller.peopleResponse.value.gender==2?'Male':'Female',
                              style: Theme.of(context).textTheme.titleSmall,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'popularity'.tr,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.favorite_border,
                              color: Colors.redAccent,
                            ),
                            Text(
                              controller.peopleResponse.value.popularity.toString(),
                              style: Theme.of(context).textTheme.titleSmall,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),),
            separationGap(),
            const TabBar(
                //controller: controller.tabController,
                isScrollable: true,
                unselectedLabelColor: AppColor.textGray,
                tabAlignment: TabAlignment.start,
                tabs: [
                  Text('Overview'),
                  Text('Gallery'),
                  Text('Related Items'),
                ]),
            Expanded(
              child: TabBarView(children: [
                TabOverView(controller: controller),
                const Center(
                  child: Text('Gallery'),
                ),
                const Center(
                  child: Text('Related Items'),
                ),
              ]),
            )
          ],
        )),
      ),
    );
  }
}

class TabOverView extends StatelessWidget {
  const TabOverView({
    super.key,required this.controller
  });
final ActorDetailsController controller;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Obx(() => controller.isLoading.value?
            const Center(child: CircularProgressIndicator(),)
        :Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('overview'.tr, style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold)),
            // AnimatedReadMoreText(
            //   controller.peopleResponse.value.biography!,
            //   textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColor.textGray),
            //   expandOnTextTap: true,
            //   readLessText: '<<',
            //   readMoreText: '>>',
            //   buttonTextStyle: const TextStyle(color: AppColor.primaryDark,fontSize: 16,fontWeight: FontWeight.bold),
            //   maxLines: 3,
            // ),
            Text(controller.peopleResponse.value.biography??'No data found',style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColor.textGray),textAlign: TextAlign.justify,),
            Text('Born'.tr, style: Theme.of(context).textTheme.titleMedium!),
            Text('${formatDate(controller.peopleResponse.value.birthday)??'No data found'}',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColor.textGray),
              textAlign: TextAlign.justify,
            ),
            Text(controller.peopleResponse.value.placeOfBirth??'No data found',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColor.textGray),
              textAlign: TextAlign.justify,
            ),
            Text('Awards'.tr, style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('--',style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 5),
                    Text('Wins',style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColor.textGray)),
                    const SizedBox(width: 5),
                    SvgPicture.asset(CommonImage.wins),
                  ],
                ),
                const SizedBox(width: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('--',style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 5),
                    Text('Nominations',style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColor.textGray)),
                    const SizedBox(width: 5),
                    SvgPicture.asset(CommonImage.nominations),
                  ],
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
