import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.errorContainer,
      highlightColor: Theme.of(context).highlightColor,
      direction: ShimmerDirection.ltr,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0),
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
        ),),
    );
  }
}