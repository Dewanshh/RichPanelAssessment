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
    apiKey: 'AIzaSyCAbzKoXHFPbyKd9rC_NCwGl7B7DJxm1IY',
    appId: '1:831645721920:web:749e99696725022d8786a5',
    messagingSenderId: '831645721920',
    projectId: 'nodecrud-ec086',
    authDomain: 'nodecrud-ec086.firebaseapp.com',
    storageBucket: 'nodecrud-ec086.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB6764g6Z-CaceLxAs2vqaD7pKsPaYN5r4',
    appId: '1:831645721920:android:1e9e07a1fa305d278786a5',
    messagingSenderId: '831645721920',
    projectId: 'nodecrud-ec086',
    storageBucket: 'nodecrud-ec086.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBHMqUdV9HbBZllGTJq2IWFB4vnyBuG6-s',
    appId: '1:831645721920:ios:adf4f8383dd35dad8786a5',
    messagingSenderId: '831645721920',
    projectId: 'nodecrud-ec086',
    storageBucket: 'nodecrud-ec086.appspot.com',
    androidClientId: '831645721920-5gidaq8l2h9k9h05l946a2fhdhfnsao9.apps.googleusercontent.com',
    iosClientId: '831645721920-r5mcsbtpd45a2t2jo6opji6shbhecirb.apps.googleusercontent.com',
    iosBundleId: 'com.example.richpanel',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBHMqUdV9HbBZllGTJq2IWFB4vnyBuG6-s',
    appId: '1:831645721920:ios:95bedc74977481f18786a5',
    messagingSenderId: '831645721920',
    projectId: 'nodecrud-ec086',
    storageBucket: 'nodecrud-ec086.appspot.com',
    androidClientId: '831645721920-5gidaq8l2h9k9h05l946a2fhdhfnsao9.apps.googleusercontent.com',
    iosClientId: '831645721920-fanfi7ddo526grllmbr9o8sab5ps9g7s.apps.googleusercontent.com',
    iosBundleId: 'com.example.richpanel.RunnerTests',
  );
}