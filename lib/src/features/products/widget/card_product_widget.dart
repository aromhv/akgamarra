import 'package:akgamarra_app/src/core/model/response/retrieve_product_response.dart';
import 'package:flutter/material.dart';

class CardProductWidget extends StatelessWidget {
  final RetrieveProductResponse item;

  const CardProductWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 140,
        constraints: const BoxConstraints(minHeight: 180),
        decoration: BoxDecoration(color: Colors.grey[200], image: DecorationImage(image: NetworkImage(item.imageUrl), fit: BoxFit.cover)),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.black87, Colors.transparent], begin: Alignment.bottomCenter, end: Alignment.topCenter),
            ),
            child: Text(
              item.name,
              style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
              softWrap: true,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
