part of 'create_barcode_bloc.dart';

abstract class CreateBarcodeEvent extends Equatable {
  const CreateBarcodeEvent();
}

class CreateBarcodeUpdatedEvent extends CreateBarcodeEvent {
  final String? value;
  final Color? color;
  final bool? hasCentralImage;
  final Uint8List? centralImage;

  const CreateBarcodeUpdatedEvent({
    this.value,
    this.color,
    this.centralImage,
    this.hasCentralImage,
  });

  @override
  List<Object?> get props => [value, color, hasCentralImage, centralImage];
}
