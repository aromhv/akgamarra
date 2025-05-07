import 'dart:developer';

import 'package:akgamarra_app/src/core/enum/color_enum.dart';
import 'package:akgamarra_app/src/core/enum/icon_enum.dart';
import 'package:akgamarra_app/src/core/widget/modal/modal_utils.dart';
import 'package:akgamarra_app/src/features/products/widget/card_product_widget.dart';
import 'package:akgamarra_app/src/features/products/widget/modal/filter_products_modal_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> products = [
      " xd",
      "a",
      "dsdsds",
      "Ddddddddddd",
      "xxwxww",
      "1",
      "2",
      "3",
    ];

    List<CardProductWidget> productsToItem(List<String> products) {
      return products
          .map((String product) => CardProductWidget(item: product))
          .toList();
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
                      children: productsToItem(products),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: Row(
            children: [
              FloatingActionButton(
                backgroundColor: ColorEnum.COLOR_SELECTED.color,
                heroTag: "btn1",
                onPressed: () => showFilteredModal(),
                child: IconEnum.ICON_SEARCH.icon,
              ),
              const SizedBox(width: 12),
              FloatingActionButton(
                backgroundColor: ColorEnum.COLOR_SELECTED.color,
                heroTag: "btn2",
                onPressed: () => context.push("/products/create"),
                child: IconEnum.ICON_ADD.icon,
              ),
            ],
          ),
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
          log("filters");
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            //
          },
          child: const Text('Aceptar'),
        ),
      ],
    );
  }
}
