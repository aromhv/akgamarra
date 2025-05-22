import 'package:akgamarra_app/src/core/enum/color_enum.dart';
import 'package:akgamarra_app/src/core/handler/retrieve_products_handler.dart';
import 'package:akgamarra_app/src/core/model/request/retrieve_product_request.dart';
import 'package:akgamarra_app/src/core/model/response/retrieve_product_response.dart';
import 'package:akgamarra_app/src/core/widget/circular_progress_widget.dart';
import 'package:akgamarra_app/src/core/widget/modal/modal_utils.dart';
import 'package:akgamarra_app/src/features/products/widget/buttons_retrieve_product_widget.dart';
import 'package:akgamarra_app/src/features/products/widget/card_product_widget.dart';
import 'package:akgamarra_app/src/features/products/widget/modal/filter_products_modal_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  RetrieveProductRequest request = RetrieveProductRequest(page: 0, brand: null, target: null, category: null);

  @override
  Widget build(BuildContext context) {
    final retrieveProductsHandler = context.read<RetrieveProductsHandler>();

    List<CardProductWidget> productsToItem(List<RetrieveProductResponse>? products) {
      if (products == null || products.isEmpty) return [];
      return products.map((RetrieveProductResponse product) => CardProductWidget(item: product)).toList();
    }

    return Stack(
      children: [
        FutureBuilder(
          future: retrieveProductsHandler.retrieve(request),
          builder: (context, snapshot) {
            final response = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressWidget());
            }
            if (snapshot.hasError || response!.products == null) {
              return Center(child: Text("No hay productos para mostrar :("));
            }
            return Stack(
              children: [
                Container(
                  color: ColorEnum.COLOR_SELECTED.color,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 10,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: GridView.count(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              padding: EdgeInsets.zero,
                              physics: const BouncingScrollPhysics(),
                              children: productsToItem(response.products),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        ButtonsRetrieveProductWidget(
          onPressedClearFilters:
              () async => {
                setState(() {
                  request.page = 0;
                  request.brand = null;
                  request.target = null;
                  request.category = null;
                }),
              },
          onPressedSearch: () async => showFilteredModal(),
          onPressedCreateScreen: () async => context.push("/products/create"),
        ),
      ],
    );
  }

  showFilteredModal() {
    showCustomModal(
      context: context,
      title: 'Busqueda de productos',
      content: FilterProductsModalWidget(
        onChanged: (filters) {
          setState(() {
            request.page = 0;
            request.brand = filters.brand;
            request.target = filters.target;
            request.category = filters.category;
          });
        },
      ),
      actions: [],
    );
  }
}
