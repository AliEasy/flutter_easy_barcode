import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_easy_barcode/core/storage/shared_preferences/shared_preferences_storage.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entity/barcode_options.dart';

part 'create_barcode_event.dart';

part 'create_barcode_state.dart';

@injectable
class CreateBarcodeBloc extends Bloc<CreateBarcodeEvent, CreateBarcodeState> {
  final BarcodeOptions _barcodeOptions = BarcodeOptions(value: '');
  final SharedPreferencesStorage _sharedPreferencesStorage;

  CreateBarcodeBloc(this._sharedPreferencesStorage)
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
    if (event.color != null) {
      _barcodeOptions.color = event.color!;
    }
    if (event.hasCentralImage != null) {
      _barcodeOptions.hasCentralImage = event.hasCentralImage!;
      _barcodeOptions.centralImage = event.centralImage;
    }
    _sharedPreferencesStorage.usedApplicationOnceSetter();
    emit(CreateBarcodeUpdatedState(barcodeOptions: _barcodeOptions));
  }
}
