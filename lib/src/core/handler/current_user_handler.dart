import 'package:akgamarra_app/src/core/context/auth_context.dart';
import 'package:akgamarra_app/src/core/service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CurrentUserHandler {
  final AuthContext authState;
  final AuthService authService;

  CurrentUserHandler(this.authService, this.authState);

  Future<void> loadUser() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser == null) {
      authState.clear();
      authState.markInitialized();
      return;
    }

    final token = await firebaseUser.getIdToken(true);
    if (token != null) {
      final user = await authService.validateToken(token);
      authState.setSession(user!, token);
    } else {
      authState.clear();
    }
    authState.markInitialized();
  }
}
