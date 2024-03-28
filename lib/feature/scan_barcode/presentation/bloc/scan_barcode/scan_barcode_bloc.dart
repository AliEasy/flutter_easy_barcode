import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

part 'scan_barcode_event.dart';

part 'scan_barcode_state.dart';

@injectable
class ScanBarcodeBloc extends Bloc<ScanBarcodeEvent, ScanBarcodeState> {
  ScanBarcodeBloc() : super(ScanBarcodeInitial()) {
    on<ScanBarcodeDetectedEvent>(_onScanBarcodeDetectedEvent);
    on<ScanBarcodeResetEvent>(_onScanBarcodeResetEvent);
  }

  void _onScanBarcodeDetectedEvent(
      ScanBarcodeDetectedEvent event, Emitter<ScanBarcodeState> emit) {
    final List<Barcode> barcodes = event.capture.barcodes;
    if (barcodes.isNotEmpty) {
      var barcode = barcodes.first;
      switch (barcode.type) {
        case BarcodeType.url:
          emit(ScanBarcodeAsLinkState(link: barcode.rawValue!));
          break;
        case BarcodeType.text:
          emit(ScanBarcodeAsTextState(text: barcode.rawValue!));
          break;
        default:
          emit(ScanBarcodeAsEmptyState());
      }
    }
  }

  void _onScanBarcodeResetEvent(
      ScanBarcodeResetEvent event, Emitter<ScanBarcodeState> emit) {
    emit(ScanBarcodeStateChanger());
  }
}