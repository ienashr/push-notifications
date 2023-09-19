import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBjuRQhJ_yKvjKXCVT9DEese9w9XILp6kU",
            authDomain: "learn-push-notifications-df837.firebaseapp.com",
            projectId: "learn-push-notifications-df837",
            storageBucket: "learn-push-notifications-df837.appspot.com",
            messagingSenderId: "381438344228",
            appId: "1:381438344228:web:c447198911e1280c3a2cb1"));
  } else {
    await Firebase.initializeApp();
  }
}
