import 'package:firebase_multi_auth_guide/pages/register_page.dart';
import 'package:firebase_multi_auth_guide/widgets/full_width_button.dart';
import 'package:firebase_multi_auth_guide/widgets/google_sign_in_button.dart';
import 'package:firebase_multi_auth_guide/widgets/login_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Login',
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
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Choose your preferred login method',
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
                    LoginButton(
                      text: 'Facebook',
                      color: Colors.blue.shade600,
                      icon: Icons.facebook,
                      onPressed: () {},
                    ),
                    LoginButton(
                      text: 'Twitter',
                      color: Colors.lightBlue.shade400,
                      icon: Icons.alternate_email,
                      onPressed: () {},
                    ),
                    LoginButton(
                      text: 'GitHub',
                      color: Colors.black87,
                      icon: Icons.code,
                      onPressed: () {},
                    ),
                    LoginButton(
                      text: 'Microsoft',
                      color: Colors.blue.shade800,
                      icon: Icons.window,
                      onPressed: () {},
                    ),
                    LoginButton(
                      text: 'Apple',
                      color: Colors.black,
                      icon: Icons.apple,
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                const Text(
                  'Or continue with',
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
                const SizedBox(height: 16),
                FullWidthButton(
                  text: 'Continue as Guest',
                  color: Colors.grey.shade700,
                  icon: Icons.person_outline,
                  onPressed: () {},
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account? ',
                      style: TextStyle(color: Colors.black54),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign up',
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
