part of 'scan_barcode_bloc.dart';

abstract class ScanBarcodeEvent extends Equatable {
  const ScanBarcodeEvent();
}

class ScanBarcodeStartCameraEvent extends ScanBarcodeEvent {
  const ScanBarcodeStartCameraEvent();

  @override
  List<Object?> get props => [];
}

class ScanBarcodeDetectedEvent extends ScanBarcodeEvent {
  final BarcodeCapture capture;

  const ScanBarcodeDetectedEvent({required this.capture});

  @override
  List<Object?> get props => [capture];
}

class ScanBarcodeResetEvent extends ScanBarcodeEvent {
  const ScanBarcodeResetEvent();

  @override
  List<Object?> get props => [];
}
