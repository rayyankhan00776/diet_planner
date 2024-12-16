import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // Function for Google Sign-In
  static Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Firebase Authentication
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        return userCredential.user; // Return signed-in user
      }
    } catch (e) {
      print("Error during Google Sign-In: $e");
      throw Exception("Google Sign-In failed: $e");
    }
    return null;
  }

  // Function to log out
  static Future<void> signOutGoogle() async {
    await GoogleSignIn().signOut();
    await _auth.signOut();
  }
}
