import 'package:akgamarra_app/src/core/context/auth_context.dart';
import 'package:akgamarra_app/src/core/handler/login_handler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final storeHandler = context.watch<AuthContext>();
    final loginService = context.read<LoginHandler>();

    final user = storeHandler.user;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (user != null) ...[
              Text(
                "Usuario: ${user.alias}",
                style: const TextStyle(fontSize: 24),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
