import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'configureDependencies.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();

// @module
// abstract class RegisterModule {
//   @lazySingleton
//   Dio get dio => Dio();
// }

// class $RegisterModule extends RegisterModule {}
