import 'package:flutter/cupertino.dart';

import '../../Constants/app_color.dart';

class CustomInput extends StatelessWidget with PackageColor {
  CustomInput({
    super.key,
    this.placeholder,
    this.obscureText = false,
    this.suffix,
    this.controller,
    this.onSubmitted,
    required this.prefixIcon,
  });

  final String? placeholder;
  final bool obscureText;
  final IconData prefixIcon;
  final Widget? suffix;
  final TextEditingController? controller;
  final Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: CupertinoTextField(
        controller: controller,
        obscureText: obscureText,
        placeholder: placeholder,
        cursorColor: themeColor,
        onSubmitted: onSubmitted,
        placeholderStyle: TextStyle(
          fontSize: 14,
          color: themeColor.withOpacity(0.6),
        ),
        style: TextStyle(
            color: themeColor, fontWeight: FontWeight.w500, letterSpacing: 0.3),
        prefix: Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
              color: themeTile,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(7),
                bottomLeft: Radius.circular(7),
              )),
          child: Icon(
            prefixIcon,
            color: textColor,
          ),
        ),
        suffix: suffix,
        decoration: BoxDecoration(
          color: textColor,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
