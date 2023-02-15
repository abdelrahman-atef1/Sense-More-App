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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCC1Pbz0PGlbckghHFLQLYaIzSBvH7_460',
    appId: '1:609355298811:web:eb8c2ef2f5d62fc7933d5e',
    messagingSenderId: '609355298811',
    projectId: 'sensemore-6c16d',
    authDomain: 'sensemore-6c16d.firebaseapp.com',
    storageBucket: 'sensemore-6c16d.appspot.com',
    measurementId: 'G-0BVYNRDDCM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyClWKtRpg_OFaglgmjZyHKetiZv6fyKoOw',
    appId: '1:609355298811:android:71d08ddbc073dd17933d5e',
    messagingSenderId: '609355298811',
    projectId: 'sensemore-6c16d',
    storageBucket: 'sensemore-6c16d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCfhuX95ERbnhUpukp0nZXERDJiT8Tge8A',
    appId: '1:609355298811:ios:2a920dfed870c45e933d5e',
    messagingSenderId: '609355298811',
    projectId: 'sensemore-6c16d',
    storageBucket: 'sensemore-6c16d.appspot.com',
    iosClientId: '609355298811-12ghukmut84lvg28q991l2nmoo8u9lv8.apps.googleusercontent.com',
    iosBundleId: 'com.example.senseMore',
  );
}
