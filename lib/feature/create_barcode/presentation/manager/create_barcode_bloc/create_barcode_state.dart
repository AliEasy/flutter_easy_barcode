part of 'create_barcode_bloc.dart';

abstract class CreateBarcodeState extends Equatable {
  final BarcodeOptions barcodeOptions;
  const CreateBarcodeState({required this.barcodeOptions});
}

class CreateBarcodeInitialState extends CreateBarcodeState {
  const CreateBarcodeInitialState({required super.barcodeOptions});

  @override
  List<Object?> get props => [barcodeOptions.value];
}

class CreateBarcodeUpdatedState extends CreateBarcodeState {
  const CreateBarcodeUpdatedState({required super.barcodeOptions});

  @override
  List<Object?> get props => [barcodeOptions.value];
}
