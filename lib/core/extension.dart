import 'package:flutter_easy_barcode/core/enum.dart';
import 'package:flutter_easy_barcode/generated/l10n.dart';

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
