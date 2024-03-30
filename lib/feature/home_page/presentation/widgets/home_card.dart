import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/util/assets_svg_helper.dart';
import '../../../../core/localization.dart';
import '../../../../core/navigator.dart';
import '../../../../core/uikit/common_widgets.dart';
import '../../../scan_barcode/presentation/pages/scan_barcode.dart';
import '../../model/home_page_card_type.dart';

class HomeCardWidget extends StatelessWidget {
  final HomePageCardType type;
  final int position;

  const HomeCardWidget({super.key, required this.position, required this.type});

  @override
  Widget build(BuildContext context) {
    double radius = 10;

    String title = '';
    String iconPath = '';
    Function(BuildContext context) onClick;
    switch (type) {
      case HomePageCardType.createBarcode:
        title = Strings.instance.appLocalization.createBarcode;
        iconPath += AssetsSvgHelper.createBarcode;
        onClick = _onCreateBarcodeClick;
        break;
      case HomePageCardType.scanBarcode:
        title = Strings.instance.appLocalization.scanBarcode;
        iconPath += AssetsSvgHelper.scanBarcode;
        onClick = _onScanBarcodeClick;
        break;
    }

    return Expanded(
      child: animatedListItem(
        position: position,
        child: Card(
          color: Theme.of(context).primaryColorDark,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(radius),
            onTap: () => onClick(context),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
              child: Column(
                children: [
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SvgPicture.asset(
                    iconPath,
                    height: 25,
                    width: 25,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onCreateBarcodeClick(BuildContext context) {}

  void _onScanBarcodeClick(BuildContext context) {
    pushSlideRoute(context, const ScanBarcodePage(), 'ScanBarcodePage');
  }
}
