import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  GoogleService();

  Future<String?> retrieveTokenWithGoogle() async {
    final UserCredential? userCredential = await _retrieveCredentials();
    return await userCredential?.user?.getIdToken();
  }

  Future<UserCredential?> _retrieveCredentials() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      log("Google Sign In cancelado por el usuario");
      return null;
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    return await _auth.signInWithCredential(
      GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      ),
    );
  }

  Future<void> logout() async {
    await _googleSignIn.disconnect();
    await _googleSignIn.signOut();
  }
}
