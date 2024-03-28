import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easy_barcode/core/extension.dart';
import '../../../../core/enum.dart';
import '../../../../core/localization.dart';
import '../../../../core/navigator.dart';
import '../../../../core/opener.dart';
import '../../../../core/ui_constants.dart';
import '../../../../ui_kit/toast.dart';

class BarcodeTypePhoneDialog extends StatelessWidget {
  final String phoneNumber;

  const BarcodeTypePhoneDialog({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(dialogCorners),
        ),
      ),
      contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  const Icon(Icons.qr_code_scanner_rounded, size: 20),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    Strings.instance.appLocalization.callNumber,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            IconButton(
              icon: const Icon(
                Icons.close_rounded,
                size: 20,
              ),
              onPressed: () {
                popPage(context);
              },
              splashRadius: 15,
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                phoneNumber,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: Colors.black),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          onPressed: () async {
            var result = await CustomOpener.dialNumber(phoneNumber);
            if (!context.mounted) return;
            if (result != CustomOpenerResult.success) {
              CustomToasts.errorToast(
                context: context,
                message: result.toHumanReadable(),
              );
            }
            popPage(context);
          },
          child: Row(
            children: [
              const Icon(
                Icons.open_in_new_rounded,
                size: 23,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                Strings.instance.appLocalization.dialCallNumber,
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () async {
            await Clipboard.setData(ClipboardData(text: phoneNumber));
            if (!context.mounted) return;
            CustomToasts.successToast(
                context: context,
                message: Strings.instance.appLocalization.linkCopied);
            popPage(context);
          },
          child: Row(
            children: [
              const Icon(
                Icons.copy_rounded,
                size: 23,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                Strings.instance.appLocalization.copyCallNumber,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
