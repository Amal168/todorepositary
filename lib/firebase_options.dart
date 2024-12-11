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
    apiKey: 'AIzaSyCwXwyinY3R-vlS3uwQVoBcxBHW2Gf7guI',
    appId: '1:7662907252:web:c6cd1ff580f40196648621',
    messagingSenderId: '7662907252',
    projectId: 'todo-c69da',
    authDomain: 'todo-c69da.firebaseapp.com',
    storageBucket: 'todo-c69da.firebasestorage.app',
    measurementId: 'G-BFHV6LV13Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB68ULVcFryKIyI4zPVI1JckAy-JCYHOdQ',
    appId: '1:7662907252:android:41a6fc7518fd3be4648621',
    messagingSenderId: '7662907252',
    projectId: 'todo-c69da',
    storageBucket: 'todo-c69da.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBtnT48OmSZ__uFAaL49buOSd9V5V3Ldyo',
    appId: '1:7662907252:ios:6f0a9439788ed678648621',
    messagingSenderId: '7662907252',
    projectId: 'todo-c69da',
    storageBucket: 'todo-c69da.firebasestorage.app',
    iosBundleId: 'com.example.todoexample',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBtnT48OmSZ__uFAaL49buOSd9V5V3Ldyo',
    appId: '1:7662907252:ios:6f0a9439788ed678648621',
    messagingSenderId: '7662907252',
    projectId: 'todo-c69da',
    storageBucket: 'todo-c69da.firebasestorage.app',
    iosBundleId: 'com.example.todoexample',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCwXwyinY3R-vlS3uwQVoBcxBHW2Gf7guI',
    appId: '1:7662907252:web:3ea2ad0312107b28648621',
    messagingSenderId: '7662907252',
    projectId: 'todo-c69da',
    authDomain: 'todo-c69da.firebaseapp.com',
    storageBucket: 'todo-c69da.firebasestorage.app',
    measurementId: 'G-F8D5MVZBB7',
  );
}