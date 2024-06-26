import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/base/di_setup.dart';
import '../../../create_barcode/presentation/pages/create_barcode.dart';
import '../../../scan_barcode/presentation/pages/scan_barcode.dart';
import '../../domain/entity/home_page_navigation_menu_type.dart';
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
          return SafeArea(
            top: false,
            child: Scaffold(
              body: BlocSelector<HomeNavigationBloc, HomeNavigationState, int>(
                selector: (state) => state.index,
                builder: (context, index) {
                  if (index == HomePageNavigationMenuType.scanBarcode.value) {
                    return BlocProvider<HomeNavigationBloc>.value(
                      value: context.read<HomeNavigationBloc>(),
                      child: const ScanBarcodePage(),
                    );
                  } else if (index == HomePageNavigationMenuType.createBarcode.value) {
                    return const CreateBarcodePage();
                  }
                  return Container();
                },
              ),
              bottomNavigationBar: BlocProvider<HomeNavigationBloc>.value(
                value: context.read<HomeNavigationBloc>(),
                child: const HomeBottomNavigationBar(),
              ),
            ),
          );
        },
      ),
    );
  }
}
