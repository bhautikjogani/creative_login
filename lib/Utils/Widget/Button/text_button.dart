import 'package:creative_login/Utils/Constants/app_color.dart';
import 'package:flutter/cupertino.dart';

class BuildTextButton extends StatelessWidget with PackageColor {
  BuildTextButton({
    super.key,
    this.onPressed,
    required this.child,
    this.isProcessing = false,
    this.color,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final bool isProcessing;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      width: 140,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        color: color ?? themContrast,
        onPressed: onPressed,
        disabledColor: (color ?? themContrast).withAlpha(80),
        child: isProcessing
            ? CupertinoActivityIndicator(color: themeColor)
            : child,
      ),
    );
  }
}
