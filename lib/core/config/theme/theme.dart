import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ThemeType { dark, light }

class AppColor extends MaterialColor {
  const AppColor(super.primary, super.swatch);

  //The lightest shade
  @override
  Color get shade50 => this[50]!;

  @override
  Color get shade100 => this[100]!;

  @override
  Color get shade200 => this[200]!;

  @override
  Color get shade300 => this[300]!;

  @override
  Color get shade400 => this[400]!;

  @override
  Color get shade500 => this[500]!;

  @override
  Color get shade600 => this[600]!;

  @override
  Color get shade700 => this[700]!;

  @override
  Color get shade800 => this[800]!;

  //The darkest shade
  @override
  Color get shade900 => this[900]!;
}

extension AppTheme on ThemeData {
  AppColor get primary => const AppColor(
        0XFF7A28CB,
        <int, Color>{
          50: Color(0xfff4ecfb),
          100: Color(0xffcba8ee),
          200: Color(0xffcba8ee),
          300: Color(0xffb786e7),
          400: Color(0xffa364e0),
          500: Color(0xff7a28cb),
          600: Color(0xff6621a9),
          700: Color(0xff511b87),
          800: Color(0xff3d1465),
          900: Color(0xff280d43),
        },
      );

  AppColor get secondary => const AppColor(
        0XFFAB0091,
        <int, Color>{
          50: Color(0xffffa1f1),
          100: Color(0xffff78ea),
          200: Color(0xffff4fe4),
          300: Color(0xffff26de),
          400: Color(0xfffd00d6),
          500: Color(0xffab0091),
          600: Color(0xff82006e),
          700: Color(0xff59004c),
          800: Color(0xff310029),
          900: Color(0xff080007),
        },
      );

  AppColor get tertiary => const AppColor(
        0XFF4C99C0,
        <int, Color>{
          50: Color(0xffe3eff5),
          100: Color(0xffe3eff5),
          200: Color(0xffa7cde0),
          300: Color(0xffa7cde0),
          400: Color(0xffe3eff5),
          500: Color(0xff4c99c0),
          600: Color(0xff3b83a8),
          700: Color(0xff316c8a),
          800: Color(0xff26546c),
          900: Color(0xff26546c),
        },
      );

  AppColor get error => const AppColor(
        0xFFE46962,
        <int, Color>{
          50: Color(0xFFFCEEEE),
          100: Color(0xFFF9DEDC),
          200: Color(0xFFF2B8B5),
          300: Color(0xFFEC928E),
          400: Color(0xFFE46962),
          500: Color(0xFFDC362E),
          600: Color(0xFFB3261E),
          700: Color(0xFF8C1D18),
          800: Color(0xFF601410),
          900: Color(0xFF410E0B),
        },
      );

  AppColor get warning => const AppColor(
        0xFFFFD600,
        <int, Color>{
          50: Color(0xFFFFF2B8),
          100: Color(0xFFFFEB8A),
          200: Color(0xFFFFE45C),
          300: Color(0xFFFFDD2E),
          400: Color(0xFFFFD600),
          500: Color(0xFFD2B100),
          600: Color(0xFFA48A00),
          700: Color(0xFF766300),
          800: Color(0xFF601410),
          900: Color(0xFF410E0B),
        },
      );

  AppColor get background => const AppColor(
        0XFFFDF7FF,
        <int, Color>{
          50: Color(0xffffffff),
          100: Color(0xffffffff),
          200: Color(0xffffffff),
          300: Color(0xffffffff),
          400: Color(0xffffffff),
          500: Color(0xfffdf7ff),
          600: Color(0xfffcf2ff),
          700: Color(0xfffaedff),
          800: Color(0xfff9e8ff),
          900: Color(0xfff8e3ff),
        },
      );

  AppColor get neutral => const AppColor(
        0xFF777777,
        <int, Color>{
          50: Color(0xFFDBDBDB),
          100: Color(0xFFC2C2C2),
          200: Color(0xFFA9A9A9),
          300: Color(0xFF909090),
          400: Color(0xFF777777),
          500: Color(0xFF616161),
          600: Color(0xFF4C4C4C),
          700: Color(0xFF373737),
          800: Color(0xFF222222),
          900: Color(0xFF0D0D0D),
        },
      );

  ThemeData theme(String? languageCode) {
    return brightness == Brightness.light
        ? copyWith(
            scaffoldBackgroundColor: background.shade500,
            splashColor: neutral.shade50,
            primaryColor: primary,
            textTheme: _getTextTheme(languageCode),
            appBarTheme: AppBarTheme(
              foregroundColor: background,
              backgroundColor: background,
              titleTextStyle: _getTextTheme(languageCode).headlineMedium?.apply(
                    color: neutral.shade900,
                  ),
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle.dark,
            ),
            navigationBarTheme: NavigationBarThemeData(
              labelTextStyle: MaterialStateProperty.resolveWith(
                (states) {
                  if (states.contains(MaterialState.selected)) {
                    return _getTextTheme(languageCode).labelSmall?.copyWith(
                          color: primary,
                          fontWeight: FontWeight.w700,
                        );
                  }
                  return _getTextTheme(languageCode).labelSmall?.copyWith(
                        color: neutral,
                        fontWeight: FontWeight.w700,
                      );
                },
              ),
              elevation: 0,
            ),
            iconTheme: IconThemeData(
              color: primary,
            ),
          )
        : this;
  }

