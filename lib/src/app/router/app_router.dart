import 'package:akgamarra_app/src/app/guard/auth_guard.dart';
import 'package:akgamarra_app/src/bottom_bar_layout.dart';
import 'package:akgamarra_app/src/features/account/screen/account_screen.dart';
import 'package:akgamarra_app/src/features/account/screen/create_account_screen.dart';
import 'package:akgamarra_app/src/features/auth/screen/login_screen.dart';
import 'package:akgamarra_app/src/features/me-store/screen/me_store_screen.dart';
import 'package:akgamarra_app/src/features/notification_sourcing/screen/notification_sourcing_screen.dart';
import 'package:akgamarra_app/src/features/products/screen/create_products_screen.dart';
import 'package:akgamarra_app/src/features/products/screen/products_screen.dart';
import 'package:akgamarra_app/src/features/sourcing/screen/selected_brand_and_name_sourcing_screen.dart';
import 'package:akgamarra_app/src/features/sourcing/screen/sourcing_screen.dart';
import 'package:akgamarra_app/src/features/store-create/screen/create_store_screen.dart';
import 'package:akgamarra_app/src/features/store-create/screen/selected_tag_create_store_screen.dart';
import 'package:akgamarra_app/src/side_bar_layout.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/sourcing',
  redirect: AuthGuard.redirectLogic,
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    ShellRoute(
      builder: (context, state, child) => BottomBarLayout(child: child),
      routes: [
        GoRoute(
          path: '/sourcing',
          builder: (context, state) => SourcingScreen(),
          routes: [GoRoute(path: 'select-brand-and-name', builder: (context, state) => SelectedBrandAndNameSourcingScreen())],
        ),
        GoRoute(path: '/notification_sourcing', builder: (context, state) => NotificationSourcing()),
        GoRoute(path: '/store', builder: (context, state) => const MeStoreScreen()),
        GoRoute(
          path: '/store-create',
          builder: (context, state) => const CreateStoreScreen(),
          routes: [GoRoute(path: 'select-tags', builder: (context, state) => SelectedTagsCreateStoreScreen())],
        ),
        GoRoute(
          path: '/products',
          builder: (context, state) => const ProductsScreen(),
          routes: [GoRoute(path: 'create', builder: (context, state) => CreateProductsScreen())],
        ),
      ],
    ),
    ShellRoute(
      builder: (context, state, child) => SideBarLayout(child: child),
      routes: [
        GoRoute(path: '/profile', builder: (context, state) => const AccountScreen()),
        GoRoute(path: '/complete-data', builder: (context, state) => const CreateAccountScreen()),
      ],
    ),
  ],
);
