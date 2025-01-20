import 'package:flutter/material.dart';
import 'package:flutter_easy_barcode/core/common/constant/environment.dart';
import 'package:flutter_easy_barcode/setup.dart';

import 'easy_barcode.dart';

void main() async {
  environment = LiveEnv();
  await setupApp();

  runApp(const EasyBarcodeApp());
}
