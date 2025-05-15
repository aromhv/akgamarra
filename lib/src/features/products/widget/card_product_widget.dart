import 'package:akgamarra_app/src/core/model/response/retrieve_product_response.dart';
import 'package:flutter/material.dart';

class CardProductWidget extends StatelessWidget {
  final RetrieveProductResponse item;

  const CardProductWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.teal, borderRadius: BorderRadius.circular(12)),
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(item.imageUrl, style: const TextStyle(color: Colors.white, fontSize: 18)),
          Text(item.category, style: const TextStyle(color: Colors.white, fontSize: 18)),
          Text(item.name, style: const TextStyle(color: Colors.white, fontSize: 18)),
          Text(item.target, style: const TextStyle(color: Colors.white, fontSize: 18)),
        ],
      ),
    );
  }
}
