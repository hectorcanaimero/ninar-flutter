import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAkcvRUVk2uqU6zmFe6xjwFoSfoZ_19pus",
            authDomain: "ninar-ia.firebaseapp.com",
            projectId: "ninar-ia",
            storageBucket: "ninar-ia.appspot.com",
            messagingSenderId: "501736925371",
            appId: "1:501736925371:web:fe7b47d95de6394524e19e",
            measurementId: "G-2ET339RVTH"));
  } else {
    await Firebase.initializeApp();
  }
}
