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
    apiKey: 'AIzaSyCOkuGBruc2wUdByKyqbLS7AbW6CQ8ru5A',
    appId: '1:147905671802:web:f052afa0a80e69cb0401c3',
    messagingSenderId: '147905671802',
    projectId: 'note-app-3dd3f',
    authDomain: 'note-app-3dd3f.firebaseapp.com',
    storageBucket: 'note-app-3dd3f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBy4auGo9W9kHrAEuChytXV4nOuZs3MAtE',
    appId: '1:147905671802:android:80a1213c11f6b5100401c3',
    messagingSenderId: '147905671802',
    projectId: 'note-app-3dd3f',
    storageBucket: 'note-app-3dd3f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAU1qfOtNHXPWWT0U3j0_sjdFwM2PZWhyM',
    appId: '1:147905671802:ios:806c63f199d35c7b0401c3',
    messagingSenderId: '147905671802',
    projectId: 'note-app-3dd3f',
    storageBucket: 'note-app-3dd3f.appspot.com',
    iosClientId: '147905671802-cplar1s096pdjc3la92ohkc8enc7eurj.apps.googleusercontent.com',
    iosBundleId: 'com.example.notesApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAU1qfOtNHXPWWT0U3j0_sjdFwM2PZWhyM',
    appId: '1:147905671802:ios:806c63f199d35c7b0401c3',
    messagingSenderId: '147905671802',
    projectId: 'note-app-3dd3f',
    storageBucket: 'note-app-3dd3f.appspot.com',
    iosClientId: '147905671802-cplar1s096pdjc3la92ohkc8enc7eurj.apps.googleusercontent.com',
    iosBundleId: 'com.example.notesApp',
  );
}
