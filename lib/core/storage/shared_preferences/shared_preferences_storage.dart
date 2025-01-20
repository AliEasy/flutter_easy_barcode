import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class SharedPreferencesStorage {
  final String _usedApplicationOnce = 'usedApplicationOnce';
  final String _ratedAppOnce = 'ratedAppOnce';
  final SharedPreferences _prefs;

  SharedPreferencesStorage(this._prefs);

  Future<void> usedApplicationOnceSetter() async {
    await _prefs.setBool(_usedApplicationOnce, true);
  }

  Future<bool?> usedApplicationOnceGetter() async {
    return _prefs.getBool(_usedApplicationOnce);
  }

  Future<void> ratedAppOnceSetter() async {
    await _prefs.setBool(_ratedAppOnce, true);
  }

  Future<bool?> ratedAppOnceGetter() async {
    return _prefs.getBool(_ratedAppOnce);
  }
}
