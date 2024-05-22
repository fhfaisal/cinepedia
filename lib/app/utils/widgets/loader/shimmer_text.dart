import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerText extends StatelessWidget {
  const ShimmerText({
    super.key,
    this.text,
    this.baseColor,
    this.highlightColor,
    this.direction,
  });
  final Color? baseColor,highlightColor;
  final String? text;
  final ShimmerDirection? direction;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(0),
      child: Shimmer.fromColors(
        baseColor: baseColor??Theme.of(context).colorScheme.errorContainer,
        highlightColor: highlightColor??Theme.of(context).highlightColor,
        direction: direction??ShimmerDirection.ltr,
        child: Center(
          child: Text(
            text??'Not found',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),);
  }
}