import 'dart:developer';

import 'package:akgamarra_app/src/core/model/response/user_response.dart';
import 'package:akgamarra_app/src/core/service/auth_service.dart';
import 'package:akgamarra_app/src/core/service/socialmedia/google_service.dart';
import 'package:akgamarra_app/src/core/store/auth_store.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginHandler {
  final AuthStore authState;
  final AuthService authService;
  final GoogleService googleService;

  LoginHandler(this.authService, this.googleService, this.authState);

  Future<UserResponse?> signIn(String socialMedia) async {
    try {
      final _token = await googleService.retrieveTokenWithGoogle();
      final _user = await authService.validateToken(_token!);
      authState.setSession(_user!, _token);
      return _user;
    } catch (e, stacktrace) {
      log("Error: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await googleService.logout();
    authState.clear();
  }
}
