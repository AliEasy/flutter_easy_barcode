import 'package:flutter/material.dart';
import 'package:flutter_easy_barcode/core/uikit/icon_button/icon_button_widget.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String? labelText;
  final bool? enabled;
  final TextEditingController? controller;
  final bool autoFocus;
  final String? hintText;
  final ValueChanged<String>? listener;
  final bool showClearButton;
  final Widget? suffixWidget;

  const TextFormFieldWidget({
    super.key,
    this.labelText,
    this.enabled,
    this.controller,
    this.autoFocus = false,
    this.hintText,
    this.listener,
    this.showClearButton = false,
    this.suffixWidget,
  });

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  late TextEditingController _controller;
  bool _showClearIcon = false;

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
    if (widget.showClearButton) {
      _controller.addListener(
        () {
          widget.listener?.call(_controller.text);
          if (_controller.text.isNotEmpty) {
            setState(() {
              _showClearIcon = true;
            });
          } else {
            setState(() {
              _showClearIcon = false;
            });
          }
        },
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      enabled: widget.enabled,
      autofocus: widget.autoFocus,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.suffixWidget != null) widget.suffixWidget!,
            if (_showClearIcon)
              IconButtonWidget(
                onTap: () {
                  _controller.clear();
                },
                icon: Icons.clear_rounded,
              )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }
}
