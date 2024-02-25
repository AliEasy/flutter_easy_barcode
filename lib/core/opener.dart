import 'package:flutter_easy_barcode/core/enum.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomOpener {
  static Future<CustomOpenerLinkResult> openLink(String link) async {
    if (link.isEmpty) {
      return CustomOpenerLinkResult.empty;
    }
    try {
      final url = Uri.parse(link);
      bool canLaunch = await canLaunchUrl(url);
      if (canLaunch) {
        bool launched = await launchUrl(url);
        if (launched) {
          return CustomOpenerLinkResult.success;
        } else {
          return CustomOpenerLinkResult.problem;
        }
      } else {
        return CustomOpenerLinkResult.invalid;
      }
    } catch (e) {
      return CustomOpenerLinkResult.error;
    }
  }
}
