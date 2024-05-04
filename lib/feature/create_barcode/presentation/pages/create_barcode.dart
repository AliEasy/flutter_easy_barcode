import 'package:file_saver/file_saver.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easy_barcode/core/config/theme/theme.dart';
import 'package:flutter_easy_barcode/core/di/base/di_setup.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/common/util/assets_app_icon_handler.dart';
import '../../../../core/localization.dart';
import '../../../../core/uikit/icon_button/icon_button_widget.dart';
import '../../../../core/uikit/spacing.dart';
import '../../../../core/uikit/switch/switch_widget.dart';
import '../../../../core/uikit/text_form_field/text_form_field_widget.dart';
import '../../domain/entity/barcode_options.dart';
import '../manager/create_barcode_bloc/create_barcode_bloc.dart';

class CreateBarcodePage extends StatelessWidget {
  const CreateBarcodePage({super.key});

  @override
  Widget build(BuildContext context) {
    Color barcodeColor = Theme.of(context).primary;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            Strings.instance.appLocalization.createBarcode,
          ),
          leading: IconButtonWidget(
            icon: Icons.done_rounded,
            onTap: () {
              FocusScope.of(context).unfocus();
            },
          ),
        ),
        body: BlocProvider(
          create: (context) => getIt<CreateBarcodeBloc>(),
          child: Builder(builder: (context) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  children: [
                    TextFormFieldWidget(
                      labelText: Strings.instance.appLocalization.text,
                      hintText: Strings.instance.appLocalization.enterBarcodeText,
                      autoFocus: true,
                      listener: (value) {
                        context.read<CreateBarcodeBloc>().add(
                              CreateBarcodeUpdatedEvent(
                                value: value,
                              ),
                            );
                      },
                    ),
                    Space.h16,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Strings.instance.appLocalization.barcodeColor,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Space.h2,
                            Text(
                              Strings.instance.appLocalization.chooseBarcodeColorHint,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context).neutral[700],
                                  ),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () async {
                            barcodeColor = await _changeColor(context, barcodeColor);
                            if (!context.mounted) return;
                            context.read<CreateBarcodeBloc>().add(
                                  CreateBarcodeUpdatedEvent(
                                    color: barcodeColor,
                                  ),
                                );
                          },
                          child: BlocBuilder<CreateBarcodeBloc, CreateBarcodeState>(
                            builder: (context, state) {
                              return Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: state.barcodeOptions.color ?? barcodeColor,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    // Space.h16,
                    // SwitchButton(
                    //   title: Strings.instance.appLocalization.centralImage,
                    //   onChanged: (value) async {
                    //     if (value) {
                    //       final ByteData bytes = await rootBundle.load(
                    //         AssetsAppIconHelper.appIconPng,
                    //       );
                    //       final Uint8List imageByte = bytes.buffer.asUint8List();
                    //       if (!context.mounted) return;
                    //       context.read<CreateBarcodeBloc>().add(
                    //             CreateBarcodeUpdatedEvent(
                    //               hasCentralImage: true,
                    //               centralImage: imageByte,
                    //             ),
                    //           );
                    //     } else {
                    //       context.read<CreateBarcodeBloc>().add(
                    //             const CreateBarcodeUpdatedEvent(
                    //               hasCentralImage: false,
                    //               centralImage: null,
                    //             ),
                    //           );
                    //     }
                    //   },
                    // ),
                    // Space.h8,
                    // BlocBuilder<CreateBarcodeBloc, CreateBarcodeState>(
                    //   builder: (context, state) {
                    //     final barcodeOptions = state.barcodeOptions;
                    //     if (barcodeOptions.hasCentralImage ?? false) {
                    //       return Padding(
                    //         padding: const EdgeInsets.only(left: 15, right: 15),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Column(
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               children: [
                    //                 Text(
                    //                   Strings.instance.appLocalization.chooseCentralImage,
                    //                   style: Theme.of(context).textTheme.labelLarge,
                    //                 ),
                    //                 Space.h2,
                    //                 Text(
                    //                   Strings.instance.appLocalization.centralImageHint,
                    //                   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    //                         color: Theme.of(context).neutral[700],
                    //                       ),
                    //                 )
                    //               ],
                    //             ),
                    //             InkWell(
                    //               onTap: () async {
                    //                 final pickedImage = await _pickImage();
                    //                 if (!context.mounted || pickedImage == null) return;
                    //                 context.read<CreateBarcodeBloc>().add(
                    //                       CreateBarcodeUpdatedEvent(
                    //                         centralImage: pickedImage,
                    //                         hasCentralImage: true,
                    //                       ),
                    //                     );
                    //               },
                    //               child: Container(
                    //                 height: 30,
                    //                 width: 30,
                    //                 decoration: const BoxDecoration(
                    //                   borderRadius: BorderRadius.all(
                    //                     Radius.circular(10),
                    //                   ),
                    //                 ),
                    //                 child: Image.memory(
                    //                   barcodeOptions.centralImage!,
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       );
                    //     }
                    //     return const SizedBox();
                    //   },
                    // ),
                    Space.h40,
                    BlocBuilder<CreateBarcodeBloc, CreateBarcodeState>(
                      builder: (context, state) {
                        final BarcodeOptions barcodeOptions = state.barcodeOptions;
                        if (barcodeOptions.value.isNotEmpty) {
                          late PrettyQrDecoration qrDecoration;
                          PrettyQrDecorationImage? imageDecoration;
                          if (barcodeOptions.hasCentralImage ?? false) {
                            imageDecoration = PrettyQrDecorationImage(
                              scale: 0.3,
                              image: MemoryImage(
                                barcodeOptions.centralImage!,
                                scale: 1.5,
                              ),
                            );
                          }
                          qrDecoration = PrettyQrDecoration(
                            image: imageDecoration,
                            background: Theme.of(context).background,
                            shape: PrettyQrSmoothSymbol(
                              color: barcodeOptions.color ?? barcodeColor,
                            ),
                          );

                          return Column(
                            children: [
                              SizedBox(
                                height: 200,
                                width: 200,
                                child: PrettyQrView.data(
                                  data: barcodeOptions.value,
                                  decoration: qrDecoration,
                                ),
                              ),
                              Space.h12,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButtonWidget(
                                    icon: Icons.download_rounded,
                                    onTap: () async {
                                      final exportedImage = await _exportImage(
                                        barcodeOptions.value,
                                        qrDecoration,
                                      );
                                      if (exportedImage != null) {
                                        FileSaver.instance.saveAs(
                                          name: 'qrCode',
                                          mimeType: MimeType.jpeg,
                                          ext: 'jpg',
                                          bytes: exportedImage,
                                        );
                                      }
                                    },
                                  ),
                                  Space.w8,
                                  IconButtonWidget(
                                    icon: Icons.share_rounded,
                                    onTap: () async {
                                      final exportedImage = await _exportImage(
                                        barcodeOptions.value,
                                        qrDecoration,
                                      );
                                      if (exportedImage != null) {
                                        Share.shareXFiles(
                                          [
                                            XFile.fromData(
                                              exportedImage,
                                              name: 'qrCode',
                                              mimeType: 'image/jpeg',
                                            ),
                                          ],
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ],
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
        ),
      ),
    );
  }

  Future<Color> _changeColor(BuildContext context, Color initialColor) async {
    final Color newColor = await showColorPickerDialog(
      context,
      initialColor,
      title: Text(
        Strings.instance.appLocalization.barcodeColor,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      width: 40,
      height: 40,
      spacing: 0,
      runSpacing: 0,
      borderRadius: 0,
      wheelDiameter: 165,
      pickersEnabled: <ColorPickerType, bool>{
        ColorPickerType.primary: true,
        ColorPickerType.accent: false,
      },
      actionButtons: const ColorPickerActionButtons(
        okButton: true,
        closeButton: true,
        dialogActionButtons: false,
      ),
      constraints: const BoxConstraints(
        minHeight: 380,
        minWidth: 320,
        maxWidth: 320,
      ),
    );
    return newColor;
  }

  Future<Uint8List?> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return await image?.readAsBytes();
  }

  Future<Uint8List?> _exportImage(String data, PrettyQrDecoration decoration) async {
    final qrCode = QrCode.fromData(
      data: data,
      errorCorrectLevel: QrErrorCorrectLevel.H,
    );

    final qrImage = QrImage(qrCode);
    final exportedImage = await qrImage.toImageAsBytes(
      size: 256,
      configuration: ImageConfiguration.empty,
      decoration: decoration,
    );
    return exportedImage?.buffer.asUint8List(exportedImage.offsetInBytes, exportedImage.lengthInBytes);
  }
}
