// import 'dart:io';
// import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform;
// import 'package:firebase_core/firebase_core.dart';
//
// // FirebaseOptions firebaseOptions=  const FirebaseOptions(
// //     apiKey: 'AIzaSyCuePtnWKmrJwRbb3OhNmOkBeJugXbCAyk',
// //     appId: '1:738504089346:android:1c5da95f1fca0bd7faec1b',
// //     messagingSenderId: '738504089346',
// //     projectId: 'ofsa-3c2fc'
// // );
//
// //Platform.isAndroid ?
// //
// // use this if not working , the code , but this is useful when u use both the systems ios and android
// //platform.isAndroid ? is used before the firebase (apikey:...)
// //this is used to specify the operating system of the machine , but as of  now i am working on the android so that
// //i am not using ios part and there for i dont feel need to specify the details of the platforms
// // because from starting i dont write any bit of code and database connection code for ios
// // import 'package:firebase_core/firebase_core.dart';
//
//
// class DefaultFirebaseOptions {
//   static FirebaseOptions get currentPlatform {
//     if (defaultTargetPlatform == TargetPlatform.android) {
//       return _android;
//     } else if (defaultTargetPlatform == TargetPlatform.iOS) {
//       return _iOS;
//     }
//     throw UnsupportedError('DefaultFirebaseOptions are not supported for this platform.');
//   }
//   //static FirebaseOptions get currentPlatform{
//   // de
//   // }
//   //
//   //
//
//   static const FirebaseOptions _android = FirebaseOptions(
//     apiKey: 'AIzaSyCuePtnWKmrJwRbb3OhNmOkBeJugXbCAyk',
//     appId: '1:738504089346:android:1c5da95f1fca0bd7faec1b',
//     messagingSenderId: '738504089346',
//     projectId: 'ofsa-3c2fc',
//     storageBucket: 'gs://ofsa-3c2fc.appspot.com',
//   );
//
//   static const FirebaseOptions _iOS = FirebaseOptions(
//     apiKey: 'your-api-key',
//     appId: 'your-app-id',
//     messagingSenderId: 'your-messaging-sender-id',
//     projectId: 'your-project-id',
//     storageBucket: 'your-storage-bucket',
//     iosClientId: 'your-ios-client-id',
//     iosBundleId: 'your-ios-bundle-id',
//   );
// }
import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  // Return FirebaseOptions for Android only
  static FirebaseOptions get android => _android;

  static const FirebaseOptions _android = FirebaseOptions(
    apiKey: 'AIzaSyCuePtnWKmrJwRbb3OhNmOkBeJugXbCAyk', // Replace with your Firebase API key
    appId: '1:738504089346:android:1c5da95f1fca0bd7faec1b', // Replace with your Firebase App ID
    messagingSenderId: '738504089346', // Replace with your Firebase Messaging Sender ID
    projectId: 'ofsa-3c2fc', // Replace with your Firebase Project ID
    storageBucket: 'gs://ofsa-3c2fc.appspot.com', // Replace with your Firebase Storage Bucket URL
  );
}
