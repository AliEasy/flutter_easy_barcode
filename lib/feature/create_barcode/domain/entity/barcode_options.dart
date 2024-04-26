import 'dart:typed_data';

import 'package:flutter/material.dart';

class BarcodeOptions {
  String value;
  Color? color;
  bool? hasCentralImage;
  Uint8List? centralImage;

  BarcodeOptions({
    required this.value,
    this.color,
    this.centralImage,
    this.hasCentralImage,
  });
}
