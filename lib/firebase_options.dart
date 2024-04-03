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
    apiKey: 'AIzaSyCu8l9esLN2IItMe8dYWDsL1rWbgFUU81g',
    appId: '1:1043687450778:web:a5071662c6bf2045339723',
    messagingSenderId: '1043687450778',
    projectId: 'ecommerceshoppingapp-8ee5c',
    authDomain: 'ecommerceshoppingapp-8ee5c.firebaseapp.com',
    storageBucket: 'ecommerceshoppingapp-8ee5c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBj7tUscS7C6NoKmbVQj41mcxfOM-DA72w',
    appId: '1:1043687450778:android:874639e3f5db1fc6339723',
    messagingSenderId: '1043687450778',
    projectId: 'ecommerceshoppingapp-8ee5c',
    storageBucket: 'ecommerceshoppingapp-8ee5c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZ-InmkPaxJyWKJ9H1GPNgt3oj_ywkSt4',
    appId: '1:1043687450778:ios:bcea4bffbfcb2a11339723',
    messagingSenderId: '1043687450778',
    projectId: 'ecommerceshoppingapp-8ee5c',
    storageBucket: 'ecommerceshoppingapp-8ee5c.appspot.com',
    androidClientId: '1043687450778-ob9oq5r44sjqqbmnksnin7pj2uq0hk24.apps.googleusercontent.com',
    iosClientId: '1043687450778-q5si7jfakqfgu8qbbcg3i3i1kravqq9u.apps.googleusercontent.com',
    iosBundleId: 'com.example.shopingApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCZ-InmkPaxJyWKJ9H1GPNgt3oj_ywkSt4',
    appId: '1:1043687450778:ios:dc3665f538ab9b03339723',
    messagingSenderId: '1043687450778',
    projectId: 'ecommerceshoppingapp-8ee5c',
    storageBucket: 'ecommerceshoppingapp-8ee5c.appspot.com',
    androidClientId: '1043687450778-ob9oq5r44sjqqbmnksnin7pj2uq0hk24.apps.googleusercontent.com',
    iosClientId: '1043687450778-bom5soh6q2iq9ngfuvruo0ihmsa6iqll.apps.googleusercontent.com',
    iosBundleId: 'com.example.shopingApp.RunnerTests',
  );
}
