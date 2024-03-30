import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../configureDependencies.dart';
import '../../../../core/localization.dart';
import '../../../../core/navigator.dart';
import '../../../../core/opener.dart';
import '../../../../core/uikit/dialog/dialog.dart';
import '../bloc/scan_barcode/scan_barcode_bloc.dart';
import '../widgets/barcode_type_link_dialog.dart';
import '../widgets/phone_type_link_dialog.dart';
import '../widgets/scanner_overlay.dart';
import '../widgets/text_type_link_dialog.dart';

class ScanBarcodePage extends StatelessWidget {
  const ScanBarcodePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cameraController = MobileScannerController(
      detectionTimeoutMs: 1000,
    );
    double scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 200.0
        : 330.0;
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.of(context).size.center(Offset.zero),
      width: scanArea,
      height: scanArea,
    );
    return BlocProvider(
      create: (context) => getIt<ScanBarcodeBloc>(),
      child: Builder(
        builder: (context) {
          return BlocListener<ScanBarcodeBloc, ScanBarcodeState>(
            listener: (context, state) async {
              if (state is ScanBarcodeAsLinkState) {
                await showDialogAnimatedAtBottom(
                  context: context,
                  page: BarcodeTypeLinkDialog(
                    link: state.link,
                  ),
                );
                if (!context.mounted) return;
                context.read<ScanBarcodeBloc>().add(ScanBarcodeResetEvent());
              } else if (state is ScanBarcodeAsTextState) {
                await showDialogAnimatedAtBottom(
                  context: context,
                  page: BarcodeTypeTextDialog(
                    text: state.text,
                  ),
                );
                if (!context.mounted) return;
                context.read<ScanBarcodeBloc>().add(ScanBarcodeResetEvent());
              } else if (state is ScanBarcodeAsPhoneState) {
                await showDialogAnimatedAtBottom(
                  context: context,
                  page: BarcodeTypePhoneDialog(
                    phoneNumber: state.phoneNumber,
                  ),
                );
                if (!context.mounted) return;
                context.read<ScanBarcodeBloc>().add(ScanBarcodeResetEvent());
              } else if (state is ScanBarcodeAsSmsState) {
                await CustomOpener.openSms(state.phoneNumber, state.smsBody);
                if (!context.mounted) return;
                context.read<ScanBarcodeBloc>().add(ScanBarcodeResetEvent());
              } else if (state is ScanBarcodeAsEmptyState) {}
            },
            child: Scaffold(
              body: Stack(
                children: [
                  MobileScanner(
                    controller: cameraController,
                    scanWindow: scanWindow,
                    onDetect: (capture) {
                      context
                          .read<ScanBarcodeBloc>()
                          .add(ScanBarcodeDetectedEvent(capture: capture));
                    },
                  ),
                  QRScannerOverlay(
                    overlayColour: Colors.black12,
                    scanArea: scanWindow,
                  ),
                  Positioned(
                    top: 50,
                    right: 0,
                    left: 0,
                    child: Text(
                      Strings.instance.appLocalization.scanBarcode,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: 15,
                    child: IconButton(
                      splashRadius: 1,
                      icon: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: const Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        popPage(context);
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    right: 15,
                    child: IconButton(
                      splashRadius: 1,
                      icon: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: const Icon(
                          Icons.flash_on,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () async {
                        cameraController.toggleTorch();
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
