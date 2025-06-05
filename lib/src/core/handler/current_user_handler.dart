import 'package:akgamarra_app/src/core/context/auth_context.dart';
import 'package:akgamarra_app/src/core/service/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CurrentUserHandler {
  final AuthContext authContext;
  final UserService userService;

  CurrentUserHandler(this.userService, this.authContext);

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
    if (bearerToken != null) {
      final user = await userService.retrieveUser(bearerToken);
      authContext.setSession(user!, bearerToken);
    } else {
      authContext.clear();
    }
    authContext.markInitialized();
  }
}
