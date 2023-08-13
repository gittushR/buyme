import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (Platform.isIOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        appId: '',
        apiKey: '',
        projectId: '',
        messagingSenderId: '',
        iosBundleId: '',
      );
    } else {
      // Android
      return const FirebaseOptions(
        apiKey: 'AIzaSyARaVohBmwQnuGmxTTUn5PpmE8TWOiw2aY',
        appId: '1:1036429344343:android:fd603aca5d214ecf262d12',
        messagingSenderId: '1036429344343',
        projectId: 'grid-a561d',
      );
    }
  }
}
