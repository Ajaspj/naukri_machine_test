import 'package:flutter/material.dart';
import 'package:naukri_machine_test/database/database_helper.dart';

class UserProvider with ChangeNotifier {
  String _username = '';
  int _value = 0;
  final DatabaseHelper _dbHelper = DatabaseHelper();

  String get username => _username;
  int get value => _value;

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  Future<void> register(String username, String password) async {
    await _dbHelper.insertUser(username, password);
  }

  Future<void> login(String username, String password) async {
    final user = await _dbHelper.getUser(username, password);
    if (user != null) {
      _username = username;
      _value = user['value'];
      notifyListeners();
    } else {
      throw 'Invalid login credentials';
    }
  }

  Future<void> incrementValue() async {
    _value++;
    await _dbHelper.updateUserValue(_username, _value);
    notifyListeners();
  }

  Future<void> logout() async {
    _username = '';
    _value = 0;
    notifyListeners();
  }
}
