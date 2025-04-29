import 'package:akgamarra_app/src/core/handler/retrieve_products_handler.dart';
import 'package:akgamarra_app/src/core/model/request/retrieve_product_request.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final retrieveProductRequest = RetrieveProductRequest(
      page: 0,
      items: 5,
      target: "Hombres",
      category: "Calzado",
    );
    final retrieveProducts = context.read<RetrieveProductsHandler>();
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: retrieveProducts.retrieve(retrieveProductRequest),
          builder: (context, snapshot) {
            final products = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (snapshot.hasError) context.push("/");
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [Text("xd", style: TextStyle(fontSize: 30))],
            );
          },
        ),
      ),
    );
  }
}
