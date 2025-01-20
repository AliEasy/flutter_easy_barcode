import 'package:flutter/material.dart';

import 'core/di/base/di_setup.dart';

Future<void> setupApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
}