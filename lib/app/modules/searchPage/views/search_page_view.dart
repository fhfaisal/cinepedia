import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinepedia/app/theme/colors.dart';
import 'package:cinepedia/app/utils/buttons/primary_button.dart';
import 'package:cinepedia/app/utils/design_elements.dart';
import 'package:cinepedia/app/utils/imagePath/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/widgets/loader/shimmer_loading.dart';
import '../controllers/search_page_controller.dart';

class SearchPageView extends GetView<SearchPageController> {
  const SearchPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        margin: fixMargin(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Explore'.tr, style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                height: 47.h,
                child: SearchBar(
                  //controller: controller.searchController.value,
                  //onChanged: (value) => controller.doctorSearchList(),
                  leading: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SvgPicture.asset(
                        CommonImage.searchIcon,
                        width: 22,
                      )),
                  hintText: 'Search movies'.tr,
                  hintStyle: MaterialStateProperty.all(const TextStyle(color: AppColor.textGray, fontWeight: FontWeight.bold)),
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(color: AppColor.primaryDark, fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xff4B4B4B),
                  ),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)), side: BorderSide(color: Color(0xff4B4B4B)))),
                  elevation: const MaterialStatePropertyAll(1),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.separated(
              itemCount: 10,
              separatorBuilder: (context, index) => separationGap(),
              itemBuilder: (context, index) => Container(
                height: 150,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: '${Constants.posterUrl}${'/6lyXW6GC7ruwDmhvEcRd9d46ZO7.jpg'}',
                          fit: BoxFit.fitHeight,
                          width: double.maxFinite,
                          height: double.maxFinite,
                          placeholder: (context, url) => SizedBox(
                            height: 150.h,
                            child: const ShimmerLoading(),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 6,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                Expanded(
                                    child: Text('Watch Again On Disney+ Watch Again On Disney+',style: Theme.of(context).textTheme.titleSmall,)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      Text(
                                        '0.0',
                                        style: Theme.of(context).textTheme.titleSmall,
                                      )
                                    ],
                                  ),
                              ],),
                              Text('Watch | Again | On ',style: Theme.of(context).textTheme.labelMedium,),
                              const Spacer(),
                              Text("When a new toy called joins Woody and the gang, a road trip alongside old and new friends reveals how big the world can be.",
                                style: Theme.of(context).textTheme.labelSmall!.copyWith(color: AppColor.textGray),
                                textAlign: TextAlign.justify,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,

                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                height: 25,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        stops: const [0.1, 1],
                                        colors: [Theme.of(context).colorScheme.onPrimary,Theme.of(context).colorScheme.onSecondary])),
                                child:Text('Tap To See Details',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.labelMedium
                                ),
                              ),

                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ))
          ],
        ),
      )),
    );
  }
}
