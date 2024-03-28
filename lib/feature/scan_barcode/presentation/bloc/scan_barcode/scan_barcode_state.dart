part of 'scan_barcode_bloc.dart';

abstract class ScanBarcodeState extends Equatable {
  const ScanBarcodeState();
}

class ScanBarcodeInitial extends ScanBarcodeState {
  @override
  List<Object> get props => [];
}

class ScanBarcodeAsLinkState extends ScanBarcodeState {
  final String link;

  const ScanBarcodeAsLinkState({required this.link});

  @override
  List<Object> get props => [link];
}

class ScanBarcodeAsTextState extends ScanBarcodeState {
  final String text;

  const ScanBarcodeAsTextState({required this.text});

  @override
  List<Object> get props => [text];
}

class ScanBarcodeAsPhoneState extends ScanBarcodeState {
  final String phoneNumber;

  const ScanBarcodeAsPhoneState({required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}

class ScanBarcodeAsEmptyState extends ScanBarcodeState {
  @override
  List<Object> get props => [];
}

class ScanBarcodeStateChanger extends ScanBarcodeState {
  @override
  List<Object> get props => [];
}
