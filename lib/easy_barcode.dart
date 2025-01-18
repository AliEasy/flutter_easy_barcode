import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easy_barcode/core/config/locale/locale.dart';
import 'package:flutter_easy_barcode/core/config/theme/theme.dart';
import 'package:flutter_easy_barcode/core/di/base/di_setup.dart';
import 'package:flutter_easy_barcode/core/service/language_theme/language_theme_bloc.dart';
import 'package:flutter_easy_barcode/feature/home_page/presentation/pages/home.dart';
import 'package:flutter_easy_barcode/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class EasyBarcodeApp extends StatelessWidget {
  const EasyBarcodeApp({super.key});

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
              return S.of(context).appTitle;
            },
            theme: context.read<LanguageThemeBloc>().themeData,
            home: const HomePage(),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('fa'),
            ],
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}