import 'package:flutter/material.dart';

showDialogSlideFromBottom({
  required BuildContext context,
  required Widget page,
  bool closable = true,
}) async {
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
    transitionDuration: const Duration(milliseconds: 300),
    barrierLabel: closable ? '' : null,
    barrierDismissible: closable,
  );
}

showDialogScaleFromCenter({
  required BuildContext context,
  required Widget page,
  bool closable = true,
}) async {
  await showGeneralDialog(
    context: context,
    pageBuilder: (ctx, a1, a2) {
      return page;
    },
    transitionBuilder: (ctx, a1, a2, child) {
      var curve = Curves.easeInOut.transform(a1.value);
      return Transform.scale(
        scale: curve,
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 300),
    barrierLabel: closable ? '' : null,
    barrierDismissible: closable,
  );
}
