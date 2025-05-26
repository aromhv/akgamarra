import 'package:akgamarra_app/src/app/router/app_router.dart';
import 'package:akgamarra_app/src/core/context/auth_context.dart';
import 'package:akgamarra_app/src/core/handler/current_user_handler.dart';
import 'package:akgamarra_app/src/core/widget/circular_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppWidget extends StatelessWidget {
  const MyAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final authContext = context.watch<AuthContext>();
    final userLoader = context.read<CurrentUserHandler>();
    if (!authContext.isInitialized) {
      Future.microtask(() => userLoader.loadSession());
      return const MaterialApp(home: Scaffold(body: Center(child: CircularProgressWidget())));
    }
    return MaterialApp.router(routerConfig: router);
  }
}
