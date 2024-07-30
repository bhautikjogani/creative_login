import 'package:flutter/material.dart';

import '../../Constants/app_color.dart';

class CustomSnackBar with PackageColor {
  final BuildContext context;
  final String? title;
  final String? message;
  final Color? backgroundColor;

  CustomSnackBar(this.context,
      {this.title, this.message, this.backgroundColor}) {
    _show(context, title, message, backgroundColor);
  }

  void _show(BuildContext context, String? title, String? message,
      Color? backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: backgroundColor,
          showCloseIcon: true,
          closeIconColor: themeColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (title != null) Text(title),
              if (message != null) Text(message),
            ],
          )),
    );
  }
}
