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
    apiKey: 'AIzaSyD7SXUypETinkKoS5vivA3HtgUUjnN-FFk',
    appId: '1:372969643221:web:310b65e05957002704565c',
    messagingSenderId: '372969643221',
    projectId: 'rwu-cafeteria-system',
    authDomain: 'rwu-cafeteria-system.firebaseapp.com',
    storageBucket: 'rwu-cafeteria-system.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBQdZtzUnUsjdlGeBeYgn4791pppYl-wTY',
    appId: '1:372969643221:android:1969f4d6b1c81b0404565c',
    messagingSenderId: '372969643221',
    projectId: 'rwu-cafeteria-system',
    storageBucket: 'rwu-cafeteria-system.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCjJ2vBXfNxDOVjCjE6zIDuvsXKJj85N44',
    appId: '1:372969643221:ios:8581befa2c00d18404565c',
    messagingSenderId: '372969643221',
    projectId: 'rwu-cafeteria-system',
    storageBucket: 'rwu-cafeteria-system.appspot.com',
    iosClientId: '372969643221-t7ni1uv87fm85rsgrnibet5jorradvd0.apps.googleusercontent.com',
    iosBundleId: 'com.example.rwuCafeteriaSystem',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCjJ2vBXfNxDOVjCjE6zIDuvsXKJj85N44',
    appId: '1:372969643221:ios:8581befa2c00d18404565c',
    messagingSenderId: '372969643221',
    projectId: 'rwu-cafeteria-system',
    storageBucket: 'rwu-cafeteria-system.appspot.com',
    iosClientId: '372969643221-t7ni1uv87fm85rsgrnibet5jorradvd0.apps.googleusercontent.com',
    iosBundleId: 'com.example.rwuCafeteriaSystem',
  );
}
