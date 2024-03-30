import 'package:flutter/material.dart';

ThemeData theme() {
  Color bgColor = const Color(0XFFFCFFFD);

  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0XFF7A28CB),
      background: bgColor,
    ),
    scaffoldBackgroundColor: bgColor,
    fontFamily: 'sans',
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
      ),
    ),
    appBarTheme: AppBarTheme(
      color: bgColor,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: const Color(0XFF020D19),
        fontFamily: 'sans',
        fontSize: 22,
      ),
    ),
  );
}
