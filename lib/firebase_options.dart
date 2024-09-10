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
    apiKey: 'AIzaSyBMx8odDKiTrA1hUUBMb48fjvN70Ysyokc',
    appId: '1:1035392917774:web:00a50e6063285e7d5cf75f',
    messagingSenderId: '1035392917774',
    projectId: 'interior-design-app-f5061',
    authDomain: 'interior-design-app-f5061.firebaseapp.com',
    storageBucket: 'interior-design-app-f5061.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDFb7zojxgOWuQ7D1DsL9yX-Ha5ISt1ce8',
    appId: '1:1035392917774:android:4a064531023697da5cf75f',
    messagingSenderId: '1035392917774',
    projectId: 'interior-design-app-f5061',
    storageBucket: 'interior-design-app-f5061.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAJ96eFJ0D49qXHqk26WNiv8pu4WqVFOJw',
    appId: '1:1035392917774:ios:44f8d4ce14bbb6cc5cf75f',
    messagingSenderId: '1035392917774',
    projectId: 'interior-design-app-f5061',
    storageBucket: 'interior-design-app-f5061.appspot.com',
    androidClientId: '1035392917774-394s6fhm2p7ovg8bkhnumkk8mh6uc3th.apps.googleusercontent.com',
    iosClientId: '1035392917774-qab9c8mf6jnfh66cehql5rahgvm6lmrq.apps.googleusercontent.com',
    iosBundleId: 'com.zoh.interiorDesign',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBMx8odDKiTrA1hUUBMb48fjvN70Ysyokc',
    appId: '1:1035392917774:web:966d189b3ee2a0005cf75f',
    messagingSenderId: '1035392917774',
    projectId: 'interior-design-app-f5061',
    authDomain: 'interior-design-app-f5061.firebaseapp.com',
    storageBucket: 'interior-design-app-f5061.appspot.com',
  );

}