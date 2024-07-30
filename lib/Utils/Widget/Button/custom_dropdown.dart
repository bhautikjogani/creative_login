import 'package:creative_login/Model/branch.dart';
import 'package:creative_login/Utils/Constants/app_color.dart';
import 'package:flutter/cupertino.dart';

import '../../Text-Builder/small_title.dart';

class CustomDropDown extends StatelessWidget with PackageColor {
  CustomDropDown(
      {super.key,
      required this.branch,
      required this.onChanged,
      required this.value,
      this.hint});

  final List<Branch> branch;
  final ValueChanged<Branch> onChanged;
  final String? value;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    bool isOpen = false;

    Widget leading([int? index, bool isLast = false]) => Container(
          width: 46,
          height: 46,
          alignment: Alignment.center,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: themeTile,
              borderRadius: borderRadius(
                isOpen: isOpen,
                isLeading: true,
              ),
              border: border(isOpen: isOpen, color: textColor, isLast: isLast)),
          child: index != null
              ? BuildSmallTitle(text: '${index + 1}')
              : Icon(
                  CupertinoIcons.arrow_branch,
                  color: textColor,
                ),
        );

    return StatefulBuilder(
      builder: (context, setState) => Column(
        children: [
          _dropDownItem(
            title: value ?? hint ?? '',
            color: value != null ? themeColor : themeColor.withOpacity(0.6),
            leading: leading(),
            border: border(isOpen: isOpen),
            borderRadius: borderRadius(isOpen: isOpen),
            leadingBorder: borderRadius(
              isOpen: isOpen,
              isLeading: true,
            ),
            icon: isOpen
                ? CupertinoIcons.chevron_up
                : CupertinoIcons.chevron_down,
            onTap: () => setState(() => isOpen = !isOpen),
          ),
          Visibility(
            visible: isOpen,
            child: Container(
              constraints: const BoxConstraints(maxHeight: 182),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: textColor,
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(7))),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: branch.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => _dropDownItem(
                  title: branch[index].name,
                  color: themeColor,
                  leading: leading(index, branch.last == branch[index]),
                  border: border(
                      isOpen: isOpen, isLast: branch.last == branch[index]),
                  borderRadius: borderRadius(isOpen: isOpen, index: index),
                  leadingBorder: borderRadius(isOpen: isOpen, index: index),
                  onTap: () => setState(() {
                    isOpen = !isOpen;
                    onChanged(branch[index]);
                  }),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _dropDownItem(
      {required String title,
      required Widget leading,
      void Function()? onTap,
      BorderRadiusGeometry? borderRadius,
      BorderRadiusGeometry? leadingBorder,
      BoxBorder? border,
      Color? color,
      IconData? icon}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 46,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: textColor, borderRadius: borderRadius),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: themeTile,
                  borderRadius: leadingBorder,
                  border: border),
              child: leading,
            ),
            const SizedBox(width: 7),
            Expanded(
              child: Container(
                height: 46,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(border: border),
                child: Row(
                  children: [
                    Expanded(
                      child: BuildSmallTitle(
                        text: title,
                        color: color ?? themeColor,
                      ),
                    ),
                    const SizedBox(width: 7),
                    if (icon != null) Icon(icon, color: themeColor),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 7),
          ],
        ),
      ),
    );
  }

  BorderRadiusGeometry? borderRadius(
      {int? index, bool isOpen = false, bool isLeading = false}) {
    if (!isOpen) {
      if (isLeading) {
        return const BorderRadius.horizontal(left: Radius.circular(8));
      }
      return BorderRadius.circular(8);
    }
    if (isOpen) {
      if (index == null) {
        if (isLeading) {
          return const BorderRadius.only(topLeft: Radius.circular(8));
        } else {
          return const BorderRadius.vertical(top: Radius.circular(8));
        }
      }
      return null;
    }
    return null;
  }

  BoxBorder? border(
      {int? index, bool isOpen = false, bool isLast = false, Color? color}) {
    if (isOpen && !isLast) {
      return Border(bottom: BorderSide(color: color ?? themeColor));
    }
    return null;
  }
}
