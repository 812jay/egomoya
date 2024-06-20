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
    apiKey: 'AIzaSyAGh6vu5R-GYvFuSvbOiuJcWWRAN1IhAtc',
    appId: '1:741798797945:web:69551efcff5f3b0583aaa8',
    messagingSenderId: '741798797945',
    projectId: 'egomoya-feca6',
    authDomain: 'egomoya-feca6.firebaseapp.com',
    databaseURL: 'https://egomoya-feca6-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'egomoya-feca6.appspot.com',
    measurementId: 'G-98CHXD1RSB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDWdMfBca6X-9DYIZYYRtghnegd_0-yRnA',
    appId: '1:741798797945:android:c9862c4fe61025cd83aaa8',
    messagingSenderId: '741798797945',
    projectId: 'egomoya-feca6',
    databaseURL: 'https://egomoya-feca6-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'egomoya-feca6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDnwSEMOa-pxSjwjUxLzOKuhq6wCbltR5U',
    appId: '1:741798797945:ios:9a120dc955f33c2383aaa8',
    messagingSenderId: '741798797945',
    projectId: 'egomoya-feca6',
    databaseURL: 'https://egomoya-feca6-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'egomoya-feca6.appspot.com',
    androidClientId: '741798797945-qg3cvdf1qv16eufsqi5on784f40pje0u.apps.googleusercontent.com',
    iosClientId: '741798797945-c0gsk8hm151ar2fv0n1v5kq6rmhqbvnf.apps.googleusercontent.com',
    iosBundleId: 'com.team.egomoya',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDnwSEMOa-pxSjwjUxLzOKuhq6wCbltR5U',
    appId: '1:741798797945:ios:9a120dc955f33c2383aaa8',
    messagingSenderId: '741798797945',
    projectId: 'egomoya-feca6',
    databaseURL: 'https://egomoya-feca6-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'egomoya-feca6.appspot.com',
    androidClientId: '741798797945-qg3cvdf1qv16eufsqi5on784f40pje0u.apps.googleusercontent.com',
    iosClientId: '741798797945-c0gsk8hm151ar2fv0n1v5kq6rmhqbvnf.apps.googleusercontent.com',
    iosBundleId: 'com.team.egomoya',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAGh6vu5R-GYvFuSvbOiuJcWWRAN1IhAtc',
    appId: '1:741798797945:web:781146d20ff0453d83aaa8',
    messagingSenderId: '741798797945',
    projectId: 'egomoya-feca6',
    authDomain: 'egomoya-feca6.firebaseapp.com',
    databaseURL: 'https://egomoya-feca6-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'egomoya-feca6.appspot.com',
    measurementId: 'G-L7RKN7HV86',
  );
}
