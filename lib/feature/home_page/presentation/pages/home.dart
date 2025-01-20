import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easy_barcode/core/di/base/di_setup.dart';

import '../../../create_barcode/presentation/pages/create_barcode.dart';
import '../../../scan_barcode/presentation/pages/scan_barcode.dart';
import '../../domain/entity/home_page_navigation_menu_type.dart';
import '../manager/home_navigation/home_navigation_bloc.dart';
import '../manager/rate_app/rate_app_bloc.dart';
import '../widgets/home_bottom_navigation_bar.dart';
import '../widgets/rate_us_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<HomeNavigationBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<RateAppBloc>(),
        ),
      ],
      child: BlocListener<RateAppBloc, RateAppState>(
        listener: (context, state) {
          if (state is RateAppNotHappenedState) {
            showModalBottomSheet(
              enableDrag: false,
              context: context,
              builder: (context) {
                return const RateUsWidget();
              },
            );
          }
        },
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
      ),
    );
  }
}
