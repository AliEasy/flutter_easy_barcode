import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easy_barcode/feature/scan_barcode/presentation/widgets/view_full_text_dialog.dart';
import 'package:flutter_easy_barcode/generated/l10n.dart';

import '../../../../core/navigator.dart';
import '../../../../core/common/constant/ui_constants.dart';
import '../../../../core/uikit/dialog/dialog.dart';
import '../../../../core/uikit/toast.dart';

class BarcodeTypeTextDialog extends StatelessWidget {
  final String text;

  const BarcodeTypeTextDialog({super.key, required this.text});

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
                    S.current.text,
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
                text,
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
            showDialogScaleFromCenter(
              context: context,
              closable: true,
              page: ViewFullTextDialog(
                text: text,
              ),
            );
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
                S.current.viewFullText,
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () async {
            await Clipboard.setData(ClipboardData(text: text));
            if (!context.mounted) return;
            CustomToasts.successToast(
                context: context,
                message: S.current.linkCopied);
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
                S.current.copyText,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
