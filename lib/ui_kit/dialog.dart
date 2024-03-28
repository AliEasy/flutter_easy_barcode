import 'package:flutter/material.dart';

showDialogAnimatedAtBottom(
    {required BuildContext context,
    required Widget page,
    bool closable = true}) async {
  await showGeneralDialog(
    context: context,
    pageBuilder: (ctx, a1, a2) {
      return page;
    },
    transitionBuilder: (ctx, a1, a2, child) {
      return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(a1),
          child: child);
    },
    transitionDuration: const Duration(milliseconds: 500),
    barrierLabel: closable ? '' : null,
    barrierDismissible: closable,
  );
}
