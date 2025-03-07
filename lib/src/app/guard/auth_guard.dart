import 'package:akgamarra_app/src/core/service/login_service.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AuthGuard {
  static String? redirectLogic(BuildContext context, GoRouterState state) {
    final authService = Provider.of<LoginService>(context, listen: false);
    final isAuthenticated = authService.user != null;
    if (isAuthenticated) return '/';
    if (!isAuthenticated && state.matchedLocation != '/login') return '/login';
    return null;
  }
}
