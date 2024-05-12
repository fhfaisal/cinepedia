import 'package:flutter/material.dart';
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
                    height: 220,
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
            const SizedBox(height: 8),
            Shimmer.fromColors(
              baseColor: Theme.of(context).colorScheme.errorContainer,
              highlightColor: Theme.of(context).highlightColor,
              direction: ShimmerDirection.ltr,
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
    );
  }
}