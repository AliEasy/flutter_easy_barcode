import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easy_barcode/core/di/base/di_setup.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../../../core/localization.dart';
import '../../../../core/uikit/spacing.dart';
import '../../../../core/uikit/text_form_field/text_form_field_widget.dart';
import '../../domain/entity/barcode_options.dart';
import '../manager/create_barcode_bloc/create_barcode_bloc.dart';

class CreateBarcodePage extends StatelessWidget {
  const CreateBarcodePage({super.key});

  @override
  Widget build(BuildContext context) {
    final valueController = TextEditingController();
    return BlocProvider(
      create: (context) => getIt<CreateBarcodeBloc>(),
      child: Builder(builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              children: [
                Space.h32,
                TextFormFieldWidget(
                  controller: valueController,
                  labelText: Strings.instance.appLocalization.text,
                  hintText: Strings.instance.appLocalization.enterText,
                  autoFocus: true,
                  listener: (value) {
                    context.read<CreateBarcodeBloc>().add(
                          CreateBarcodeUpdatedEvent(value: value),
                        );
                  },
                ),
                Space.h12,
                BlocBuilder<CreateBarcodeBloc, CreateBarcodeState>(
                  builder: (context, state) {
                    if (state is CreateBarcodeUpdatedState) {
                      BarcodeOptions barcodeOptions = state.barcodeOptions;
                      return SizedBox(
                        height: 100,
                        width: 100,
                        child: PrettyQrView.data(
                          data: barcodeOptions.value!,
                          decoration: const PrettyQrDecoration(
                            image: PrettyQrDecorationImage(
                              image: AssetImage('images/flutter.png'),
                            ),
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
