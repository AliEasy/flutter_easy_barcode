import 'package:flutter/material.dart';
import 'package:flutter_easy_barcode/core/config/theme/theme.dart';
import 'package:flutter_easy_barcode/generated/l10n.dart';

import '../../../common/util/permission_handler.dart';
import '../../button/button_widget.dart';
import '../dialog.dart';

showCameraPermissionRequestDialog({
  required BuildContext context,
}) async {
  await showDialogScaleFromCenter(
    page: const CameraPermissionDialog(),
    context: context,
  );
}

class CameraPermissionDialog extends StatelessWidget {
  const CameraPermissionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      clipBehavior: Clip.hardEdge,
      contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 35),
      titlePadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      actionsPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      title: Row(
        children: [
          const Icon(
            Icons.camera_alt_rounded,
            size: 25,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            S.current.cameraPermission,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).primary,
                ),
          ),
        ],
      ),
      content: Text(
        S.current.cameraPermissionDesc,
        style: Theme.of(context).textTheme.labelLarge,
      ),
      actions: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: ButtonWidget(
                buttonType: ButtonWidgetType.dialog,
                title: S.current.continueLabel,
                backgroundColor: Theme.of(context).primary,
                textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).background,
                    ),
                borderRadius: const BorderRadius.all(Radius.circular(0)),
                onTap: () async {
                  await PermissionHandler.cameraPermissionRequest();
                  if (!context.mounted) return;
                  Navigator.pop(context);
                },
              ),
            ),
            Expanded(
              child: ButtonWidget(
                buttonType: ButtonWidgetType.dialog,
                title: S.current.cancel,
                textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).neutral.shade800,
                    ),
                borderRadius: const BorderRadius.all(Radius.circular(0)),
                backgroundColor: Theme.of(context).background.shade900,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
