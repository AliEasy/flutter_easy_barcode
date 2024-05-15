import 'package:flutter/material.dart';
import 'package:flutter_easy_barcode/core/common/constant/environment.dart';
import 'package:flutter_easy_barcode/setup.dart';

import 'easy_barcode.dart';

void main() {
  environment = LiveEnv();
  setupApp();

  runApp(const EasyBarcodeApp());
}
