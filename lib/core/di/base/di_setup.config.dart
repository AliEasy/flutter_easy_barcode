// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_easy_barcode/core/service/language_theme/language_theme_bloc.dart'
    as _i5;
import 'package:flutter_easy_barcode/feature/create_barcode/presentation/manager/create_barcode_bloc/create_barcode_bloc.dart'
    as _i3;
import 'package:flutter_easy_barcode/feature/home_page/presentation/manager/home_navigation_bloc.dart'
    as _i4;
import 'package:flutter_easy_barcode/feature/scan_barcode/presentation/manager/scan_barcode/scan_barcode_bloc.dart'
    as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.CreateBarcodeBloc>(() => _i3.CreateBarcodeBloc());
    gh.factory<_i4.HomeNavigationBloc>(() => _i4.HomeNavigationBloc());
    gh.singleton<_i5.LanguageThemeBloc>(_i5.LanguageThemeBloc());
    gh.factory<_i6.ScanBarcodeBloc>(() => _i6.ScanBarcodeBloc());
    return this;
  }
}
