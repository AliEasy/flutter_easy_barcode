import 'package:flutter/material.dart';
import 'package:flutter_easy_barcode/config/theme.dart';
import 'package:flutter_easy_barcode/configureDependencies.dart';
import 'package:flutter_easy_barcode/core/localization.dart';
import 'package:flutter_easy_barcode/feature/home_page/presentation/pages/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) {
        return AppLocalizations.of(context)!.appTitle;
      },
      theme: theme(),
      home: const HomePage(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        Strings.instance.setLocalization(context);
        return child!;
      },
    );
  }
}