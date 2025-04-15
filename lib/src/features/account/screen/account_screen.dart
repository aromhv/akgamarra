import 'package:akgamarra_app/src/core/context/auth_context.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final storeHandler = context.read<AuthContext>();

    final user = storeHandler.user;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (user != null && user.verified) ...[
              Text(
                "Nombre: ${user.firstName}",
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                "Apellido: ${user.lastName}",
                style: const TextStyle(fontSize: 16),
              ),
            ],
            if (user != null && !user.verified) ...[
              Text(
                "Alias: ${user.alias}",
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                "Correo: ${user.email}",
                style: const TextStyle(fontSize: 16),
              ),
              ElevatedButton(
                onPressed: () async {
                  context.go('/complete-data');
                },
                child: Text("Completar mis datos"),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
