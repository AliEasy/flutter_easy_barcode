import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configureDependencies.dart';
import '../../../scan_barcode/presentation/pages/scan_barcode.dart';
import '../../model/home_page_navigation_menu_type.dart';
import '../manager/home_navigation_bloc.dart';
import '../widgets/home_bottom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeNavigationBloc>(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: BlocSelector<HomeNavigationBloc, HomeNavigationState, int>(
              selector: (state) => state.index,
              builder: (context, index) {
                if (index == HomePageNavigationMenuType.scanBarcode.value) {
                  return BlocProvider<HomeNavigationBloc>.value(
                    value: context.read<HomeNavigationBloc>(),
                    child: const ScanBarcodePage(),
                  );
                } else if (index == HomePageNavigationMenuType.createBarcode.value) {
                  return Container();
                }
                return Container();
              },
            ),
            bottomNavigationBar: BlocProvider<HomeNavigationBloc>.value(
              value: context.read<HomeNavigationBloc>(),
              child: const HomeBottomNavigationBar(),
            ),
          );
        },
      ),
    );
  }
}
