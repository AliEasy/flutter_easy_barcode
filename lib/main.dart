import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easy_barcode/core/config/theme/theme.dart';
import 'package:flutter_easy_barcode/configureDependencies.dart';
import 'package:flutter_easy_barcode/core/localization.dart';
import 'package:flutter_easy_barcode/core/service/language_theme/language_theme_bloc.dart';
import 'package:flutter_easy_barcode/feature/home_page/presentation/pages/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'core/config/locale/locale.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        final bloc = getIt<LanguageThemeBloc>();
        bloc.add(const ChangeThemeEvent(themeType: ThemeType.light));
        bloc.add(const ChangeLanguageEvent(languageType: LanguageType.fa));
        return bloc;
      },
      child: BlocBuilder<LanguageThemeBloc, LanguageThemeState>(
        builder: (context, state) {
          return MaterialApp(
            onGenerateTitle: (context) {
              return AppLocalizations.of(context)!.appTitle;
            },
            theme: context.read<LanguageThemeBloc>().themeData,
            home: const HomePage(),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            debugShowCheckedModeBanner: false,
            builder: (context, child) {
              Strings.instance.setLocalization(context);
              return child!;
            },
          );
        },
      ),
    );
  }
}
