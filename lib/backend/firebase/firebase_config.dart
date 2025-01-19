import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAXdHxVFpZvK7aBSONYDu80MLhT1CwqJL4",
            authDomain: "test-35f1a.firebaseapp.com",
            projectId: "test-35f1a",
            storageBucket: "test-35f1a.firebasestorage.app",
            messagingSenderId: "821747544337",
            appId: "1:821747544337:web:7af6e0de8f02b6bd355cb0",
            measurementId: "G-8V3Z3T301V"));
  } else {
    await Firebase.initializeApp();
  }
}
