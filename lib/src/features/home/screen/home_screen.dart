import 'package:akgamarra_app/src/core/context/auth_context.dart';
import 'package:akgamarra_app/src/core/handler/login_handler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthContext>();
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
              ElevatedButton(
                onPressed: () async {
                  await loginService.signOut();
                  context.go('/login');
                },
                child: const Text("Cerrar sesión"),
              ),

              if (user.roles.contains("trader")) ...[
                if (user.storeId == null) ...[
                  ElevatedButton(
                    onPressed: () {
                      context.go('/context/create');
                    },
                    child: Text("Crear tienda"),
                  ),
                ],
                if (user.storeId != null) ...[
                  ElevatedButton(
                    onPressed: () {
                      context.go('/context');
                    },
                    child: Text("Ver mi tienda"),
                  ),
                ],
              ],
            ],
          ],
        ),
      ),
    );
  }
}
