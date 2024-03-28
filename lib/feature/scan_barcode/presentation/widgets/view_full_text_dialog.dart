import 'package:flutter/material.dart';
import 'package:flutter_easy_barcode/core/navigator.dart';

import '../../../../core/localization.dart';
import '../../../../core/ui_constants.dart';

viewFullTextDialog({
  required BuildContext context,
  required String text,
}) async {
  await showGeneralDialog(
    context: context,
    pageBuilder: (ctx, a1, a2) {
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
                  Strings.instance.appLocalization.close,
                ),
              ],
            ),
          ),
        ],
      );
    },
    transitionBuilder: (ctx, a1, a2, child) {
      var curve = Curves.easeInOut.transform(a1.value);
      return Transform.scale(
        scale: curve,
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 300),
    barrierLabel: '',
    barrierDismissible: true,
  );
}
