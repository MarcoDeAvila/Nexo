import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD3xiyQ-z4OBGJaQUer48wx6tDb_Dx_Dwc",
            authDomain: "nexo-db-e06b8.firebaseapp.com",
            projectId: "nexo-db-e06b8",
            storageBucket: "nexo-db-e06b8.appspot.com",
            messagingSenderId: "395590516813",
            appId: "1:395590516813:web:fa7d3d4fd306a15d205c04",
            measurementId: "G-QSL2R9PLET"));
  } else {
    await Firebase.initializeApp();
  }
}
