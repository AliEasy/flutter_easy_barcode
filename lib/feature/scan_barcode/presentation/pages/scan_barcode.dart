import 'package:flutter/material.dart';
import 'package:flutter_easy_barcode/core/localization.dart';
import 'package:flutter_easy_barcode/core/navigator.dart';
import 'package:flutter_easy_barcode/feature/scan_barcode/presentation/widgets/scanner_overlay.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanBarcodePage extends StatelessWidget {
  const ScanBarcodePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cameraController = MobileScannerController();
    double scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 200.0
        : 330.0;
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.of(context).size.center(Offset.zero),
      width: scanArea,
      height: scanArea,
    );
    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            controller: cameraController,
            scanWindow: scanWindow,
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                debugPrint('Barcode found! ${barcode.rawValue}');
              }
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
    );
  }
}
