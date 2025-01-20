import 'package:flutter/material.dart';
import 'package:flutter_easy_barcode/core/uikit/button/button_widget.dart';
import 'package:flutter_easy_barcode/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

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
              final Uri bazaarUri = Uri.parse("bazaar://details?id=");

              if (await canLaunchUrl(bazaarUri)) {
                await launchUrl(
                  bazaarUri,
                  mode: LaunchMode.externalApplication,
                );
              } else {
                debugPrint("Could not launch Bazaar for package:");
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
