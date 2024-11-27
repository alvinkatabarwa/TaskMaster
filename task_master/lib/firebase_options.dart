// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA5P3UUGY1rJtf8nxLhZUoPvoEtoKDMwC4',
    appId: '1:1080848613173:web:f79c56d2d85a377fcdd67c',
    messagingSenderId: '1080848613173',
    projectId: 'taskmaster-15c72',
    authDomain: 'taskmaster-15c72.firebaseapp.com',
    storageBucket: 'taskmaster-15c72.firebasestorage.app',
    measurementId: 'G-LMPHXZ5R73',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDP4iAOqTAAUo8CUkGqFko6ZVdS7H1pOBQ',
    appId: '1:1080848613173:android:e036581b2ec349f0cdd67c',
    messagingSenderId: '1080848613173',
    projectId: 'taskmaster-15c72',
    storageBucket: 'taskmaster-15c72.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAGiybuLy4R6JBkVtfIA23vYA9N4LsTFog',
    appId: '1:1080848613173:ios:ad3954b9865521f9cdd67c',
    messagingSenderId: '1080848613173',
    projectId: 'taskmaster-15c72',
    storageBucket: 'taskmaster-15c72.firebasestorage.app',
    iosBundleId: 'com.example.taskMaster',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAGiybuLy4R6JBkVtfIA23vYA9N4LsTFog',
    appId: '1:1080848613173:ios:ad3954b9865521f9cdd67c',
    messagingSenderId: '1080848613173',
    projectId: 'taskmaster-15c72',
    storageBucket: 'taskmaster-15c72.firebasestorage.app',
    iosBundleId: 'com.example.taskMaster',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA5P3UUGY1rJtf8nxLhZUoPvoEtoKDMwC4',
    appId: '1:1080848613173:web:8dd1128b98ae4bb7cdd67c',
    messagingSenderId: '1080848613173',
    projectId: 'taskmaster-15c72',
    authDomain: 'taskmaster-15c72.firebaseapp.com',
    storageBucket: 'taskmaster-15c72.firebasestorage.app',
    measurementId: 'G-MDV24HPW5W',
  );
}