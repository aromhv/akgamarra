import 'package:akgamarra_app/src/core/context/auth_context.dart';
import 'package:akgamarra_app/src/core/handler/create_products_handler.dart';
import 'package:akgamarra_app/src/core/handler/current_user_handler.dart';
import 'package:akgamarra_app/src/core/handler/login_handler.dart';
import 'package:akgamarra_app/src/core/handler/retrieve_brands_handler.dart';
import 'package:akgamarra_app/src/core/handler/retrieve_categories_handler.dart';
import 'package:akgamarra_app/src/core/handler/retrieve_products_handler.dart';
import 'package:akgamarra_app/src/core/handler/retrieve_tags_handler.dart';
import 'package:akgamarra_app/src/core/handler/retrieve_targets_handler.dart';
import 'package:akgamarra_app/src/core/handler/save_store_handler.dart';
import 'package:akgamarra_app/src/core/service/auth_service.dart';
import 'package:akgamarra_app/src/core/service/products/product_service.dart';
import 'package:akgamarra_app/src/core/service/products/retrieve_product_metadata_service.dart';
import 'package:akgamarra_app/src/core/service/products/retrieve_product_service.dart';
import 'package:akgamarra_app/src/core/service/socialmedia/google_service.dart';
import 'package:akgamarra_app/src/core/service/store_service.dart';
import 'package:akgamarra_app/src/core/service/user_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppInitializer extends StatefulWidget {
  final Widget child;

  const AppInitializer({super.key, required this.child});

  @override
  State<AppInitializer> createState() => _AppInitializerState();
}

class _AppInitializerState extends State<AppInitializer> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dio = Dio();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthContext()),

        Provider<Dio>.value(value: dio),
        Provider<GoogleService>(create: (_) => GoogleService()),
        Provider<UserService>(create: (_) => UserService(dio: dio)),
        Provider<AuthService>(create: (_) => AuthService(dio: dio)),
        Provider<StoreService>(create: (_) => StoreService(dio: dio)),
        Provider<ProductService>(create: (_) => ProductService(dio: dio)),
        Provider<RetrieveProductService>(create: (_) => RetrieveProductService(dio: dio)),
        Provider<RetrieveProductMetadataService>(create: (_) => RetrieveProductMetadataService(dio: dio)),

        Provider<LoginHandler>(
          create: (context) => LoginHandler(context.read<UserService>(), context.read<GoogleService>(), context.read<AuthContext>()),
        ),
        Provider<CurrentUserHandler>(create: (context) => CurrentUserHandler(context.read<UserService>(), context.read<AuthContext>())),
        Provider<SaveStoreHandler>(create: (context) => SaveStoreHandler(context.read<AuthContext>(), context.read<StoreService>())),
        Provider<RetrieveTagHandler>(create: (context) => RetrieveTagHandler(context.read<AuthContext>(), context.read<StoreService>())),
        Provider<RetrieveProductsHandler>(
          create: (context) => RetrieveProductsHandler(context.read<AuthContext>(), context.read<RetrieveProductService>()),
        ),
        Provider<RetrieveBrandsHandler>(
          create: (context) => RetrieveBrandsHandler(context.read<AuthContext>(), context.read<RetrieveProductMetadataService>()),
        ),
        Provider<RetrieveTargetsHandler>(
          create: (context) => RetrieveTargetsHandler(context.read<AuthContext>(), context.read<RetrieveProductMetadataService>()),
        ),
        Provider<RetrieveCategoriesHandler>(
          create: (context) => RetrieveCategoriesHandler(context.read<AuthContext>(), context.read<RetrieveProductMetadataService>()),
        ),
        Provider<CreateProductsHandler>(create: (context) => CreateProductsHandler(context.read<AuthContext>(), context.read<ProductService>())),
      ],
      child: widget.child,
    );
  }
}
