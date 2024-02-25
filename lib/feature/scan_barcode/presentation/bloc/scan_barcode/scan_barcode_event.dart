part of 'scan_barcode_bloc.dart';

abstract class ScanBarcodeEvent {
  const ScanBarcodeEvent();
}

class ScanBarcodeDetectedEvent extends ScanBarcodeEvent {
  BarcodeCapture capture;

  ScanBarcodeDetectedEvent({required this.capture});
}

class ScanBarcodeResetEvent extends ScanBarcodeEvent {
  ScanBarcodeResetEvent();
}
