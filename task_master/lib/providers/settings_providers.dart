import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  String _username = 'User';
  String _password = '';
  String _language = 'English';

  String get username => _username;
  String get password => _password;
  String get language => _language;

  void updateUsername(String newUsername) {
    _username = newUsername;
    notifyListeners();
  }

  void updatePassword(String newPassword) {
    _password = newPassword;
    notifyListeners();
  }

  void updateLanguage(String newLanguage) {
    _language = newLanguage;
    notifyListeners();
  }
}
