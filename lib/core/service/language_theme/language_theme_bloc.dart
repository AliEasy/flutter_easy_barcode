import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../config/locale/locale.dart';
import '../../config/theme/theme.dart';

part 'language_theme_event.dart';

part 'language_theme_state.dart';

@singleton
class LanguageThemeBloc extends Bloc<LanguageThemeEvent, LanguageThemeState> {
  ThemeData? _themeData;
  ThemeType? _themeType;
  Locale? _locale;
  LanguageType? _languageType;

  ThemeData? get themeData => _themeData;
  Locale? get locale => _locale;

  LanguageThemeBloc() : super(LanguageThemeInitial()) {
    on<ChangeLanguageEvent>((event, emit) {
      _changeLanguage(emit, manualSelectLanguageType: event.languageType);
    });
    on<ChangeThemeEvent>((event, emit) {
      _changeTheme(emit, themeType: event.themeType);
    });
  }

  _changeLanguage(Emitter<LanguageThemeState> emit, {LanguageType? manualSelectLanguageType}) {
    if (manualSelectLanguageType != null) {
      _languageType = manualSelectLanguageType;
    } else {
      _languageType = LanguageType.values.where((element) => element.name != _languageType!.name).first;
    }
    switch (_languageType) {
      case LanguageType.fa:
        _locale = Locale(LanguageType.fa.name);
        break;
      default:
        _locale = Locale(LanguageType.fa.name);
        break;
    }
    switch (_themeType!) {
      case ThemeType.dark:
        _themeData = ThemeData.dark().theme(_locale?.languageCode);
        break;
      case ThemeType.light:
        _themeData = ThemeData.light().theme(_locale?.languageCode);
        break;
    }
    emit(LanguageThemeChanged(themeType: _themeType, languageType: _languageType));
  }

  _changeTheme(Emitter<LanguageThemeState> emit, {ThemeType? themeType}) {
    if (themeType != null) {
      _themeType = themeType;
    } else {
      _themeType = ThemeType.values.where((element) => element.name != _themeType!.name).first;
    }
    switch (_themeType!) {
      case ThemeType.dark:
        _themeData = ThemeData.dark().theme(_locale?.languageCode);
        break;
      case ThemeType.light:
        _themeData = ThemeData.light().theme(_locale?.languageCode);
        break;
    }

    emit(LanguageThemeChanged(themeType: _themeType, languageType: _languageType));
  }
}
