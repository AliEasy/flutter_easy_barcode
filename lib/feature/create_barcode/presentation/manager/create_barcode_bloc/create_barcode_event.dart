part of 'create_barcode_bloc.dart';

abstract class CreateBarcodeEvent extends Equatable {
  const CreateBarcodeEvent();
}

class CreateBarcodeUpdatedEvent extends CreateBarcodeEvent {
  final String? value;
  final Color? color;

  const CreateBarcodeUpdatedEvent({this.value, this.color});

  @override
  List<Object?> get props => [value, color];
}
