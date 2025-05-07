import 'package:akgamarra_app/src/app/router/app_router.dart';
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
import 'package:akgamarra_app/src/core/service/metadata_product_service.dart';
import 'package:akgamarra_app/src/core/service/product_service.dart';
import 'package:akgamarra_app/src/core/service/socialmedia/google_service.dart';
import 'package:akgamarra_app/src/core/service/store_service.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

import 'src/core/option/firebase_options.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseMessaging.instance.requestPermission();
  const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
  const initSettings = InitializationSettings(android: androidInit);
  await flutterLocalNotificationsPlugin.initialize(initSettings);
  FirebaseMessaging.onMessage.listen(
    (RemoteMessage message) => showNotification(message),
  );

  final dio = Dio();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthContext>(create: (_) => AuthContext()),

        Provider<Dio>.value(value: dio),

        Provider<AuthService>(create: (_) => AuthService(dio: dio)),
        Provider<StoreService>(create: (_) => StoreService(dio: dio)),
        Provider<ProductService>(create: (_) => ProductService(dio: dio)),
        Provider<MetadataProductService>(
          create: (_) => MetadataProductService(dio: dio),
        ),
        Provider<GoogleService>(create: (_) => GoogleService()),

        Provider<LoginHandler>(
          create:
              (context) => LoginHandler(
                context.read<AuthService>(),
                context.read<GoogleService>(),
                context.read<AuthContext>(),
              ),
        ),

        Provider<CurrentUserHandler>(
          create:
              (context) => CurrentUserHandler(
                context.read<AuthService>(),
                context.read<AuthContext>(),
              ),
        ),

        Provider<SaveStoreHandler>(
          create:
              (context) => SaveStoreHandler(
                context.read<AuthContext>(),
                context.read<StoreService>(),
              ),
        ),

        Provider<RetrieveTagHandler>(
          create:
              (context) => RetrieveTagHandler(
                context.read<AuthContext>(),
                context.read<StoreService>(),
              ),
        ),

        Provider<FindByIdStoreHandler>(
          create:
              (context) => FindByIdStoreHandler(
                context.read<AuthContext>(),
                context.read<StoreService>(),
              ),
        ),

        Provider<RetrieveProductsHandler>(
          create:
              (context) => RetrieveProductsHandler(
                context.read<AuthContext>(),
                context.read<ProductService>(),
              ),
        ),

        Provider<RetrieveBrandsHandler>(
          create:
              (context) => RetrieveBrandsHandler(
                context.read<AuthContext>(),
                context.read<MetadataProductService>(),
              ),
        ),

        Provider<RetrieveTargetsHandler>(
          create:
              (context) => RetrieveTargetsHandler(
                context.read<AuthContext>(),
                context.read<MetadataProductService>(),
              ),
        ),

        Provider<RetrieveCategoriesHandler>(
          create:
              (context) => RetrieveCategoriesHandler(
                context.read<AuthContext>(),
                context.read<MetadataProductService>(),
              ),
        ),

        Provider<CreateProductsHandler>(
          create:
              (context) => CreateProductsHandler(
                context.read<AuthContext>(),
                context.read<ProductService>(),
              ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

Future<void> showNotification(RemoteMessage message) async {
  final id = int.parse(message.data['id']);
  await flutterLocalNotificationsPlugin.show(
    id,
    message.data['issue'],
    message.data['body'],
    NotificationDetails(
      android: AndroidNotificationDetails(
        'sourcing_channel',
        'solicitudes',
        channelDescription:
            'Notificaciones cuando tus productos coinciden con solicitudes',
        importance: Importance.max,
        priority: Priority.high,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final loadCurrentUserService = Provider.of<CurrentUserHandler>(
      context,
      listen: false,
    );
    final authStore = Provider.of<AuthContext>(context);

    if (!authStore.isInitialized) {
      Future.microtask(() => loadCurrentUserService.loadUser());
      return const MaterialApp(
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }
    return MaterialApp.router(routerConfig: router);
  }
}
