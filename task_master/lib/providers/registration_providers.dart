import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _fullName = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  String _errorMessage = '';

  String get fullName => _fullName;
  String get email => _email;
  String get password => _password;
  String get confirmPassword => _confirmPassword;
  String get errorMessage => _errorMessage;

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

  Future<void> registerUser() async {
    try {
      if (_password != _confirmPassword) {
        throw Exception("Passwords do not match");
      }

      await _auth.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      // Optionally update the user's profile with their full name
      await _auth.currentUser?.updateDisplayName(_fullName);
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  void clearErrorMessage() {
    _errorMessage = '';
    notifyListeners();
  }
}
