part of 'language_theme_bloc.dart';

abstract class LanguageThemeEvent extends Equatable {
  const LanguageThemeEvent();
}

class ChangeLanguageEvent extends LanguageThemeEvent {
  final LanguageType? languageType;

  const ChangeLanguageEvent({this.languageType});

  @override
  List<Object?> get props => [languageType];
}

class ChangeThemeEvent extends LanguageThemeEvent {
  final ThemeType? themeType;

  const ChangeThemeEvent({this.themeType});

  @override
  List<Object?> get props => [themeType];
}
