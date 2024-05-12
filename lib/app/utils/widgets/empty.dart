import 'package:cinepedia/app/utils/imagePath/common.dart';
import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({
    super.key,
    required this.title,
    required this.subtitle,
    this.buttonText,
    this.onTap,
    this.isButton=false,
  });

  final String? title;
  final String? subtitle;
  final String? buttonText;
  final VoidCallback? onTap;
  final bool? isButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 23),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(CommonImage.emptyPage),
              height: 200,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '$title',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '$subtitle',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: onTap,
              child: isButton!?Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Theme.of(context).colorScheme.primary),
                child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '$buttonText',
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.center,),
                    )),
              ):const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
