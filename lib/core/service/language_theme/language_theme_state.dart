part of 'language_theme_bloc.dart';

abstract class LanguageThemeState extends Equatable {
  const LanguageThemeState();
}

class LanguageThemeInitial extends LanguageThemeState {
  @override
  List<Object> get props => [];
}

class LanguageThemeChanged extends LanguageThemeState {
  final ThemeType? themeType;
  final LanguageType? languageType;
  const LanguageThemeChanged({this.themeType, this.languageType});
  @override
  List<Object> get props => [];
}
