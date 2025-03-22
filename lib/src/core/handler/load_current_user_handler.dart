import 'package:akgamarra_app/src/core/service/auth_service.dart';
import 'package:akgamarra_app/src/core/store/auth_store.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoadCurrentUserHandler {
  final AuthStore authState;
  final AuthService authService;

  LoadCurrentUserHandler(this.authService, this.authState);

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
