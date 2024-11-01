import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  String _email = '';
  String _password = '';

  String get email => _email;
  String get password => _password;

  void updateEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void updatePassword(String password) {
    _password = password;
    notifyListeners();
  }

  bool get isLoginValid => _email.isNotEmpty && _password.isNotEmpty;

  void clearFields() {
    _email = '';
    _password = '';
    notifyListeners();
  }
}
