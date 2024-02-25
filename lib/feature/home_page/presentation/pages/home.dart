import 'package:flutter/material.dart';
import 'package:flutter_easy_barcode/core/localization.dart';
import 'package:flutter_easy_barcode/feature/home_page/model/home_page_card_type.dart';
import 'package:flutter_easy_barcode/feature/home_page/presentation/widgets/home_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.instance.appLocalization.appTitle,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Theme.of(context).primaryColorLight,
        ),
        child: const Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    HomeCardWidget(
                      position: 0,
                      type: HomePageCardType.createBarcode,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    HomeCardWidget(
                      position: 1,
                      type: HomePageCardType.scanBarcode,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
