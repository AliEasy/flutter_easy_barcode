import 'package:flutter/material.dart';
import 'package:flutter_easy_barcode/core/config/theme/theme.dart';

enum ButtonWidgetType {
  dialog,
  filled,
  text,
  outlined;
}

class ButtonWidget extends StatelessWidget {
  final ButtonWidgetType buttonType;
  final VoidCallback? onTap;
  final String? title;

  const ButtonWidget({super.key, required this.buttonType, this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap?.call,
      child: Row(
        children: [
          Text(
            title ?? '',
          ),
        ],
      ),
    );
  }
}
