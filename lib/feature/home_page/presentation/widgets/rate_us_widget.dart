import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy_barcode/core/di/base/di_setup.dart';
import 'package:flutter_easy_barcode/core/di/device_info/device_info.dart';
import 'package:flutter_easy_barcode/core/opener.dart';
import 'package:flutter_easy_barcode/core/storage/shared_preferences/shared_preferences_storage.dart';
import 'package:flutter_easy_barcode/core/uikit/button/button_widget.dart';
import 'package:flutter_easy_barcode/core/uikit/toast.dart';
import 'package:flutter_easy_barcode/generated/l10n.dart';

class RateUsWidget extends StatelessWidget {
  const RateUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            S.current.rate_us_title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  S.current.rate_us_desc,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          ButtonWidget.filled(
            label: S.current.go_to_app_in_cafe_bazaar,
            onPressed: () async {
              try {
                await getIt<SharedPreferencesStorage>().ratedAppOnceSetter();
                final packageName = getIt<DeviceInfo>().packageName;
                AndroidIntent intent = AndroidIntent(
                  action: 'android.intent.action.VIEW',
                  data: 'bazaar://details?id=$packageName',
                  package: 'com.farsitel.bazaar',
                );
                await intent.launch();
              } catch (e) {
                final result = await getIt<CustomOpener>().openLink("https://cafebazaar.ir/app/top.easyware.easybarcode");
                if (result != CustomOpenerResult.success) {
                  if (context.mounted) {
                    CustomToasts.errorToast(context: context, message: S.current.cafe_bazaar_app_not_found);
                  }
                }
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ButtonWidget.text(
            label: S.current.close,
            onPressed: () async {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
