import 'package:cinepedia/app/utils/widgets/loader/shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
class NowPlayingLoader extends StatelessWidget {
  const NowPlayingLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) => Container(
        width: 150.h,
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
                    height: 75.h,
                    child: Shimmer.fromColors(
                      baseColor: Theme.of(context).colorScheme.errorContainer,
                      highlightColor: Theme.of(context).highlightColor,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Shimmer.fromColors(
                    baseColor: Theme.of(context).colorScheme.errorContainer,
                    highlightColor: Theme.of(context).highlightColor,
                    direction: ShimmerDirection.ltr,
                    child: SizedBox(height: 15.h,width: 60.w,child: const ShimmerLoading(),)
                ),
                Shimmer.fromColors(
                    baseColor: Theme.of(context).colorScheme.errorContainer,
                    highlightColor: Theme.of(context).highlightColor,
                    direction: ShimmerDirection.ltr,
                    child: SizedBox(height: 15.h,width: 60.w,child: const ShimmerLoading(),)
                ),
              ],
            ),
            Shimmer.fromColors(
              baseColor: Theme.of(context).colorScheme.errorContainer,
              highlightColor: Theme.of(context).highlightColor,
              direction: ShimmerDirection.ltr,
              child: SizedBox(height: 20.h,child: const ShimmerLoading(),)
            ),

          ],
        ),
      ),
    );
  }
}