import 'package:flutter/material.dart';

import '../Constants/app_color.dart';
import '../Theme/package_theme.dart';

class BuildSmallTitle extends StatelessWidget with PackageColor {
  BuildSmallTitle({
    super.key,
    required this.text,
    this.color,
  });

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Text(
        text,
        style: style(context),
      ),
    );
  }

  TextStyle? style(BuildContext context) {
    if (packageTheme != null) {
      return packageTheme?.data.textTheme.titleLarge
          ?.copyWith(color: color ?? textColor);
    } else {
      return Theme.of(context)
          .textTheme
          .titleSmall
          ?.copyWith(color: color ?? textColor);
    }
  }
}
