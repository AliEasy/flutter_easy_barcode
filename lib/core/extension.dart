import 'package:flutter_easy_barcode/core/enum.dart';
import 'package:flutter_easy_barcode/core/localization.dart';

extension OnCustomOpenerResult on CustomOpenerResult {
  String toHumanReadable() {
    switch (this) {
      case CustomOpenerResult.empty:
        return Strings.instance.appLocalization.linkNotDefined;
      case CustomOpenerResult.invalid:
        return Strings.instance.appLocalization.linkIsInvalid;
      case CustomOpenerResult.problem:
        return Strings.instance.appLocalization.problemInOpeningLinks;
      case CustomOpenerResult.error:
        return Strings.instance.appLocalization.errorInOpeningLinks;
      case CustomOpenerResult.success:
        return Strings.instance.appLocalization.successOperation;
    }
  }
}