  TextTheme _getTextTheme(String? languageCode) {
    if (languageCode == 'fa') {
      String fontFamily = 'VazirFarsi';
      return _getDefaultPersianTextTheme(neutral.shade900, fontFamily);
    } else {
      String fontFamily = 'Vazir';
      return _getDefaultTextTheme(neutral.shade900, fontFamily);
    }
  }

  TextTheme _getDefaultTextTheme(Color color, String fontFamily) {
    return textTheme.copyWith(
      displayLarge: textTheme.displayLarge?.copyWith(height: 1.2, fontSize: 57, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
      displayMedium: textTheme.displayMedium?.copyWith(height: 1.2, fontSize: 45, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
      displaySmall: textTheme.displaySmall?.copyWith(height: 1.2, fontSize: 36, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
      headlineLarge: textTheme.headlineLarge?.copyWith(height: 1.2, fontSize: 32, fontWeight: FontWeight.w700, fontFamily: fontFamily, color: color),
      headlineMedium:
          textTheme.headlineMedium?.copyWith(height: 1.2, fontSize: 26, fontWeight: FontWeight.w700, fontFamily: fontFamily, color: color),
      headlineSmall: textTheme.headlineSmall?.copyWith(height: 1.2, fontSize: 24, fontWeight: FontWeight.w700, fontFamily: fontFamily, color: color),
      titleLarge: textTheme.titleLarge?.copyWith(height: 1.2, fontSize: 20, fontWeight: FontWeight.w700, fontFamily: fontFamily, color: color),
      titleMedium: textTheme.titleMedium?.copyWith(height: 1.2, fontSize: 18, fontWeight: FontWeight.w700, fontFamily: fontFamily, color: color),
      titleSmall: textTheme.titleSmall?.copyWith(height: 1.2, fontSize: 16, fontWeight: FontWeight.w700, fontFamily: fontFamily, color: color),
      labelLarge: textTheme.labelLarge?.copyWith(height: 1.2, fontSize: 14, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
      labelMedium: textTheme.labelMedium?.copyWith(height: 1.2, fontSize: 13, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
      labelSmall: textTheme.labelSmall?.copyWith(height: 1.2, fontSize: 12, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
      bodyLarge: textTheme.bodyLarge?.copyWith(height: 1.2, fontSize: 11, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
      bodyMedium: textTheme.bodyMedium?.copyWith(height: 1.2, fontSize: 10, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
      bodySmall: textTheme.bodySmall?.copyWith(height: 1.2, fontSize: 9, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
    );
  }

  TextTheme _getDefaultPersianTextTheme(Color color, String fontFamily) {
    return textTheme.copyWith(
      displayLarge: textTheme.displayLarge?.copyWith(height: 1.2, fontSize: 57, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
      displayMedium: textTheme.displayMedium?.copyWith(height: 1.2, fontSize: 45, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
      displaySmall: textTheme.displaySmall?.copyWith(height: 1.2, fontSize: 36, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
      headlineLarge: textTheme.headlineLarge?.copyWith(height: 1.2, fontSize: 32, fontWeight: FontWeight.w700, fontFamily: fontFamily, color: color),
      headlineMedium:
          textTheme.headlineMedium?.copyWith(height: 1.2, fontSize: 26, fontWeight: FontWeight.w700, fontFamily: fontFamily, color: color),
      headlineSmall: textTheme.headlineSmall?.copyWith(height: 1.2, fontSize: 24, fontWeight: FontWeight.w700, fontFamily: fontFamily, color: color),
      titleLarge: textTheme.titleLarge?.copyWith(height: 1.2, fontSize: 20, fontWeight: FontWeight.w700, fontFamily: fontFamily, color: color),
      titleMedium: textTheme.titleMedium?.copyWith(height: 1.2, fontSize: 18, fontWeight: FontWeight.w700, fontFamily: fontFamily, color: color),
      titleSmall: textTheme.titleSmall?.copyWith(height: 1.2, fontSize: 16, fontWeight: FontWeight.w700, fontFamily: fontFamily, color: color),
      labelLarge: textTheme.labelLarge?.copyWith(height: 1.2, fontSize: 14, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
      labelMedium: textTheme.labelMedium?.copyWith(height: 1.2, fontSize: 13, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
      labelSmall: textTheme.labelSmall?.copyWith(height: 1.2, fontSize: 12, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
      bodyLarge: textTheme.bodyLarge?.copyWith(height: 1.2, fontSize: 11, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
      bodyMedium: textTheme.bodyMedium?.copyWith(height: 1.2, fontSize: 10, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
      bodySmall: textTheme.bodySmall?.copyWith(height: 1.2, fontSize: 9, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
    );
  }
}
