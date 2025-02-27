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
    apiKey: 'AIzaSyBJSME-esg0733XZEdC6uDytgpPaer-EME',
    appId: '1:437059276079:web:028441e61002fc41fa25da',
    messagingSenderId: '437059276079',
    projectId: 'marcus2-709fb',
    authDomain: 'marcus2-709fb.firebaseapp.com',
    storageBucket: 'marcus2-709fb.appspot.com',
    measurementId: 'G-ZFEKQM0S84',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZApdrcp-DQvJktkk2WQ-EFHqWfyXOnhM',
    appId: '1:437059276079:android:9944d22582cb1d70fa25da',
    messagingSenderId: '437059276079',
    projectId: 'marcus2-709fb',
    storageBucket: 'marcus2-709fb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCsVI7ozUIEluX69kPYXkBT5117I56Qz7U',
    appId: '1:437059276079:ios:954323d49e3d9047fa25da',
    messagingSenderId: '437059276079',
    projectId: 'marcus2-709fb',
    storageBucket: 'marcus2-709fb.appspot.com',
    iosBundleId: 'com.example.richieTheWaiter',
  );

}