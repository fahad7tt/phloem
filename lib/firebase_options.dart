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
    apiKey: 'AIzaSyCXUbPyaAvF1IM3-6j2NEP-8Cjj6YAGj2o',
    appId: '1:763978404775:web:297b463d44c8d397951c82',
    messagingSenderId: '763978404775',
    projectId: 'phloem-8a7f5',
    authDomain: 'phloem-8a7f5.firebaseapp.com',
    databaseURL: 'https://phloem-8a7f5-default-rtdb.firebaseio.com',
    storageBucket: 'phloem-8a7f5.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCLWyxMUnh2YCgZ5g9m42rdyLAUheyY708',
    appId: '1:763978404775:android:d4ab60de5442c87c951c82',
    messagingSenderId: '763978404775',
    projectId: 'phloem-8a7f5',
    databaseURL: 'https://phloem-8a7f5-default-rtdb.firebaseio.com',
    storageBucket: 'phloem-8a7f5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBEZwvSxvfwsb7ZBr1FzW6ca2Qn3z1GFkA',
    appId: '1:763978404775:ios:d8ff3ade6364a45f951c82',
    messagingSenderId: '763978404775',
    projectId: 'phloem-8a7f5',
    databaseURL: 'https://phloem-8a7f5-default-rtdb.firebaseio.com',
    storageBucket: 'phloem-8a7f5.appspot.com',
    androidClientId: '763978404775-ffdpcbep1jrbkrqqu2lk3kcb546bpjjq.apps.googleusercontent.com',
    iosClientId: '763978404775-bd2ahd448e32dui0k75ngnrtqdtlefe1.apps.googleusercontent.com',
    iosBundleId: 'com.example.phloemApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCXUbPyaAvF1IM3-6j2NEP-8Cjj6YAGj2o',
    appId: '1:763978404775:web:4301ec2c61df01c8951c82',
    messagingSenderId: '763978404775',
    projectId: 'phloem-8a7f5',
    authDomain: 'phloem-8a7f5.firebaseapp.com',
    databaseURL: 'https://phloem-8a7f5-default-rtdb.firebaseio.com',
    storageBucket: 'phloem-8a7f5.appspot.com',
  );

}