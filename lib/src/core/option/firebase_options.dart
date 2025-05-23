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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAP2XaGk8a7lBz_DOwhpLT6Z7Pgl5Ddx3g',
    appId: '1:428638439071:android:3dbaaf2ce54d02a7d444aa',
    messagingSenderId: '428638439071',
    projectId: 'akgamarra-cadd3',
    storageBucket: 'akgamarra-cadd3.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCFo2C-lcDphclcH_yZDeC2VLflRdLQQF0',
    appId: '1:428638439071:ios:5f093c89ed0828ebd444aa',
    messagingSenderId: '428638439071',
    projectId: 'akgamarra-cadd3',
    storageBucket: 'akgamarra-cadd3.firebasestorage.app',
    androidClientId: '428638439071-hdm374uk8i9k9sgre3do9mbsmcttmred.apps.googleusercontent.com',
    iosClientId: '428638439071-9ld60q3q97c4kmf5kldtpmjgv37esksm.apps.googleusercontent.com',
    iosBundleId: 'com.gamarra.akgamarraApp',
  );

}