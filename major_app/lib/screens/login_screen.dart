// login_screen.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:major_app/screens/optional_page.dart';
import 'package:major_app/widgets/custom_textfield.dart'; // Import the custom textfield
import 'package:major_app/widgets/social_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Controllers for the TextFields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Sign in with Google
  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await _firebaseAuth.signInWithCredential(credential);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const OptionalPage()));
      }
    } catch (e) {
      showToast(message: 'Error: $e');
    }
  }

  // Sign in with email and password
  Future<void> _signInWithEmailPassword() async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const OptionalPage()));
    } catch (e) {
      showToast(message: 'Invalid credentials or error: $e');
    }
  }

  // Show Toast Message
  void showToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal.shade200, Colors.teal.shade900],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: 300,
              height: 550,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 15,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Text(
                      'Login / Signup',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Email Field
                  CustomTextField(
                    controller: emailController,
                    hintText: 'Enter your email',
                    icon: Icon(Icons.email, color: Colors.teal.shade200),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  // Password Field
                  CustomTextField(
                    controller: passwordController,
                    hintText: 'Enter your password',
                    isPassword: true,
                    icon: Icon(Icons.lock, color: Colors.teal.shade200),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (value.length < 10) {
                        return 'Password must be at least 10 characters';
                      }
                      if (!RegExp(
                              r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{10,}$')
                          .hasMatch(value)) {
                        return 'Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  // Login Button (Email and Password)
                  ElevatedButton(
                    onPressed: _signInWithEmailPassword,
                    child: Text('Login with Email'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal.shade400,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Google Login Button
                  SocialButton(
                    text: 'Continue with Google',
                    color: Colors.red.shade600,
                    imagePath: 'assets/google.png', // Ensure correct path
                    onPressed: _signInWithGoogle,
                  ),
                  const SizedBox(height: 10),
                  // Facebook Login Button
                  SocialButton(
                    text: 'Continue with Facebook',
                    color: Colors.blue.shade800,
                    imagePath: 'assets/facebook.png', // Ensure correct path
                    onPressed: () {
                      // Add Facebook login functionality here
                    },
                  ),
                  const SizedBox(height: 10),
                  // Twitter Login Button
                  SocialButton(
                    text: 'Continue with Twitter',
                    color: Colors.lightBlue,
                    imagePath: 'assets/twitter.png', // Ensure correct path
                    onPressed: () {
                      // Add Twitter login functionality here
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
