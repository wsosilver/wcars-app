import 'dart:convert';

import 'package:wcars/data/local/shared_preferences.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/user/user_entity.dart';

@injectable
class AuthLocalDataSource {
  final SharedPreferencesManager _sharedPreferences;

  AuthLocalDataSource(this._sharedPreferences);

  Future<String?> getToken() async {
    return _sharedPreferences.getString(SharedPreferencesManager.token);
  }

  void saveToken(String entity) {
    _sharedPreferences.putString(SharedPreferencesManager.token, entity);
  }

  Future cleanDataLocal() async {
    return _sharedPreferences.removeAll();
  }
}
