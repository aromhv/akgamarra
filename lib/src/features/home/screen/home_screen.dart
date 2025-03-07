import 'package:akgamarra_app/src/core/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LoginService>(
        builder: (context, authService, child) {
          final user = authService.user;

          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  (user != null) ? "Usuario: ${user.alias}" : "",
                  style: const TextStyle(fontSize: 24),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await authService.signOut();
                    context.go('/login');
                  },
                  child: Text("Cerrar sesión"),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.go('/');
                  },
                  child: const Text("Ir a Dashboard"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
