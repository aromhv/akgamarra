import 'package:akgamarra_app/src/app/router/app_router.dart';
import 'package:akgamarra_app/src/core/handler/load_current_user_handler.dart';
import 'package:akgamarra_app/src/core/handler/login_handler.dart';
import 'package:akgamarra_app/src/core/service/auth_service.dart';
import 'package:akgamarra_app/src/core/service/socialmedia/google_service.dart';
import 'package:akgamarra_app/src/core/store/auth_store.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/core/option/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final dio = Dio();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthStore>(create: (_) => AuthStore()),

        Provider<Dio>.value(value: dio),

        Provider<AuthService>(create: (_) => AuthService(dio: dio)),
        Provider<GoogleService>(create: (_) => GoogleService()),

        Provider<LoginHandler>(
          create:
              (context) => LoginHandler(
                context.read<AuthService>(),
                context.read<GoogleService>(),
                context.read<AuthStore>(),
              ),
        ),

        Provider<LoadCurrentUserHandler>(
          create:
              (context) => LoadCurrentUserHandler(
                context.read<AuthService>(),
                context.read<AuthStore>(),
              ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final loadCurrentUserService = Provider.of<LoadCurrentUserHandler>(
      context,
      listen: false,
    );
    final authStore = Provider.of<AuthStore>(context);

    if (!authStore.isInitialized) {
      Future.microtask(() => loadCurrentUserService.loadUser());
      return const MaterialApp(
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }
    return MaterialApp.router(routerConfig: router);
  }
}
