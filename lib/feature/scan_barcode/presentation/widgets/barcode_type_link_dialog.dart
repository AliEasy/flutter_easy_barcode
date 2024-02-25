import 'package:flutter/material.dart';
import 'package:flutter_easy_barcode/core/enum.dart';
import 'package:flutter_easy_barcode/core/extension.dart';
import 'package:flutter_easy_barcode/core/localization.dart';
import 'package:flutter_easy_barcode/core/navigator.dart';
import 'package:flutter_easy_barcode/core/opener.dart';
import 'package:flutter_easy_barcode/core/ui_constants.dart';
import 'package:flutter_easy_barcode/ui_kit/toast.dart';
import 'package:flutter/services.dart';

class BarcodeTypeLinkDialog extends StatelessWidget {
  final String link;

  const BarcodeTypeLinkDialog({super.key, required this.link});

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
      contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      children: [
        Row(
          children: [
            const Icon(Icons.qr_code_scanner_rounded),
            const SizedBox(
              width: 10,
            ),
            Text(
              Strings.instance.appLocalization.link,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.black),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                link,
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
            var result = await CustomOpener.openLink(link);
            if (!context.mounted) return;
            if (result != CustomOpenerLinkResult.success) {
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
                Strings.instance.appLocalization.openLinkInBrowser,
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () async {
            await Clipboard.setData(ClipboardData(text: link));
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
                Strings.instance.appLocalization.copyLink,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
