import 'package:flutter/material.dart';

import '../../../localization.dart';
import '../dialog.dart';

showCameraDialog({
  required BuildContext context,
}) {
  showDialogScaleFromCenter(
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
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
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
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
      content: Column(
        children: [
          Text(
            Strings.instance.appLocalization.cameraPermissionDesc,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [

      ],
    );
  }
}
