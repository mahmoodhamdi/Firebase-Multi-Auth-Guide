import 'package:firebase_multi_auth_guide/pages/register_page.dart';
import 'package:flutter/material.dart';

class FirebaseMultiAuthGuide extends StatelessWidget {
  const FirebaseMultiAuthGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Firebase Multi Auth Guide',
      home:RegisterPage(),
      
    );
  }
}
