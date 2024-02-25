import 'package:flutter_easy_barcode/core/enum.dart';
import 'package:flutter_easy_barcode/core/localization.dart';

extension OnCustomOpenerResult on CustomOpenerLinkResult {
  String toHumanReadable() {
    switch (this) {
      case CustomOpenerLinkResult.empty:
        return Strings.instance.appLocalization.linkNotDefined;
      case CustomOpenerLinkResult.invalid:
        return Strings.instance.appLocalization.linkIsInvalid;
      case CustomOpenerLinkResult.problem:
        return Strings.instance.appLocalization.problemInOpeningLinks;
      case CustomOpenerLinkResult.error:
        return Strings.instance.appLocalization.errorInOpeningLinks;
      case CustomOpenerLinkResult.success:
        return Strings.instance.appLocalization.successOperation;
    }
  }
}
