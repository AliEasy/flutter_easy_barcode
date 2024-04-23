import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/home_page_navigation_menu_type.dart';


part 'home_navigation_event.dart';

part 'home_navigation_state.dart';

@injectable
class HomeNavigationBloc extends Bloc<HomeNavigationEvent, HomeNavigationState> {
  HomeNavigationBloc()
      : super(
          HomeNavigationInitialState(
            index: HomePageNavigationMenuType.scanBarcode.index,
          ),
        ) {
    on<HomeNavigationScanEvent>(_showScanPage);
    on<HomeNavigationCreateEvent>(_showCreatePage);
  }

  _showScanPage(HomeNavigationScanEvent event, Emitter<HomeNavigationState> emit) {
    emit(HomeNavigationSelectPageState(index: HomePageNavigationMenuType.scanBarcode.index));
  }

  _showCreatePage(HomeNavigationCreateEvent event, Emitter<HomeNavigationState> emit) {
    emit(HomeNavigationSelectPageState(index: HomePageNavigationMenuType.createBarcode.index));
  }
}
