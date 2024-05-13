import 'package:cinepedia/app/utils/widgets/loader/shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
class TrendingLoader extends StatelessWidget {
  const TrendingLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) => Container(
        width: 90.w,
        margin: const EdgeInsets.only(right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Theme.of(context).colorScheme.errorContainer,
              highlightColor: Theme.of(context).highlightColor,
              direction: ShimmerDirection.ltr,
              child: SizedBox(height: 115.h, width: 90.h, child: const ShimmerLoading())
            ),
            Shimmer.fromColors(
              baseColor: Theme.of(context).colorScheme.errorContainer,
              highlightColor: Theme.of(context).highlightColor,
              direction: ShimmerDirection.ltr,
              child: SizedBox(height: 25.h, width: 90.h, child: const ShimmerLoading())
            ),
          ],
        ),
      ),
    );
  }
}