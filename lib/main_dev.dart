import 'package:flutter/material.dart';
import 'package:flutter_easy_barcode/core/common/constant/environment.dart';
import 'package:flutter_easy_barcode/setup.dart';

import 'easy_barcode.dart';

void main() {
  environment = DevEnv();
  setupApp();

  runApp(
    const Banner(
      location: BannerLocation.bottomStart,
      layoutDirection: TextDirection.ltr,
      textDirection: TextDirection.ltr,
      message: 'Dev',
      textStyle: TextStyle(
        color: Color(0xFFFFFFFF),
      ),
      color: Color(0xFF777777),
      child: EasyBarcodeApp(),
    ),
  );
}
