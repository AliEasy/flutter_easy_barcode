import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String? labelText;
  final bool? enabled;
  final TextEditingController? controller;
  final bool autoFocus;
  final String? hintText;
  final ValueChanged<String>? listener;

  const TextFormFieldWidget({
    super.key,
    this.labelText,
    this.enabled,
    this.controller,
    this.autoFocus = false,
    this.hintText,
    this.listener,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: listener,
      controller: controller,
      enabled: enabled,
      autofocus: autoFocus,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}
