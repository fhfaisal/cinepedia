import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../../theme/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.controller,
    required this.text,
    required this.onTap,
    this.height,
    this.width,
  });

  final controller;
  final String text;
  final Callback onTap;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.transparent,
        elevation: 4,
        child: Container(
          height: height ?? MediaQuery.of(context).size.height / 18,
          width: width?? MediaQuery.of(context).size.width / 3,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.1, 1],
                  colors: [AppColor.linear1, AppColor.linear2])),
          child: Text(text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.white,
                // shadows: <Shadow>[
                //   Shadow(
                //     offset: Offset(0.0, 1.7),
                //     blurRadius: 1.0,
                //     color: Colors.black54,
                //   ),
                // ],
              )),
        ),
      ),
    );
  }
}