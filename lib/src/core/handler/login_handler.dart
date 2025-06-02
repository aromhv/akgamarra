import 'package:akgamarra_app/src/core/context/auth_context.dart';
import 'package:akgamarra_app/src/core/model/response/user_response.dart';
import 'package:akgamarra_app/src/core/service/auth_service.dart';
import 'package:akgamarra_app/src/core/service/session_tag_service.dart';
import 'package:akgamarra_app/src/core/service/socialmedia/google_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class LoginHandler {
  final AuthContext authState;
  final AuthService authService;
  final GoogleService googleService;
  final SessionTagService sessionTagService;

  LoginHandler(this.authService, this.googleService, this.authState, this.sessionTagService);

  Future<UserResponse?> signIn(String socialMedia) async {
    try {
      final bearerToken = await googleService.retrieveTokenWithGoogle();
      final fcmToken = await FirebaseMessaging.instance.getToken();
      if (bearerToken != null && fcmToken != null) {
        final user = await authService.validateToken(bearerToken, fcmToken);
        await sessionTagService.save(bearerToken);
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
