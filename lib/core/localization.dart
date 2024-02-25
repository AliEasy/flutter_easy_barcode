import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Strings {
  static final Strings instance = Strings._();
  Strings._();

  late AppLocalizations _localization;

  AppLocalizations get appLocalization => _localization;

  void setLocalization(BuildContext context) {
    _localization = AppLocalizations.of(context)!;
  }
}