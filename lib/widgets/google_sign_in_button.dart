import 'dart:developer';

import 'package:firebase_multi_auth_guide/helpers/auth_with_google.dart';
import 'package:firebase_multi_auth_guide/pages/home_page.dart';
import 'package:firebase_multi_auth_guide/widgets/sign_up_button.dart';
import 'package:flutter/material.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SignUpButton(
      text: 'Google',
      color: Colors.red.shade400,
      icon: Icons.g_mobiledata,
      onPressed: () async {
        // Show loading indicator
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );

        try {
          final result = await AuthWithGoogleHelper.signInWithGoogle();

          // Always pop the loading dialog
          Navigator.pop(context);

          if (result.success) {
            // Show success message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(result.message)),
            );

            // Navigate to home page
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomePage(
                  title:
                      'Welcome, ${result.userCredential?.user?.displayName ?? "User"}!',
                ),
              ),
            );
          } else {
            // Show error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(result.message)),
            );
          }
        } catch (e) {
          // Pop loading dialog in case of unexpected error
          Navigator.pop(context);

          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('An unexpected error occurred. Please try again.'),
            ),
          );

          // Log the error
          log('Error during Google sign in: $e');
        }
      },
    );
  }
}
