import 'package:akgamarra_app/src/core/context/auth_context.dart';
import 'package:akgamarra_app/src/core/model/response/user_response.dart';
import 'package:akgamarra_app/src/core/service/socialmedia/google_service.dart';
import 'package:akgamarra_app/src/core/service/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginHandler {
  final AuthContext authState;
  final UserService userService;
  final GoogleService googleService;

  LoginHandler(this.userService, this.googleService, this.authState);

  Future<UserResponse?> signIn(String socialMedia) async {
    try {
      final bearerToken = await googleService.retrieveTokenWithGoogle();
      if (bearerToken != null) {
        final user = await userService.retrieveUser(bearerToken);
        authState.setSession(user!, bearerToken);
        return user;
      }
      return null;
    } catch (e, stacktrace) {
      return null;
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await googleService.logout();
    authState.clear();
  }
}
