import 'package:akgamarra_app/src/core/context/auth_context.dart';
import 'package:akgamarra_app/src/core/handler/create_products_handler.dart';
import 'package:akgamarra_app/src/core/handler/current_user_handler.dart';
import 'package:akgamarra_app/src/core/handler/find_by_id_store_handler.dart';
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
import 'package:akgamarra_app/src/core/service/session_tag_service.dart';
import 'package:akgamarra_app/src/core/service/socialmedia/google_service.dart';
import 'package:akgamarra_app/src/core/service/store_service.dart';
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
        Provider<AuthService>(create: (_) => AuthService(dio: dio)),
        Provider<StoreService>(create: (_) => StoreService(dio: dio)),
        Provider<ProductService>(create: (_) => ProductService(dio: dio)),
        Provider<SessionTagService>(create: (_) => SessionTagService(dio: dio)),
        Provider<RetrieveProductService>(create: (_) => RetrieveProductService(dio: dio)),
        Provider<RetrieveProductMetadataService>(create: (_) => RetrieveProductMetadataService(dio: dio)),

        Provider<LoginHandler>(
          create:
              (context) => LoginHandler(
                context.read<AuthService>(),
                context.read<GoogleService>(),
                context.read<AuthContext>(),
                context.read<SessionTagService>(),
              ),
        ),
        Provider<CurrentUserHandler>(
          create: (context) => CurrentUserHandler(context.read<AuthService>(), context.read<AuthContext>(), context.read<SessionTagService>()),
        ),
        Provider<SaveStoreHandler>(create: (context) => SaveStoreHandler(context.read<AuthContext>(), context.read<StoreService>())),
        Provider<RetrieveTagHandler>(create: (context) => RetrieveTagHandler(context.read<AuthContext>(), context.read<StoreService>())),
        Provider<FindByIdStoreHandler>(create: (context) => FindByIdStoreHandler(context.read<AuthContext>(), context.read<StoreService>())),
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
