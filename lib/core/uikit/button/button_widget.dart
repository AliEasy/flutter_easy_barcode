import 'package:flutter/material.dart';

import '../../ui_constants.dart';

enum ButtonWidgetType {
  filled,
  text,
  outlined,
  dialog;
}

class ButtonWidget extends StatelessWidget {
  final ButtonWidgetType buttonType;
  final VoidCallback? onTap;
  final String? title;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final BorderRadius? borderRadius;

  const ButtonWidget({
    super.key,
    required this.buttonType,
    this.onTap,
    this.title,
    this.backgroundColor = Colors.transparent,
    this.textStyle,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    if (buttonType == ButtonWidgetType.dialog) {
      return TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: backgroundColor,
          elevation: 0,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ??
                BorderRadius.all(
                  Radius.circular(
                    buttonCorners,
                  ),
                ),
          ),
        ),
        clipBehavior: Clip.hardEdge,
        onPressed: onTap?.call,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title ?? '',
              style: textStyle,
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
