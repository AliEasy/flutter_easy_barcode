import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easy_barcode/core/storage/shared_preferences/shared_preferences_storage.dart';
import 'package:injectable/injectable.dart';

part 'rate_app_event.dart';
part 'rate_app_state.dart';

@injectable
class RateAppBloc extends Bloc<RateAppEvent, RateAppState> {
  final SharedPreferencesStorage _sharedPreferencesStorage;

  RateAppBloc(this._sharedPreferencesStorage) : super(RateAppInitialState()) {
    on<CheckRatedAppEvent>(_checkRatedApp);
    add(CheckRatedAppEvent());
  }

  _checkRatedApp(CheckRatedAppEvent event, Emitter<RateAppState> emit) {
    emit(RateAppInitialState());
    final usedApplicationOnce = _sharedPreferencesStorage.usedApplicationOnceGetter() ?? false;
    final ratedAppOnce = _sharedPreferencesStorage.ratedAppOnceGetter() ?? false;
    if (usedApplicationOnce && !ratedAppOnce) {
      emit(RateAppNotHappenedState());
    }
  }
}
