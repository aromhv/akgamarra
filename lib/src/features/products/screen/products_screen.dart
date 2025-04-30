import 'dart:developer';

import 'package:akgamarra_app/src/core/handler/retrieve_brands_handler.dart';
import 'package:akgamarra_app/src/features/products/widget/filter_products_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  Widget _buildItem(String item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(item, style: TextStyle(color: Colors.white, fontSize: 18)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final retrieveBrandsHandler = context.read<RetrieveBrandsHandler>();
    final items = [
      "GAAAAAA",
      "GAAAAAAGAAAAAAGAAAAAA",
      "Dsdsd",
      "dsdsdsdsds",
      "dsdsdsdsdsdds",
      "dsdsdsds23e2ds",
    ];

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: Align(
              alignment: Alignment.topCenter,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(),
                children: items.map(_buildItem).toList(),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: FutureBuilder(
              future: retrieveBrandsHandler.retrieve(),
              builder: (context, snapshot) {
                final brands = snapshot.data;
                return FilterProductsWidget(
                  brands: brands,
                  onChangedBrand: (brandSelected) {
                    log("GAAAAAAA");
                    log(brandSelected!);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/*
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
*/
