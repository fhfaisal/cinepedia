import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../../theme/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.controller,
    required this.text,
    required this.onTap,
    this.textStyle,
    this.height,
    this.width,
  });

  final controller;
  final String text;
  final Callback onTap;
  final double? height;
  final double? width;
  final TextStyle? textStyle;

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
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: const [0.1, 1],
                  colors: [Theme.of(context).colorScheme.onPrimary,Theme.of(context).colorScheme.onSecondary])),
          child: Text(text,
              textAlign: TextAlign.center,
              style: textStyle??Theme.of(context).textTheme.titleMedium
              ),
        ),
      ),
    );
  }
}