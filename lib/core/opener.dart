import 'package:flutter_easy_barcode/core/enum.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomOpener {
  static Future<CustomOpenerResult> openLink(String link) async {
    if (link.isEmpty) {
      return CustomOpenerResult.empty;
    }
    try {
      final uri = Uri.parse(link);
      bool canLaunch = await canLaunchUrl(uri);
      if (canLaunch) {
        bool launched = await launchUrl(uri);
        if (launched) {
          return CustomOpenerResult.success;
        } else {
          return CustomOpenerResult.problem;
        }
      } else {
        return CustomOpenerResult.invalid;
      }
    } catch (e) {
      return CustomOpenerResult.error;
    }
  }

  static Future<CustomOpenerResult> dialNumber(String phoneNumber) async {
    if (phoneNumber.isEmpty) {
      return CustomOpenerResult.empty;
    }
    try {
      final Uri dial = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      bool canLaunch = await canLaunchUrl(dial);
      if (canLaunch) {
        bool launched = await launchUrl(dial);
        if (launched) {
          return CustomOpenerResult.success;
        } else {
          return CustomOpenerResult.problem;
        }
      } else {
        return CustomOpenerResult.invalid;
      }
    } catch (e) {
      return CustomOpenerResult.error;
    }
  }
}
