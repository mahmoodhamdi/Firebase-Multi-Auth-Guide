import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class AuthResult {
  final bool success;
  final UserCredential? userCredential;
  final String message;

  AuthResult({
    required this.success,
    this.userCredential,
    required this.message,
  });
}

class AuthWithGoogleHelper {
  static Future<AuthResult> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // User canceled the sign-in flow
      if (googleUser == null) {
        return AuthResult(
          success: false,
          message: 'Sign in cancelled by user',
        );
      }

      try {
        // Obtain the auth details from the request
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // Log user information for debugging
        log('User Email: ${googleUser.email}');
        log('User Name: ${googleUser.displayName}');
        log('User Photo URL: ${googleUser.photoUrl ?? "No photo"}');

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Sign in to Firebase with the Google credential
        final userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        return AuthResult(
          success: true,
          userCredential: userCredential,
          message: 'Successfully signed in with Google',
        );
      } catch (e) {
        log('Error during Google authentication: $e');
        return AuthResult(
          success: false,
          message: 'Failed to authenticate with Google. Please try again.',
        );
      }
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException: $e');
      String message;
      switch (e.code) {
        case 'account-exists-with-different-credential':
          message =
              'An account already exists with the same email but different sign-in credentials.';
          break;
        case 'invalid-credential':
          message = 'The authentication credential is invalid.';
          break;
        case 'operation-not-allowed':
          message = 'Google sign-in is not enabled for this project.';
          break;
        case 'user-disabled':
          message = 'This user account has been disabled.';
          break;
        case 'user-not-found':
          message = 'No user found for that email.';
          break;
        default:
          message = 'An unknown error occurred. Please try again.';
      }
      return AuthResult(success: false, message: message);
    } catch (e) {
      log('Unexpected error during Google sign in: $e');
      return AuthResult(
        success: false,
        message: 'An unexpected error occurred. Please try again.',
      );
    }
  }
}

// Extension to show SnackBars more easily
extension ShowSnackBar on BuildContext {
  void showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green.shade600,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  void showErrorSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.red.shade600,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: const Duration(seconds: 4),
      ),
    );
  }
}
