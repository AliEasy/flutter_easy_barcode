part of 'create_barcode_bloc.dart';

abstract class CreateBarcodeState extends Equatable {
  const CreateBarcodeState();
}

class CreateBarcodeInitialState extends CreateBarcodeState {
  @override
  List<Object> get props => [];
}

class CreateBarcodeUpdatedState extends CreateBarcodeState {
  final BarcodeOptions barcodeOptions;

  const CreateBarcodeUpdatedState({required this.barcodeOptions});

  @override
  List<Object> get props => [barcodeOptions];
}
