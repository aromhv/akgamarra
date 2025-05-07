import 'package:flutter/material.dart';

class CardProductWidget extends StatelessWidget {
  final String item;

  const CardProductWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(
        item,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
