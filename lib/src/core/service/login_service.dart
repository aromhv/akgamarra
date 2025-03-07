import 'dart:developer';

import 'package:akgamarra_app/src/core/model/response/user_response.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginService extends ChangeNotifier {
  final Dio dio = Dio();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserResponse? _user;
  String? _token;

  UserResponse? get user => _user;

  String? get token => _token;

  LoginService() {
    _loadUser();
  }

  Future<void> _loadUser() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser == null) {
      _user = null;
      _token = null;
      notifyListeners();
      return;
    }
    _token = await firebaseUser.getIdToken(true);

    if (_token != null) {
      _user = await getUser(_token);
    } else {
      _user = null;
    }
    notifyListeners();
  }

  Future<UserResponse?> signInWithGoogle() async {
    try {
      await GoogleSignIn().signOut();
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
      _token = await userCredential.user?.getIdToken();
      notifyListeners();

      return await getUser(_token);
    } catch (e) {
      print("Error en signInWithGoogle: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    _user = null;
    _token = null;
    notifyListeners();
  }

  Future<UserResponse?> getUser(String? token) async {
    try {
      log("TOKEN $token");
      Response response = await dio.get(
        'http://192.168.1.6:8080/auth/verify-token',
        options: Options(headers: {"authorization": "Bearer $token"}),
      );
      return UserResponse.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
}
