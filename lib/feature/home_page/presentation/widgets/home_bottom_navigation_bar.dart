import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easy_barcode/core/config/theme/theme.dart';
import 'package:flutter_easy_barcode/generated/l10n.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/common/util/assets_svg_helper.dart';
import '../../domain/entity/home_page_navigation_menu_type.dart';
import '../manager/home_navigation/home_navigation_bloc.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeNavigationBloc, HomeNavigationState, int>(
      selector: (state) => state.index,
      builder: (context, index) {
        return NavigationBar(
          height: 60,
          elevation: 1,
          selectedIndex: index,
          onDestinationSelected: (value) {
            if (value == HomePageNavigationMenuType.scanBarcode.value) {
              context.read<HomeNavigationBloc>().add(HomeNavigationScanEvent());
            } else if (value == HomePageNavigationMenuType.createBarcode.value) {
              context.read<HomeNavigationBloc>().add(HomeNavigationCreateEvent());
            }
          },
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          destinations: [
            NavigationDestination(
              icon: SvgPicture.asset(
                AssetsSvgHelper.scanBarcode,
                height: 25,
                width: 25,
                colorFilter: ColorFilter.mode(Theme.of(context).neutral, BlendMode.srcIn),
              ),
              selectedIcon: SvgPicture.asset(
                AssetsSvgHelper.scanBarcode,
                height: 25,
                width: 25,
                colorFilter: ColorFilter.mode(Theme.of(context).primary, BlendMode.srcIn),
              ),
              label: S.current.scanBarcode,
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                AssetsSvgHelper.createBarcode,
                height: 20,
                width: 20,
                colorFilter: ColorFilter.mode(Theme.of(context).neutral, BlendMode.srcIn),
              ),
              selectedIcon: SvgPicture.asset(
                AssetsSvgHelper.createBarcode,
                height: 20,
                width: 20,
                colorFilter: ColorFilter.mode(Theme.of(context).primary, BlendMode.srcIn),
              ),
              label: S.current.createBarcode,
            ),
          ],
        );
      },
    );
  }
}
