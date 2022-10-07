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
    apiKey: 'AIzaSyCV972slTV2iueoXDKLPy_0LaWWefOVkRQ',
    appId: '1:551263021127:web:d8c698baf65dfc3883e962',
    messagingSenderId: '551263021127',
    projectId: 'fir-test-74bb3',
    authDomain: 'fir-test-74bb3.firebaseapp.com',
    databaseURL: 'https://fir-test-74bb3.firebaseio.com',
    storageBucket: 'fir-test-74bb3.appspot.com',
    measurementId: 'G-992BRXJLDG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCV2JucTa82y8SOISJN9oC1Uj1_aZS16HA',
    appId: '1:551263021127:android:1e4ce3b5ecb1c08783e962',
    messagingSenderId: '551263021127',
    projectId: 'fir-test-74bb3',
    databaseURL: 'https://fir-test-74bb3.firebaseio.com',
    storageBucket: 'fir-test-74bb3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDY7A23j6okE4HlePfdxE8c04oytDZ3dr8',
    appId: '1:551263021127:ios:6f7cb35478ee8a2a83e962',
    messagingSenderId: '551263021127',
    projectId: 'fir-test-74bb3',
    databaseURL: 'https://fir-test-74bb3.firebaseio.com',
    storageBucket: 'fir-test-74bb3.appspot.com',
    iosClientId: '551263021127-5bvakak461ic070j2v7744hkbfdkcbn5.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseAssignment2',
  );
}
