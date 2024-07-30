import 'package:creative_login/Utils/Constants/app_color.dart';
import 'package:creative_login/Utils/Theme/package_theme.dart';
import 'package:flutter/material.dart';

class BuildMediumTitle extends StatelessWidget with PackageColor {
  BuildMediumTitle({
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
    }else{
      return Theme.of(context).textTheme.titleLarge?.copyWith(color: themeColor);
    }
  }
}
