import 'package:flutter/material.dart';

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
