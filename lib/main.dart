import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_multi_auth_guide/app.dart';
import 'package:firebase_multi_auth_guide/firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FirebaseMultiAuthGuide());
}
