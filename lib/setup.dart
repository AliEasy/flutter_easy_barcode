import 'package:flutter/material.dart';

import 'core/di/base/di_setup.dart';

void setupApp() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
}