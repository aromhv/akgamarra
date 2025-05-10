import 'package:akgamarra_app/src/app/guard/auth_guard.dart';
import 'package:akgamarra_app/src/bottom_bar_layout.dart';
import 'package:akgamarra_app/src/features/account/screen/account_screen.dart';
import 'package:akgamarra_app/src/features/account/screen/create_account_screen.dart';
import 'package:akgamarra_app/src/features/auth/screen/login_screen.dart';
import 'package:akgamarra_app/src/features/home/screen/home_screen.dart';
import 'package:akgamarra_app/src/features/store/screen/create_store_screen.dart';
import 'package:akgamarra_app/src/features/store/screen/store_screen.dart';
import 'package:akgamarra_app/src/side_bar_layout.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  redirect: AuthGuard.redirectLogic,
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    ShellRoute(
      builder: (context, state, child) => BottomBarLayout(child: child),
      routes: [
        GoRoute(path: '/', builder: (context, state) => HomeScreen()),
        GoRoute(
          path: '/store',
          builder: (context, state) => const StoreScreen(),
        ),
        GoRoute(
          path: '/store-create',
          builder: (context, state) => const CreateStoreScreen(),
        ),
      ],
    ),
    ShellRoute(
      builder: (context, state, child) => SideBarLayout(child: child),
      routes: [
        GoRoute(
          path: '/profile',
          builder: (context, state) => const AccountScreen(),
        ),
        GoRoute(
          path: '/complete-data',
          builder: (context, state) => const CreateAccountScreen(),
        ),
      ],
    ),
  ],
);
