import 'package:flutter/material.dart';
import 'package:flutter_easy_barcode/config/constant.dart';
import 'package:flutter_easy_barcode/core/localization.dart';
import 'package:flutter_easy_barcode/feature/home_page/model/home_page_card_type.dart';
import 'package:flutter_easy_barcode/ui_kit/common_widgets.dart';
import 'package:flutter_svg/svg.dart';

class HomeCardWidget extends StatelessWidget {
  final HomePageCardType type;
  final int position;

  const HomeCardWidget({super.key, required this.position, required this.type});

  @override
  Widget build(BuildContext context) {
    double radius = 10;
    String title = '';
    String iconPath = svgPath;
    if (type == HomePageCardType.createBarcode) {
      title = Strings.instance.appLocalization.createBarcode;
      iconPath += 'create_barcode.svg';
    } else if (type == HomePageCardType.scanBarcode) {
      title = Strings.instance.appLocalization.scanBarcode;
      iconPath += 'scan_barcode.svg';
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
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
              child: Column(
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SvgPicture.asset(
                    iconPath,
                    height: 25,
                    width: 25,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
