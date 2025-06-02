import 'package:akgamarra_app/src/core/context/auth_context.dart';
import 'package:akgamarra_app/src/core/service/auth_service.dart';
import 'package:akgamarra_app/src/core/service/session_tag_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class CurrentUserHandler {
  final AuthContext authContext;
  final AuthService authService;
  final SessionTagService sessionTagService;

  CurrentUserHandler(this.authService, this.authContext, this.sessionTagService);

  Future<void> loadSession() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser == null) {
      authContext.clear();
      authContext.markInitialized();
      return;
    }
    loadUser(firebaseUser);
  }

  Future<void> loadUser(User user) async {
    final bearerToken = await user.getIdToken(true);
    final fcmToken = await FirebaseMessaging.instance.getToken();
    if (bearerToken != null && fcmToken != null) {
      final user = await authService.validateToken(bearerToken, fcmToken);
      await sessionTagService.save(bearerToken);
      authContext.setSession(user!, bearerToken);
    } else {
      authContext.clear();
    }
    authContext.markInitialized();
  }
}
