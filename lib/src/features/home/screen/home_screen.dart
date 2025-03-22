import 'package:akgamarra_app/src/core/handler/login_handler.dart';
import 'package:akgamarra_app/src/core/store/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthStore>();
    final loginService = context.read<LoginHandler>();

    final user = authState.user;

    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (user != null) ...[
              Text(
                "Usuario: ${user.alias}",
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 16),
            ],
            ElevatedButton(
              onPressed: () async {
                await loginService.signOut();
                context.go('/login');
              },
              child: const Text("Cerrar sesión"),
            ),
          ],
        ),
      ),
    );
  }
}
