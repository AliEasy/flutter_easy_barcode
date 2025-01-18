import 'package:flutter/material.dart';
import 'package:flutter_easy_barcode/core/navigator.dart';
import 'package:flutter_easy_barcode/generated/l10n.dart';

import '../../../../core/ui_constants.dart';

class ViewFullTextDialog extends StatelessWidget {
  final String text;
  const ViewFullTextDialog({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      alignment: Alignment.center,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(dialogCorners),
        ),
      ),
      contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
      children: [
        SingleChildScrollView(
          child: SizedBox(
            height: 150,
            child: SelectableText(
              text,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            popPage(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.current.close,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
