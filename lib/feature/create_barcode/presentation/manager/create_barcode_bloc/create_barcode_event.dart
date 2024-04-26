part of 'create_barcode_bloc.dart';

abstract class CreateBarcodeEvent extends Equatable {
  const CreateBarcodeEvent();
}

class CreateBarcodeUpdatedEvent extends CreateBarcodeEvent {
  final String? value;

  const CreateBarcodeUpdatedEvent({this.value});

  @override
  List<Object?> get props => [value];
}
