import 'package:flutter/material.dart';
import 'package:flutter_easy_barcode/common/util/permission_handler.dart';
import 'package:flutter_easy_barcode/core/config/theme/theme.dart';

import '../../../localization.dart';
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
      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      titlePadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
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
            Strings.instance.appLocalization.cameraPermission,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).primary,
                ),
          ),
        ],
      ),
      content: Text(
        Strings.instance.appLocalization.cameraPermissionDesc,
        style: Theme.of(context).textTheme.labelLarge,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Expanded(
          child: ButtonWidget(
            buttonType: ButtonWidgetType.dialog,
            title: Strings.instance.appLocalization.continueLabel,
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
            title: Strings.instance.appLocalization.cancel,
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
