import 'package:flutter/material.dart';
import 'package:flutter_easy_barcode/core/config/theme/theme.dart';

class SwitchButton extends StatefulWidget {
  final String title;
  final ValueChanged<bool> onChanged;

  const SwitchButton({super.key, required this.title, required this.onChanged});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Transform.scale(
          scale: 0.7,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 40.0),
            child: Switch(
              value: _selected,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              activeColor: Theme.of(context).primary,
              onChanged: (bool value) {
                widget.onChanged(value);
                setState(() {
                  _selected = value;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
