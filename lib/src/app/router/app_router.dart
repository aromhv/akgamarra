import 'package:akgamarra_app/src/app/guard/auth_guard.dart';
import 'package:akgamarra_app/src/features/account/screen/account_screen.dart';
import 'package:akgamarra_app/src/features/account/screen/create_account_screen.dart';
import 'package:akgamarra_app/src/features/auth/screen/login_screen.dart';
import 'package:akgamarra_app/src/features/home/screen/home_screen.dart';
import 'package:akgamarra_app/src/features/store/screen/create_store_screen.dart';
import 'package:akgamarra_app/src/features/store/screen/store_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  redirect: AuthGuard.redirectLogic,
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/account',
      routes: [
        GoRoute(
          path: 'create',
          builder: (context, state) {
            return CreateAccountScreen();
          },
        ),
      ],
      builder: (context, state) => const AccountScreen(),
    ),
    GoRoute(
      path: '/store',
      routes: [
        GoRoute(
          path: 'create',
          builder: (context, state) {
            return CreateStoreScreen();
          },
        ),
      ],
      builder: (context, state) => const StoreScreen(),
    ),
  ],
);
