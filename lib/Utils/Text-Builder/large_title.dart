import 'package:flutter/material.dart';

import '../Constants/app_color.dart';
import '../Theme/package_theme.dart';

class BuildLargeTitle extends StatelessWidget with PackageColor {
  BuildLargeTitle({
    super.key,
    required this.text,
  });

  final String text;

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
          ?.copyWith(color: textColor);
    } else {
      return Theme.of(context)
          .textTheme
          .headlineMedium
          ?.copyWith(color: textColor);
    }
  }
}
