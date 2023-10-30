// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyC9HYIoru4r59qUIDiosit2OIQrwx4_Pi4',
    appId: '1:399064326894:web:8631e2df756155a71109ff',
    messagingSenderId: '399064326894',
    projectId: 'foodbnb-web-app',
    authDomain: 'foodbnb-web-app.firebaseapp.com',
    storageBucket: 'foodbnb-web-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBFzfnTqhT57dvvvdBX1KvWfj1gkPz5O2A',
    appId: '1:399064326894:android:84851b0fdaf5300c1109ff',
    messagingSenderId: '399064326894',
    projectId: 'foodbnb-web-app',
    storageBucket: 'foodbnb-web-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC9uKD3L26e9PNS75sbxSBM9mtaGEkY4-k',
    appId: '1:399064326894:ios:8059c3511292401d1109ff',
    messagingSenderId: '399064326894',
    projectId: 'foodbnb-web-app',
    storageBucket: 'foodbnb-web-app.appspot.com',
    iosBundleId: 'com.example.cookForMe',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC9uKD3L26e9PNS75sbxSBM9mtaGEkY4-k',
    appId: '1:399064326894:ios:22c2f16936c8f95e1109ff',
    messagingSenderId: '399064326894',
    projectId: 'foodbnb-web-app',
    storageBucket: 'foodbnb-web-app.appspot.com',
    iosBundleId: 'com.example.cookForMe.RunnerTests',
  );
}
