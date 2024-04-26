import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entity/barcode_options.dart';

part 'create_barcode_event.dart';

part 'create_barcode_state.dart';

@injectable
class CreateBarcodeBloc extends Bloc<CreateBarcodeEvent, CreateBarcodeState> {
  final BarcodeOptions _barcodeOptions = BarcodeOptions(value: '');

  CreateBarcodeBloc()
      : super(
          CreateBarcodeInitialState(
            barcodeOptions: BarcodeOptions(value: ''),
          ),
        ) {
    on<CreateBarcodeUpdatedEvent>(_updateBarcode);
  }

  _updateBarcode(CreateBarcodeUpdatedEvent event, Emitter<CreateBarcodeState> emit) {
    emit(CreateBarcodeInitialState(barcodeOptions: _barcodeOptions));
    if (event.value != null) {
      _barcodeOptions.value = event.value!;
    }
    if (_barcodeOptions.value.isEmpty) {
      return;
    }
    if (event.color != null) {
      _barcodeOptions.color = event.color!;
    }
    if (event.hasCentralImage != null) {
      _barcodeOptions.hasCentralImage = event.hasCentralImage!;
      _barcodeOptions.centralImage = event.centralImage;
    }
    emit(CreateBarcodeUpdatedState(barcodeOptions: _barcodeOptions));
  }
}
