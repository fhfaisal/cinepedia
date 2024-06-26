import 'package:flutter/material.dart';

import '../theme/colors.dart';

class GradientText extends StatelessWidget {
  const GradientText(this.text, {super.key, this.gradient, this.style, this.context});

  final String text;
  final TextStyle? style;
  final Gradient? gradient;
  final BuildContext? context;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => LinearGradient(colors: [
        Theme.of(context).colorScheme.onPrimary,Theme.of(context).colorScheme.onSecondary
      ]).createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
