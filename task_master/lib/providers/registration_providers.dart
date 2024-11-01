import 'package:flutter/material.dart';

class RegistrationProvider with ChangeNotifier {
  String _fullName = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  String get fullName => _fullName;
  String get email => _email;
  String get password => _password;
  String get confirmPassword => _confirmPassword;

  void updateFullName(String name) {
    _fullName = name;
    notifyListeners();
  }

  void updateEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void updatePassword(String password) {
    _password = password;
    notifyListeners();
  }

  void updateConfirmPassword(String confirmPassword) {
    _confirmPassword = confirmPassword;
    notifyListeners();
  }
}
