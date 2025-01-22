import 'package:flutter_easy_barcode/generated/l10n.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

enum CustomOpenerResult {
  success,
  empty,
  invalid,
  problem,
  error
}

extension OnCustomOpenerResult on CustomOpenerResult {
  String toHumanReadable() {
    switch (this) {
      case CustomOpenerResult.empty:
        return S.current.linkNotDefined;
      case CustomOpenerResult.invalid:
        return S.current.linkIsInvalid;
      case CustomOpenerResult.problem:
        return S.current.problemInOpeningLinks;
      case CustomOpenerResult.error:
        return S.current.errorInOpeningLinks;
      case CustomOpenerResult.success:
        return S.current.successOperation;
    }
  }
}

@injectable
class CustomOpener {
  Future<CustomOpenerResult> openLink(String link) async {
    if (link.isEmpty) {
      return CustomOpenerResult.empty;
    }
    try {
      final uri = Uri.parse(link);
      bool canLaunch = await canLaunchUrl(uri);
      if (canLaunch) {
        bool launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
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

  Future<CustomOpenerResult> dialNumber(String phoneNumber) async {
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

  Future<CustomOpenerResult> openSms(String phoneNumber, String smsBody) async {
    if (phoneNumber.isEmpty) {
      return CustomOpenerResult.empty;
    }
    try {
      final Uri dial = Uri(
        scheme: 'sms',
        path: phoneNumber,
        queryParameters: <String, String>{
          'body': Uri.encodeComponent(smsBody),
        },
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
