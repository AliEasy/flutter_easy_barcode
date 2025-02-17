import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easy_barcode/generated/l10n.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../core/common/util/permission_handler.dart';
import '../../../../core/di/base/di_setup.dart';
import '../../../../core/opener.dart';
import '../../../../core/uikit/dialog/dialog.dart';
import '../../../../core/uikit/dialog/permission/camera_permission_dialog.dart';
import '../../../home_page/presentation/manager/home_navigation/home_navigation_bloc.dart';
import '../manager/scan_barcode/scan_barcode_bloc.dart';
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
      autoStart: false,
    );
    double scanArea = (MediaQuery.of(context).size.width < 400 || MediaQuery.of(context).size.height < 400) ? 200.0 : 330.0;
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.of(context).size.center(Offset.zero),
      width: scanArea,
      height: scanArea,
    );
    return BlocProvider(
      create: (context) {
        final bloc = getIt<ScanBarcodeBloc>();
        bloc.add(const ScanBarcodeStartCameraEvent());
        return bloc;
      },
      child: Builder(
        builder: (context) {
          return BlocListener<ScanBarcodeBloc, ScanBarcodeState>(
            listener: (context, state) async {
              if (state is ScanBarcodeInitial) {
                bool status = await PermissionHandler.cameraPermissionCheck();
                if (!context.mounted) return;
                if (!status) {
                  await showCameraPermissionRequestDialog(context: context);
                }
                status = await PermissionHandler.cameraPermissionCheck();
                if (status) {
                  await cameraController.start();
                } else {
                  if (!context.mounted) return;
                  context.read<HomeNavigationBloc>().add(HomeNavigationCreateEvent());
                }
              } else if (state is ScanBarcodeAsLinkState) {
                await showDialogSlideFromBottom(
                  context: context,
                  page: BarcodeTypeLinkDialog(
                    link: state.link,
                  ),
                );
                if (!context.mounted) return;
                context.read<ScanBarcodeBloc>().add(const ScanBarcodeResetEvent());
              } else if (state is ScanBarcodeAsTextState) {
                await showDialogSlideFromBottom(
                  context: context,
                  page: BarcodeTypeTextDialog(
                    text: state.text,
                  ),
                );
                if (!context.mounted) return;
                context.read<ScanBarcodeBloc>().add(const ScanBarcodeResetEvent());
              } else if (state is ScanBarcodeAsPhoneState) {
                await showDialogSlideFromBottom(
                  context: context,
                  page: BarcodeTypePhoneDialog(
                    phoneNumber: state.phoneNumber,
                  ),
                );
                if (!context.mounted) return;
                context.read<ScanBarcodeBloc>().add(const ScanBarcodeResetEvent());
              } else if (state is ScanBarcodeAsSmsState) {
                await getIt<CustomOpener>().openSms(state.phoneNumber, state.smsBody);
                if (!context.mounted) return;
                context.read<ScanBarcodeBloc>().add(const ScanBarcodeResetEvent());
              }
            },
            child: Stack(
              children: [
                MobileScanner(
                  controller: cameraController,
                  scanWindow: scanWindow,
                  startDelay: true,
                  onDetect: (capture) {
                    context.read<ScanBarcodeBloc>().add(ScanBarcodeDetectedEvent(capture: capture));
                  },
                ),
                QRScannerOverlay(
                  overlayColour: Colors.black12,
                  scanArea: scanWindow,
                ),
                Positioned(
                  top: 40,
                  right: 0,
                  left: 0,
                  child: Text(
                    S.current.scanBarcode,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
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
                        size: 25,
                      ),
                    ),
                    onPressed: () async {
                      await cameraController.toggleTorch();
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
