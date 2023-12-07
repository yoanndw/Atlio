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
    apiKey: 'AIzaSyA1zL6KremPP1qm9BtLP_9rD2e-LbNAG1I',
    appId: '1:842648591663:web:3810ac5c2b250a47db15da',
    messagingSenderId: '842648591663',
    projectId: 'project-ofb',
    authDomain: 'project-ofb.firebaseapp.com',
    storageBucket: 'project-ofb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDgnCsnXGrNl7ZvFPy76ywC2dp8DghIfxw',
    appId: '1:842648591663:android:3bc0553a798055f2db15da',
    messagingSenderId: '842648591663',
    projectId: 'project-ofb',
    storageBucket: 'project-ofb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDR50aqHlB4-NUAFiXv4Mnn-kmsyJYZReA',
    appId: '1:842648591663:ios:b505d01f13f4e3e6db15da',
    messagingSenderId: '842648591663',
    projectId: 'project-ofb',
    storageBucket: 'project-ofb.appspot.com',
    iosBundleId: 'com.example.projectOfb',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDR50aqHlB4-NUAFiXv4Mnn-kmsyJYZReA',
    appId: '1:842648591663:ios:9d960ce4ab4ffcc0db15da',
    messagingSenderId: '842648591663',
    projectId: 'project-ofb',
    storageBucket: 'project-ofb.appspot.com',
    iosBundleId: 'com.example.projectOfb.RunnerTests',
  );
}
