import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _email = '';
  String _password = '';
  String _errorMessage = '';

  String get email => _email;
  String get password => _password;
  String get errorMessage => _errorMessage;

  /// Updates email field
  void updateEmail(String email) {
    _email = email;
    notifyListeners();
  }

  /// Updates password field
  void updatePassword(String password) {
    _password = password;
    notifyListeners();
  }

  /// Validates if login fields are filled
  bool get isLoginValid => _email.isNotEmpty && _password.isNotEmpty;

  /// Clears fields and error messages
  void clearFields() {
    _email = '';
    _password = '';
    _errorMessage = '';
    notifyListeners();
  }

  /// Log in the user with Firebase Authentication
  Future<void> loginUser() async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      clearErrorMessage();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  /// Log out the user
  Future<void> signOut() async {
    await _auth.signOut();
    clearFields();
  }

  /// Clears error messages
  void clearErrorMessage() {
    _errorMessage = '';
    notifyListeners();
  }
}
