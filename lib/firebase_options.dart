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
        return macos;
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
    apiKey: 'AIzaSyDIG5j6VE_vb81NwG4KkizybI-CHW7xmvg',
    appId: '1:1096317344633:web:f8f8987405f28760e72da8',
    messagingSenderId: '1096317344633',
    projectId: 'monitoring-plta-a0dd6',
    authDomain: 'monitoring-plta-a0dd6.firebaseapp.com',
    databaseURL: 'https://monitoring-plta-a0dd6-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'monitoring-plta-a0dd6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCanFhogl0Lb4vygrj_X8GZNGKrJslYYfI',
    appId: '1:1096317344633:android:bafcd2697f8010e2e72da8',
    messagingSenderId: '1096317344633',
    projectId: 'monitoring-plta-a0dd6',
    databaseURL: 'https://monitoring-plta-a0dd6-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'monitoring-plta-a0dd6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAt3XMcNHlRQuIDqPBioKY_UbLw90yBDgQ',
    appId: '1:1096317344633:ios:674a92cff9780ee5e72da8',
    messagingSenderId: '1096317344633',
    projectId: 'monitoring-plta-a0dd6',
    databaseURL: 'https://monitoring-plta-a0dd6-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'monitoring-plta-a0dd6.appspot.com',
    iosBundleId: 'com.example.plta',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAt3XMcNHlRQuIDqPBioKY_UbLw90yBDgQ',
    appId: '1:1096317344633:ios:674a92cff9780ee5e72da8',
    messagingSenderId: '1096317344633',
    projectId: 'monitoring-plta-a0dd6',
    databaseURL: 'https://monitoring-plta-a0dd6-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'monitoring-plta-a0dd6.appspot.com',
    iosBundleId: 'com.example.plta',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDIG5j6VE_vb81NwG4KkizybI-CHW7xmvg',
    appId: '1:1096317344633:web:91a4979879f7ab86e72da8',
    messagingSenderId: '1096317344633',
    projectId: 'monitoring-plta-a0dd6',
    authDomain: 'monitoring-plta-a0dd6.firebaseapp.com',
    databaseURL: 'https://monitoring-plta-a0dd6-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'monitoring-plta-a0dd6.appspot.com',
  );

}