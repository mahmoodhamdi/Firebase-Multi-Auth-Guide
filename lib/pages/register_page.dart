import 'package:firebase_multi_auth_guide/pages/login_page_.dart';
import 'package:firebase_multi_auth_guide/widgets/google_sign_in_button.dart';
import 'package:firebase_multi_auth_guide/widgets/full_width_button.dart';
import 'package:firebase_multi_auth_guide/widgets/sign_up_button.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Choose your preferred signup method',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 32),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 2.5,
                  children: [
                    const GoogleSignInButton(),
                    SignUpButton(
                      text: 'Facebook',
                      color: Colors.blue.shade600,
                      icon: Icons.facebook,
                      onPressed: () {},
                    ),
                    SignUpButton(
                      text: 'Twitter',
                      color: Colors.lightBlue.shade400,
                      icon: Icons.alternate_email,
                      onPressed: () {},
                    ),
                    SignUpButton(
                      text: 'GitHub',
                      color: Colors.black87,
                      icon: Icons.code,
                      onPressed: () {},
                    ),
                    SignUpButton(
                      text: 'Microsoft',
                      color: Colors.blue.shade800,
                      icon: Icons.window,
                      onPressed: () {},
                    ),
                    SignUpButton(
                      text: 'Apple',
                      color: Colors.black,
                      icon: Icons.apple,
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                const Text(
                  'Or create account with',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 24),
                FullWidthButton(
                  text: 'Email and Password',
                  color: Colors.deepPurple.shade400,
                  icon: Icons.email,
                  onPressed: () {},
                ),
                const SizedBox(height: 16),
                FullWidthButton(
                  text: 'Phone Number',
                  color: Colors.green.shade600,
                  icon: Icons.phone,
                  onPressed: () {},
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(color: Colors.black54),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
