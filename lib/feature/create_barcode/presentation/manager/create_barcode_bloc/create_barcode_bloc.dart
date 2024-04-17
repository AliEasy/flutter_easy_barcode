import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entity/barcode_options.dart';

part 'create_barcode_event.dart';

part 'create_barcode_state.dart';

@injectable
class CreateBarcodeBloc extends Bloc<CreateBarcodeEvent, CreateBarcodeState> {
  final BarcodeOptions barcodeOptions = BarcodeOptions(value: '');

  CreateBarcodeBloc() : super(CreateBarcodeInitialState()) {
    on<CreateBarcodeUpdatedEvent>(_updateBarcode);
  }

  _updateBarcode(CreateBarcodeUpdatedEvent event, Emitter<CreateBarcodeState> emit) {
    emit(CreateBarcodeInitialState());
    if (event.value != null) {
      barcodeOptions.value = event.value!;
    }
    emit(CreateBarcodeUpdatedState(barcodeOptions: barcodeOptions));
  }
}
